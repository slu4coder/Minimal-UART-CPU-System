; ---------------------------------------------------------
; Min Programming Language for the 'Minimal Ultra Computer'
;             written by Carsten Herting (slu4)
;
; original version (Minimal UART CPU)     10.02.22-31.05.22
; optimized and ported to the Minimal 64  15.09.22-15.11.22
; tokenized and highly optimized          21.01.23-16.03.23
; ported to the 'Minimal Ultra CPU'       11.09.23-12.09.23
; ---------------------------------------------------------

; LICENSING INFORMATION
; This file is free software: you can redistribute it and/or modify it under the terms of the
; GNU General Public License as published by the Free Software Foundation, either
; version 3 of the License, or (at your option) any later version.
; This file is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
; implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
; License for more details. You should have received a copy of the GNU General Public License along
; with this program. If not, see https://www.gnu.org/licenses/.

; MIN's MEMORY LAYOUT (adapted to the Minimal UART CPU)
; 0x8000 - 0x8fff   4KB text editor 'edit'
; 0x9000 - 0xbfff   12KB MIN source file / tokenized file is approx. half the size
; ---------------
; 0xc000 - 0xdeff   8KB MIN interpreter incl. MIN global state (64 bytes)
; 0xdf00 - 0xe1ff   call dict (256 x 3 bytes)
; 0xe200 - 0xeaff   var dict (256 x 9 bytes)
; 0xeb00 - 0xef7f   local variables and expressions (1152 bytes)
; 0xef92 - 0xefff		use dict (5 x 22 bytes)
; ---------------
; 0xf000 - 0xfeff   4KB OS kernel
; 0xff00 - 0xffff   fast-page
; 0xff00 - 0xfffe   CPU stack memory
; 0xffff            CPU stack pointer (SP)

; --------------------------------------------------------------------------------------
; MAIN PROCEDURE (FILE LOADER, TOKENIZER, INTERPRETER)
; --------------------------------------------------------------------------------------

#org 0xc000			LDI 0xfe STA 0xffff                     			; init stack
								JPS _SkipSpace                                ; command line: skip spaces after 'min <filename>'
								JPS Loader																		; _ReadPtr potentially points to <filename>
								
								LDI 0xff STA g_stop+0 STA g_stop+1						; set "no stop" for tokenizer
								JPS Tokenizer				        									; build tokenized code beyond source code
								
								LDI <firstcall STA g_nextcall+0								; init MIN interpreter global state
								LDI >firstcall STA g_nextcall+1
								LDI <firstvar STA g_nextvar+0
								LDI >firstvar STA g_nextvar+1
								LDI <firstsp STA g_sp+0 STA g_spi+0
								LDI >firstsp STA g_sp+1 STA g_spi+1 INW g_spi
								CLB g_sub CLW g_cnt
								CLB g_haltend CLB g_haltbrk CLB g_haltret
								LDI 0xff STA g_tind														; tind will be 0 upon entering the program block

								LDA _PtrD+0 STA g_pc+0 LDA _PtrD+1 STA g_pc+1	; point program counter to tokenized prg
								JPS Block																			; run program as a Block()

								JPA _Prompt																		; return to OS prompt

; ------------------------------------------------------------------------------------------
; Loads <filename> pointed to by _ReadPtr from SSD into address given in PtrD
; <filename> must be terminated by <= 32
; success: returns A=1, _ReadPtr points beyond <filename>, PtrD points beyond loaded data
; failure: returns A=0, _ReadPtr points to <filename>
; modifies: _ReadPtr, PtrA, PtrB, PtrC (by _FindFile), PtrD (D is not modified by _FindFile)
; ------------------------------------------------------------------------------------------
LoadFileTo:  		     	JPS _FindFile CPI 1 BEQ lf_found   	          ; PtrA0..2 now points to file in active FLASH
												LDI 0 RTS															  ; return a failure (file not found)
	lf_found:           LDI 22 ADW _PtrA JPS _FlashPtrA                ; search for bytesize of file
                      LDR _PtrA STA _PtrB+0 INW _PtrA JPS _FlashPtrA ; bytesize -> PtrB (PtrA now points to data)
                      LDR _PtrA STA _PtrB+1 INW _PtrA JPS _FlashPtrA
  lf_loadloop:        DEW _PtrB BCC lf_success                      ; done with copying?
                        LDR _PtrA STR _PtrD													; load byte from FLASH, store byte in RAM
                        INW _PtrD INW _PtrA JPS _FlashPtrA
												JPA lf_loadloop
  lf_success:         LDI 1 RTS                                 ; switch off FLASH

; --------------------------------------------------------------------------------------
; ERROR HANDLING (ERROR NUMBER, LINE NUMBER)
; --------------------------------------------------------------------------------------

; Frontend for run-time error handling within the *tokenized* code (finds pos in source)
; Intended to be called via 'JPA Error' and *not* via 'JPS Error'.
; push: errortext_lsb, errortext_msb
; pull: not necessary, exits to _Prompt
Error:					LDA g_pc+0 STA g_stop+0 LDA g_pc+1 STA g_stop+1							; run tokenizer until "stop" position
								JPS Tokenizer																								; now g_pc points at error in source code
								JPA SourceError																							; pull A back into A

; Outputs an error text and the current line number corresponding to g_pc within the *source* code 
; Intended to be called via 'JPA' and *not* via 'JPS'. Exits to _Prompt with CPU stack reset.
; push: errortext_lsb, errortext_msb
; pull: not necessary, exits to _Prompt
SourceError:		JPS PrintEnter
								LDA srcptr+0 PHS LDA srcptr+1 PHS JPS _Print PLS PLS				; print filename
								JPS PrintEnter
								JPS _Print PLS PLS																					; print specific error text
								LDI <InLineMsg PHS LDI >InLineMsg PHS JPS _Print PLS PLS		; " in line "
								LDA g_line+0 STA intA+0 LDA g_line+1 STA intA+1							; move line number into intA
								JPS int_tostr																								; convert line number in intA to string
								LDA strptr+0 PHS LDA strptr+1 PHS JPS _Print PLS PLS				; print line number
								JPS PrintEnter
								; find and print out erroneous row
								LDA g_pc+0 STA intA+0 LDA g_pc+1 STA intA+1                 ; use intA as pointer
  se_loop:      DEW intA CPI >file BNE se_infile                            ; one step back
                  LDA intA+0 CPI <file BEQ se_start                         ; reached start of file area?
  se_infile:    LDR intA CPI 10 BNE se_loop
                  INW intA                                                  ; do not show leading RETURN
  se_start:     LDR intA OUT JPS _Wait
                INW intA CPA g_pc+1 BCC se_start
                  LDA intA+0 CPA g_pc+0 BCC se_start
                    LDI <QuestionMsg PHS LDI >QuestionMsg PHS JPS _Print PLS PLS
                    JPA _Prompt																							; exit to OS prompt (does stack reset)

	PrintEnter:		LDI 10 OUT JPS _Wait RTS

; --------------------------------------------------------------------------------------
; LOADER AND TOKENIZER
; --------------------------------------------------------------------------------------

; -----------------------------------------------------------
; loads filename at _ReadPtr into _PtrD
; advances _PtrD and generates an entry to the sources vector
; -----------------------------------------------------------
LoadFile:				LDA _PtrD+0 STR g_nextsrc INW g_nextsrc				; emplace first source addr into "sources" vector
								LDA _PtrD+1 STR g_nextsrc INW g_nextsrc
								LDA g_nextsrc+0 STA snameptr+0								; filename pointer in "sources"
								LDA g_nextsrc+1 STA snameptr+1
								LDA _ReadPtr+0 STA intA+0											; remember filename start
								LDA _ReadPtr+1 STA intA+1
								JPS LoadFileTo                              	; load filename in _ReadPtr into _PtrD location
								CPI 1 BEQ foundfile                          	; file found? -> run now with file loaded
									LDI <NotFoundMsg PHS LDI >NotFoundMsg PHS   ; EXIT with "File not found" error
									JPS _Print PLS PLS
	nameerrloop:		LDR _ReadPtr CPI 33 BCC returnchar
										CPI '"' BEQ returnchar
											OUT JPS _Wait
											INW _ReadPtr JPA nameerrloop
	returnchar:			LDI 10 OUT JPS _Wait
									JPA _Prompt
	foundfile:		LDA _ReadPtr+0 SBA intA+0 STA intB+0					; calc filename byte count -> intB+0
	snameloop:		DEB intB+0 BCC finalizesrc										; some filename chars to write?
									LDR intA STA																; copy filename into sources vector
	snameptr:				0xffff
									INW intA INW snameptr JPA snameloop
	finalizesrc:	LDI 0 STR snameptr														; finalize the name in "sources"
								LDI 20 ADW g_nextsrc													; finalize "sources" entry
								RTS

Loader:					LDI <firstsrc STA g_nextsrc+0									; init "sources" vector
								LDI >firstsrc STA g_nextsrc+1
								LDI <file STA _PtrD+0 STA g_pc+0 							; init _PtrD (points beyond last source file)
								LDI >file STA _PtrD+1 STA g_pc+1							; init g_pc (used by Loader to parse for "use ...")
								LDR _ReadPtr CPI 33 BCS appendfile 	          ; load first source from commandline or use text?
									LDI <file STR g_nextsrc INW g_nextsrc				; emplace first source addr into "sources" vector
									LDI >file STR g_nextsrc INW g_nextsrc
									LDI 0 STR g_nextsrc													; null name in "sources"
									LDI 20 ADW g_nextsrc												; finalize "sources" entry
    dst_loop:   	LDR _PtrD CPI 0 BEQ found_zero							; look for 0 in source file
                  	INW _PtrD JPA dst_loop
    found_zero: 	INW _PtrD JPA loader_while                  ; _PtrD now points beyond source file
	appendfile:		JPS LoadFile

								; scan for more files to "use"
	loader_while:	LDA g_pc+1 CPA _PtrD+1 BCC loader_loop BGT loader_rts
									LDA g_pc+0 CPA _PtrD+0 BCS loader_rts
	loader_loop:			LDR g_pc CPI 'u' BEQ loader_use
		loader_not:				INW g_pc JPA loader_while								; else g_pc++
		loader_use:			INW g_pc LDR g_pc CPI 's' BNE loader_not
											INW g_pc LDR g_pc CPI 'e' BNE loader_not
												INW g_pc JPS Next LDR g_pc CPI '"' BNE loader_not
													INW g_pc LDA g_nextsrc+1 CPI >endsrc BCS loader_full
														LDA g_pc+0 STA _ReadPtr+0
														LDA g_pc+1 STA _ReadPtr+1
														JPS LoadFile
														LDA _ReadPtr+0 STA g_pc+0
														LDA _ReadPtr+1 STA g_pc+1
														JPA loader_while
	loader_full:	LDI <MaxFileMsg PHS LDI >MaxFileMsg PHS
								JPS _Print PLS PLS
								JPA _Prompt
	loader_rts:		RTS

Tokenizer:      CLB vid CLB cid																; start var and call tokens from 0
                LDA _PtrD+0 STA dst+0 LDA _PtrD+1 STA dst+1 	; set dst as working destination pointer
								LDI <newitems STA itnext+0										; top end of tokenizer items (keywords, vars, calls)
								LDI >newitems STA itnext+1										; points beyond keyword items

								LDA g_nextsrc+1 STA srcptr+1
								LDA g_nextsrc+0 STA srcptr+0
								LDI 2 ADW srcptr															; go up to ->name
								
	t_srcwhile:		LDI 24 SBW srcptr															; go down to last src->ptr
								LDA srcptr+0 CPI <firstsrc BCC t_endreached		; is this still a valid entry?
									LDR srcptr STA g_pc+0 INW srcptr						; extract ->ptr to source code
									LDR srcptr STA g_pc+1 INW srcptr						; srcptr now points to filename (for error)
									LDI 1 STA g_line+0 CLB g_line+1							; set line number to 1

	t_while:			JPS Look CPI 0 BEQ t_srcwhile									; get next char (ignoring #...)
									
									LDR g_pc CPI 'u' BNE t_measure							; overlook 'use "..."' commands
										LDA g_pc+0 PHS LDA g_pc+1 PHS							; push current PC
										INW g_pc LDR g_pc CPI 's' BNE t_pcback
											INW g_pc LDR g_pc CPI 'e' BNE t_pcback
												INW g_pc JPS Next
												LDR g_pc CPI '"' BNE t_pcback						; now we have found a "...
		t_eatname:						INW g_pc LDR g_pc CPI 0 BEQ t_pcback
														CPI 10 BEQ t_pcback
															CPI '"' BNE t_eatname
																INW g_pc JPS Next							; skip potential spaces until end of line
																JPA t_pckeep
									
		t_pcback:			PLS STA g_pc+1 PLS STA g_pc+0 JPA t_measure	; go back to "u..."
		t_pckeep:				PLS PLS
		t_measure:		CLB ind																			; measure indentation
		t_indloop:		JPS Look CPI ' ' BEQ t_indent								; SPACE +1
										CPI 9 BNE t_inddone												; TAB +2
										INB ind
			t_indent:		INB ind INW g_pc JPA t_indloop							; count indent, consume and look for more indent
			t_inddone:	LDA ind LSR BCS t_inderror									; uneven spaces = error
										CPI 30 BLE t_indokay											; indent <= 30?
			t_inderror:			LDI <error11 PHS LDI >error11 PHS JPA SourceError		; error "invalid indent"
			t_indokay:	NOT DEC STA ind															; code indentation range -1..30 -> 0xff..0xe0

									JPS Next CPI 0 BEQ t_srcwhile								; break if EOF

									LDR g_pc CPI 10 BNE t_notenter							; is this a non-empty line?
										INW g_line INW g_pc JPA t_while						; else move over \n without copy, count \n & continue

																															; START OF NON_EMPTY LINE
		t_notenter:		LDA ind STR dst INW dst											; write indentation marker

																															; START OF LINE PROCESSING

		t_lineloop:		LDI '0' PHS LDI 'x' PHS JPS TakeTwo PLS PLS	; HEX: 0x = 0x0 = 0x00 = 0x000 = 0x0000 will mean zero
									CPI 0 BEQ t_next0
										CLW intA CLB intB													; use intA for result, intB for counting digits
			t_getchar:    LDR g_pc                 									; input lesen
										CPI 'f' BGT t_writeconst 	      					; above f?
										CPI 'a' BCS t_hxletter            				; a..f?
										CPI '9' BGT t_writeconst   	    					; above 9?
										CPI '0' BCS t_hxzahl              				; 0..9?
											JPA t_writeconst
			t_hxletter:     SBI 39																	; 39 + 48 = 97 = 'a'
			t_hxzahl:       SBI 48																	; 48 = '0'
										PHS INB intB
										LLW intA LLW intA LLW intA LLW intA				; shift up 4 bits
										PLS ADB intA+0 INW g_pc JPA t_getchar   	; add new hex nibble (carry cannot happen)

			t_next0:		LDI '+' PHS LDI '=' PHS JPS TakeTwo PLS PLS
									CPI 0 BEQ t_nexta LDI 'a' JPA t_puttoken		; fast increment
			t_nexta:		LDI '-' PHS LDI '=' PHS JPS TakeTwo PLS PLS
									CPI 0 BEQ t_next1 LDI 's' JPA t_puttoken		; fast decrement
			t_next1:		LDI '=' PHS LDI '=' PHS JPS TakeTwo PLS PLS
									CPI 0 BEQ t_next2 LDI 0xd3 JPA t_puttoken
			t_next2:		LDI '!' PHS LDI '=' PHS JPS TakeTwo PLS PLS
									CPI 0 BEQ t_next3 LDI 0xd4 JPA t_puttoken
			t_next3:		LDI '<' PHS LDI '<' PHS JPS TakeTwo PLS PLS
									CPI 0 BEQ t_next4 LDI 0xdd JPA t_puttoken
			t_next4:		LDI '<' PHS LDI '=' PHS JPS TakeTwo PLS PLS
									CPI 0 BEQ t_next5 LDI 0xd5 JPA t_puttoken
			t_next5:		LDI '>' PHS LDI '>' PHS JPS TakeTwo PLS PLS
									CPI 0 BEQ t_next6 LDI 0xde JPA t_puttoken
			t_next6:		LDI '>' PHS LDI '=' PHS JPS TakeTwo PLS PLS
									CPI 0 BEQ t_next7 LDI 0xd6 JPA t_puttoken

			t_next7:		LDR g_pc																			; look at single source char instead
									CPI '<' BNE t_next8 INW g_pc LDI 0xd2 JPA t_puttoken
			t_next8:		CPI '>' BNE t_next9 INW g_pc LDI 0xd7 JPA t_puttoken

			t_next9:		CPI '"' BNE t_next10													; "STRING"
										STR dst INW dst INW g_pc										; write and consume "
				t_string:		LDR g_pc CPI '"' BEQ t_strclose							; close and consume "
											CPI 0 BEQ t_strbail CPI 10 BEQ t_strbail	; close without consuming on 0 and 10
												JPS TakeOrd STR dst INW dst							; consume and store (special) char
												JPA t_string
				t_strclose:		INW g_pc																	; consume source char
				t_strbail:		LDI '"' STR dst INW dst JPA t_stopcheck

			t_next10:		CPI '0' BCC t_next11 CPI '9' BGT t_next11			; DEC: CHECK FOR DIGIT 0-9
										CLW intA
			t_digloop:		LLW intA STA intB+1 LDA intA+0 STA intB+0   ; A x 2 -> B
										LLW intA LLW intA                           ; A x 8
                    LDA intB+1 ADB intA+1 LDA intB+0 ADW intA		; A -> A x 10
										LDR g_pc SBI '0' ADW intA INW g_pc					; reload, add & consume the digit
										LDR g_pc CPI '0' BCC t_writeconst
											CPI '9' BLE t_digloop											; read next digit 0-9

			t_writeconst:				LDI 0xd0 STR dst INW dst							; ... write word TN_CONST
													LDA intA+0 STR dst INW dst
													LDA intA+1 STR dst INW dst
													JPA t_stopcheck

			t_next11:		CPI ',' BNE t_next12 INW g_pc JPA t_continue	; omit these characters, stop check not needed
			t_next12:		CPI ';' BNE t_next13 INW g_pc JPA t_continue
			t_next13:		CPI ':' BNE t_next14 INW g_pc JPA t_continue

			t_next14:		JPS TakeAlNum CPI 0 BEQ t_else									; reads AlNum into itnext using alptr
										CPI 14 BCC t_alnumok
											LDI <error01 PHS LDI >error01 PHS JPA SourceError	; string too long => error "invalid var/call"
				t_alnumok:	LDI <items STA itptr+0 LDI >items STA itptr+1 ; point at start of items dictionary

					t_alloop:	LDA itptr+0 STA strcmp_a+0 LDA itptr+1 STA strcmp_a+1		; vgl. string @ itptr mit string @ itnext
										LDA itnext+0 STA strcmp_b+0 LDA itnext+1 STA strcmp_b+1		
										JPS strcmp CPI 0 BEQ t_alentry								; found? itptr then points to that entry
											LDI 16 ADW itptr CPA itnext+1 BNE t_alloop	; no match => check next entry
												LDA itptr+0 CPA itnext+0 BNE t_alloop
													LDI 14 ADW itnext												; reached itptr == itnext, keep name
													JPS Next CPI '(' BNE t_variable					; END REACHED w/o match: make it a new item
														LDI 'S' STR itnext INW itnext					; write call
														LDA cid STR itnext INW itnext					; itnext points to free item now
														INB cid JPA t_idcheck
					t_variable:			LDI 'V' STR itnext INW itnext
													LDA vid STR itnext INW itnext						; itnext points to free item now
													INB vid
					t_idcheck:			CPI 0xe0 BCC t_alentry									; don't let these numbers be confused with indents
														LDI <error07 PHS LDI >error07 PHS JPA SourceError	; error "too many tokens"
			t_alentry:		LDI 14 ADW itptr															; itptr points to start of relevant entry
										LDR itptr STR dst INW itptr INW dst						; write token
										LDR itptr CPI 0xff BEQ t_stopcheck						; do not store invalid ID (as used for keywords)
											JPA t_puttoken															; and write id != 0xff

			t_else:			LDR g_pc PHS INW g_pc PLS 											; else *dst++ = *g_pc++ write anything else

		t_puttoken:		STR dst INW dst																; DO THE STOP CHECK IN ANY CASE
		t_stopcheck:	LDA dst+1 CPA g_stop+1												; if (dst >= stop) return;
									BCC t_continue BGT t_rts
										LDA dst+0 CPA g_stop+0 BCS t_rts						; MSBs are equal

		t_continue:		JPS Next
									CPI 10 BEQ t_while CPI 0 BEQ t_while					; line ends?
										JPA t_lineloop															; line goes on

	t_endreached:	LDI 0xff STR dst
  t_rts:        RTS

	srcptr:				0xffff																					; pointer into sources dict (vector)
  itnext:  	    0xffff																					; init to "beyond keywords"
  itptr:				0xffff																					; used as item search pointer
	ind:					0xff																						; measured indentation
	dst:          0xffff																					; destination (write) pointer
  vid:        	0xff																						; ids of var and call identifiers
  cid:        	0xff

; --------------------------------------------------------------------------------------
; TOKENIZER PARSING ROUTINES
; --------------------------------------------------------------------------------------

; compares string at 'strcmp_b' and 'strcmp_a' for equality
; returns: A=0: equal, A=1: not equal
strcmp:					LDA
	strcmp_b:			0xffff
								CPA
	strcmp_a:			0xffff                         								; self-modifying code
                BNE strcmpfalse CPI 0 BEQ strcmpexit
									INW strcmp_a INW strcmp_b
									JPA strcmp
	strcmpfalse:	LDI 1
	strcmpexit:		RTS

; returns current character in A including '\0' and '\n' but omitting any # comments
; modifies: g_pc
Look:						LDR g_pc CPI '#' BNE lookexit									; returns next character, ignores comments
	lookcomment:		INW g_pc LDR g_pc
									CPI 0 BEQ lookexit													; ENDMARKER
									CPI 10 BNE lookcomment											; NEWLINE
	lookexit:			RTS

; returns in A the next non-shite-space character including '\0' and '\n' but omitting # comments
; modifies: g_pc
Next:						JPS Look
								CPI ' ' BEQ nexttake			; ' '
									CPI 9 BEQ nexttake			; '\t'
										CPI 13 BEQ nexttake		; '\r'
											RTS
	nexttake:			INW g_pc JPA Next

; takes (specical) character including '\n' or '\e', returns result in A
; NOTE: 0, 10 and " have to be checked before!
TakeOrd:				LDR g_pc CPI '\' BNE takeordret
									INW g_pc LDR g_pc															; look at next character
									CPI 0 BEQ takeordexit CPI 10 BEQ takeordexit	; exit without consuming 0 or \n
	takeo0:						CPI 'r' BNE takeo1 LDI 13 JPA takeordret
	takeo1:						CPI 'n' BNE takeo2 LDI 10 JPA takeordret
	takeo2:						CPI 't' BNE takeo3 LDI 9 JPA takeordret
	takeo3:						CPI 'e' BNE takeo4 LDI 27 JPA takeordret
	takeo4:						CPI '0' BNE takeordret LDI 0
	takeordret:			PHS INW g_pc PLS RTS
	takeordexit:	LDI '\' RTS

; Takes two consecutive chars if matching (result = 1), else result = 0
; push: first char, second char
; pull #, result
TakeTwo: 				LDS 4 CPR g_pc BNE firstfalse
									INW g_pc
									LDS 3 CPR g_pc BNE secondfalse
										INW g_pc LDI 1 STS 4 RTS
	secondfalse:	DEW g_pc																			; move back again
	firstfalse: 	LDI 0 STS 4 RTS																; return "false"

; takes an alnum into 'itnext' position
; 'alptr' then points beyond the zero-termination, stores length in 'alcount' and A
TakeAlNum:			LDA itnext+0 STA alptr+0 LDA itnext+1 STA alptr+1	; init alptr
								CLB alcount LDR g_pc															; first char needs no be an alpha
								CPI 'z' BGT takeaout															; one above 'z'
								CPI 'a' BCS takeisa
								CPI 'Z' BGT takeaout															; one above 'Z'
								CPI 'A' BCC takeaout
	takeisa:				STR alptr INW alptr INW g_pc INB alcount		    ; store the char and continue
	takeanloop:		LDR g_pc																					; consecutive chars
								CPI 'z' BGT takeaout
								CPI 'a' BCS takeisa
								CPI 'Z' BGT takeaout
								CPI 'A' BCS takeisa
								CPI '9' BGT takeaout															; one above '9'
								CPI '0' BCS takeisa
	takeaout:				LDI 0 STR alptr INW alptr
									LDA alcount RTS														    	; set null termination

	alcount:		0x00
	alptr:			0x0000

; --------------------------------------------------------------------------------------
; 16-BIT MATH LIBRARY
; --------------------------------------------------------------------------------------

intA:				    0x0000				; MATH REGISTERS
intB:				    0x0000
intC:				    0x0000, 0x00	; used as modifiable copy
intD:				    0x0000				; only used by div
intcount:	  	  0x00
intflag:		  	0x00

; signed multiplication
int_mul:				LDA intA+0 STA intC+0 LDA intA+1 STA intC+1		; copy A factor into C (C will be shifted right)
								CLW intA
								LDI 16 STA intcount
  multloop:			LDA intC+1 ROR STA intC+1			; shift C one step right
								LDA intC+0 ROR STA intC+0			; lowest bit is now in carry flag
								BCC multbitoff
									LDA intB+0 ADW intA+0 LDA intB+1 ADB intA+1	; adds current B to accumulator A								
  multbitoff:		LLW intB                      ; increase the value of B with shift left one step left
								DEB intcount BNE multloop
									RTS

int_div:				CLB intflag											; clear the sign byte
								LDA intA+1 CPI 0 BPL divanotneg		; make A and B positive, evaluate the sign of result
									INB intflag NEW intA						; store a sign, negate A									; 
	divanotneg:		LDA intB+1 CPI 0 BPL divbnotneg
									INB intflag NEW intB						; store a(nother) sign, negate B
	divbnotneg:		LDA intB+0 STA intB+1 CLB intB+0	; move the lower half of B to upper half, clear lower half
								CLW intD													; clear result E
								LDI 8 STA intcount								; pre-init the shiftcounter (needs modification below)
	divup:				LDA intB+1 LSL BMI divloop				; ist oberstes bit vom B schon 'ganz oben'?
									STA intB+1 INB intcount JPA divup ; increase number of shifts and shift upper B one step up									
	divloop:			LDA intA+0 STA intC+0 LDA intA+1 STA intC+1		; copy A to C
								LDA intB+0 SBW intA+0 BCC divcarry0 LDA intB+1 SBB intA+1 BCS divresult		; A = A - B (B fits in A => shift '1' into E)
	divcarry0:			LDA intC+0 STA intA+0 LDA intC+1 STA intA+1	; restore A from C (B does not fit in A => shift '0' into E)
	divresult:		RLW intD                          ; E = E<<1 | C (1: B fit in A, 0: B does not fit into A)
                LDA intB+1 LSR STA intB+1					; shift B one step down
								LDA intB+0 ROR STA intB+0
								DEB intcount BCS divloop
									LDA intD+0 STA intA+0						; move result back into A
									LDA intD+1 STA intA+1
									LDA intflag LSR BCC divallnotneg
										NEW intA
	divallnotneg:		RTS

int_lsl:  			LDA intB+0 CPI 0 BEQ intlsldone
                	BPL intlslpos
										NEG JPA intlsrpos
	intlslpos:			STA intcount
	intlslloop:			LLW intA DEB intcount BGT intlslloop
	intlsldone:				RTS

int_lsr:  			LDA intB+0 CPI 0 BEQ intlsrdone
                	BPL intlsrpos
										NEG JPA intlslpos
	intlsrpos:			STA intcount
	intlsrloop:			LDA intA+1 LSR STA intA+1
                	LDA intA+0 ROR STA intA+0
                	DEB intcount BGT intlsrloop
  intlsrdone:     	RTS

; strptr points to a null-terminated string
; modifies: intC
int_tostr:			CLB int_str
								LDA intA+0 STA intC+0								; PRINT A 16-BIT REGISTER AS DEC NUMBER
								LDA intA+1 STA intC+1								; copy A to working reg C so A remains unchanged
								ROL BCC int_notneg
									NEW intC LDI '-' STA int_str      ; negative sign
	int_notneg:		LDI <int_str+5 STA strptr+0			    ; point to last digit of output string
								LDI >int_str+5 STA strptr+1
	int_start:		CLB intC+2 	                    		; clear upper register and carry store
                LDI 16 STA intcount
	int_shift:		LDA intC+2 ROL		  								; activate C stored in bit 7 (initially = 0)
                RLW intC RLB intC+2                 ; shift C back in and shift everything one step left
                CPI 10 BCC int_done									; 10 did not fit in => do not set bit 7 as "carry"
									ADI 118 STA intC+2			        	; 10 went into it => subtract 10 and set bit 7 as "carry" (-10 +128)
	int_done:		  DEB intcount BNE int_shift
                  LDA intC+2 CPI 0 BPL int_nocarry	; erase a possible stored carry
										SBI 0x80
	int_nocarry:  	ADI '0' STR strptr DEW strptr   	; store remainder as char
									LDA intC+2 ROL			  						; restore stored carry flag
                  RLW intC                          ; shift in C and shift everything one step up
                  RLB intC+2                        ; shift C into 'remember' and shift an old carry out
                  LDI 0 CPA intC+0 BNE int_start    ; prüfe nach, ob big register null enthält
									  CPA intC+1 BNE int_start
            					LDA int_str CPI '-' BNE int_out
												STR strptr RTS
	int_out:						INW strptr RTS
	int_str:		  '-32768', 0
	strptr:				0x0000

; ------------------------------------------------------------------------------------------------
; INTERPRETER: SUPPORTING FUNCTIONS
; ------------------------------------------------------------------------------------------------

; Reads an element of the math stack (int or char -> int, depending on g_type) into intA
get:						LDA g_type CPI 2 BEQ getint
									LDR g_sp STA intA+0				;						; load char and cast to int in C-style
									LSL BCS getminus
										CLB intA+1 RTS
	getminus:				LDI 0xff STA intA+1 RTS
	getint:				LDR g_sp STA intA+0						; load int
								LDR g_spi STA intA+1
								RTS

; Reads an element of the math stack (int or char -> int, depending on g_type) into intB
getB:						LDA g_type CPI 2 BEQ getBint
									LDR g_sp STA intB+0										; load char and cast to int in C-style
									LSL BCS getBminus
										CLB intB+1 RTS
	getBminus:			LDI 0xff STA intB+1 RTS
	getBint:			LDR g_sp STA intB+0											; load int
								LDR g_spi STA intB+1
								RTS

; Put intA as single-element value on math stack. Requires 'g_type' to be set to desired type.
put:						CLB g_cnt+1 LDI 1 STA g_cnt+0 					; set element count to one in any case
								CPA g_type BEQ putchar
									LDA intA+1 STR g_spi									; store single int
	putchar:			LDA intA+0 STR g_sp
								RTS

; Enforces that a specific char is consumed, throws an error otherwise
AssertCSquare:	LDR g_pc CPI ']' BEQ asstrue
                  LDI <error30 PHS LDI >error30 PHS JPA Error
AssertORound:		LDR g_pc CPI '(' BEQ asstrue
                  LDI <error31 PHS LDI >error31 PHS JPA Error
AssertCRound:		LDR g_pc CPI ')' BEQ asstrue
                  LDI <error32 PHS LDI >error32 PHS JPA Error
AssertEquals:		LDR g_pc CPI '=' BEQ asstrue
                  LDI <error33 PHS LDI >error33 PHS JPA Error
	asstrue:			INW g_pc RTS

; skips code until indentation <= target indentation or ENDMARKER is reached
	gotadvance:		INW g_pc
SkipStmt:				LDR g_pc CPI 0xe0 BCS gotindent			; move over current line until next indent is found
									CPI 0xd0 BNE gotadvance
										LDI 3 ADW g_pc JPA SkipStmt			; hop over numbers like 254 that might look like fake indent
	gotindent:		NOT DEC STA g_mind INW g_pc					; leaves with MEASURED and consumed indentation
								LDA g_tind CPA g_mind BMI SkipStmt
								RTS

; --------------------------------------------------------------------------------------
; CALL AND VAR HANDLER
; --------------------------------------------------------------------------------------

; Search var dictionary for *latest* match. Returns pointer to variable *type* data.
; push: #, var_id
; pull: var_msb, var_lsb
getVar:					LDA g_nextvar+0 STA getptr+0									; copy var top ptr
								LDA g_nextvar+1 STA getptr+1
	varnext:			LDI 9 SBW getptr															; move down one var
								CPI >firstvar BCS varokay											; MSB below start of var dict? -> end search
	varerror:				LDI <error01 PHS LDI >error01 PHS JPA Error	; error "undefined var"
	varokay:			LDS 3 CPR getptr BNE varnext									; matching ID?
									INW getptr LDR getptr CPA g_sub BEQ var_ok	; advance to vp->sub
										CPI 0xff BEQ var_ok												; check for "global"
											LDI 10 SBW getptr												; not the right sub level => down one var
											CPI >firstvar BCS varokay
												JPA varerror
	var_ok:				INW getptr																		; advance to ->type data
								STS 3 LDA getptr+0 STS 4											; put var ptr to type on stack
								RTS

getptr:					0xffff																				; get access pointer

; search call dictionary for *latest* match
; push: #, call_id
; pull: pc_msb, pc_lsb
getCall:				LDA g_nextcall+0 STA getptr+0								  ; copy call top ptr
								LDA g_nextcall+1 STA getptr+1
	callnext:			LDI 3 SBW getptr															; move down one call
								CPI >firstcall BCS callokay										; stop below first call
									LDI <error01 PHS LDI >error01 PHS JPA Error	; error "undefined call"
	callokay:			LDS 3 CPR getptr BNE callnext
									INW getptr LDR getptr STS 4								  ; put call jump address on stack
									INW getptr LDR getptr STS 3
									RTS

; --------------------------------------------------------------------------------------
; EXPRESSIONS
; --------------------------------------------------------------------------------------

Factor:					CLB g_refset LDR g_pc                         				; use default referenced element size 1

								CPI 0xd0 BNE fac_next2																; TN_INT_CONST
									INW g_pc LDI 2 STA g_type
									LDI 1 STA g_cnt+0 CLB g_cnt+1												; single int
									LDR g_pc STR g_sp INW g_pc
									LDR g_pc STR g_spi INW g_pc
									RTS

fac_next2:			CPI '&' BNE fac_next3													    		; VARIABLE
									PHS INW g_pc																    		; push & consume '&'
									LDR g_pc CPI 'V' BEQ fac_isvar
										LDI <error05 PHS LDI >error05 PHS JPA Error				; error "Invalid expression"
fac_next3:			CPI 'V' BNE fac_next4
									PHS																					    		; push 'V'
	fac_isvar:			INW g_pc																						; consume, either 'V' or '&' was pushed above
                  LDR g_pc PHS PHS INW g_pc JPS getVar				    		; get & consume variable ID, push v->type on stack
                  PLS STA facptr+1 PLS STA facptr+0										; load var item onto stack:
									LDR facptr PHS INW facptr														; ->type
									LDR facptr PHS INW facptr LDR facptr PHS INW facptr	; ->cnt
									LDR facptr PHS INW facptr LDR facptr PHS						; ->ptr
									LDR g_pc CPI '[' BNE fac_fullvar						  			; [|] OPERATOR PRESENT?
										
										; PARSE [|] OPERATOR
										INW facptr LDR facptr PHS INW facptr LDR facptr PHS	; ->max is also needed
										LDI 0 PHS PHS LDS 8 PHS LDS 8 PHS									; push "start", "anz" = ->cnt
										INW g_pc LDR g_pc CPI '|' BNE fac_nopipe 					; consume [, parse for |
											INW g_pc LDR g_pc CPI ']' BEQ fac_closed
												JPS Expr JPS get
												LDA intA+0 STS 2 LDA intA+1 STS 1							; set "anz"
												LSL BCC fac_closed														; anz < 0 => error
													JPA fac_error
	fac_nopipe:				JPS Expr JPS get
										LDA intA+0 STS 4 LDA intA+1 STS 3									; set "start"
										LSL BCS fac_error																	; start < 0 => error
											LDR g_pc CPI '|' BNE fac_nopipe2
												INW g_pc LDR g_pc CPI ']' BNE fac_else
													LDS 1 STA intA+1 LDS 2 STA intA+0
													LDS 3 SBB intA+1 LDS 4 SBW intA
													LDA intA+0 STS 2 LDA intA+1 STS 1
													LSL BCC fac_closed													; anz = anz - start < 0 => error
														JPA fac_error
			fac_else:					JPS Expr JPS get
													LDS 3 SBB intA+1 LDS 4 SBW intA
													LDA intA+0 STS 2 LDA intA+1 STS 1
													LSL BCC fac_closed													; anz = end - start < 0 => error
														JPA fac_error
		fac_nopipe2:			LDI 1 STS 2 LDI 0 STS 1													; set "anz" = 1
	fac_closed:			  JPS AssertCSquare
										LDS 5 STA intA+1 LSL BCS fac_passed								; intA = ->max, ->max = 0xffff means ignore test
											LDS 6 STA intA+0
											LDS 1 SBB intA+1 LDS 2 SBW intA LSL BCS fac_error	; ->max - (start + anz) < 0 => error
											LDS 3 SBB intA+1 LDS 4 SBW intA LSL BCS fac_error

									; copies variable elements onto the math stack
		fac_passed:		LDS 12 CPI '&' BEQ fac_elemref											; ELEMENTS [|] OF VARIABLE
										LDS 11 STA g_type																	; g_type = vp->type
										LDS 2 STA intA+0 STA g_cnt+0
										LDS 1 STA intA+1 STA g_cnt+1											; intA = anz, g_cnt = anz
										LDS 4 STA intB+0 LDS 3 STA intB+1									; intB = startindex
										LDA g_type CPI 1 BEQ fac_elembyte
											LLW intB LLW intA 															; int type: x2 startindex, count now bytesize
		fac_elembyte:		LDS 8 STA fac_src0+0 LDS 7 STA fac_src0+1					; source address = ->ptr + startindex * ->type
										LDA intB+1 ADB fac_src0+1 LDA intB+0 ADW fac_src0
										LDA g_sp+0 STA fac_dst0+0 LDA g_sp+1 STA fac_dst0+1	; g_sp = destination
		fac_loop0:			DEW intA BCC fac_endelem
										  LDA
		fac_src0:				  0xffff STA
		fac_dst0:				  0xffff INW fac_src0 INW fac_dst0 JPA fac_loop0
		fac_endelem:		LDI 0 STR fac_dst0                              	; write zero-termination byte
                    LDA fac_dst0+1 CPI >endsp BCC fac_elemrts					; MATH MEMORY CHECK SINGLE FACTOR
			memerror:				LDI <error08 PHS LDI >error08 PHS JPA Error			; error "out of memory"
	fac_elemref:		LDI 2 STA g_type LDI 1 STA g_refset				  				; ELEMENT REFERENCE
									LDS 3 STA intB+1 LDS 4 STA intB+0					  				; start -> intB
									LDS 11 CPI 1 BEQ fac_char							      				; ->type = char?
										LLW intB																  				; start x 2 wg. int
		fac_char:			LDS 8 ADW intB LDS 7 ADB intB+1						  				; add vp->ptr to intB
									LDS 2 STA g_refcnt+0 LDS 1 STA g_refcnt+1	  				; store anz
		fac_elemrts:	LDI 12 ADB 0xffff RTS

									; copies the full variable onto the math stack (faster)
	fac_fullvar:		LDS 6 CPI '&' BEQ fac_fullref								; FULL VAR
							  		LDS 4 STA g_cnt+0 STA intA+0							; set g_cnt, use intA as byte counter
								  	LDS 3 STA g_cnt+1 STA intA+1
		fac_nosingle:  	LDS 5 STA g_type CPI 1 BEQ fac_fullchar		; set g_type
								  		LLW intA																; x2 wg. int
		fac_fullchar:		LDS 2 STA fac_src+0 LDS 1 STA fac_src+1		; set src data pointer
					  				LDA g_sp+0 STA fac_dst+0 LDA g_sp+1 STA fac_dst+1	; set dst to top of math stack
		fac_loop:				DEW intA BCC fac_endfull
									    LDA
		fac_src:			    0xffff STA
		fac_dst:			    0xffff INW fac_src INW fac_dst JPA fac_loop
		fac_endfull:	  LDI 0 STR fac_dst                       	; always write 0-termination into stack memory
                    LDA fac_dst+1 CPI >endsp BCC fac_fullrts	; MATH MEMORY CHECK SINGLE FACTOR
                      JPA memerror
	fac_fullref:	  LDI 2 STA g_type														; FULL REFERENCE
									LDI 1 STA g_refset STA g_cnt+0 CLB g_cnt+1	; set type=2, cnt=1
									LDS 4 STA g_refcnt+0 LDS 3 STA g_refcnt+1		; ->cnt to g_refcnt, g_refset=1
									LDS 2 STR g_sp LDS 1 STR g_spi							; put ->ptr onto math stack
		fac_fullrts:	LDI 6 ADB 0xffff RTS

fac_next4:			CPI '"' BNE fac_next5													; ".." STRING
									INW g_pc LDI 1 STA g_type CLW g_cnt
									LDA g_sp+0 STA fac_p+0 LDA g_sp+1 STA fac_p+1
	fac_while:			LDR g_pc CPI '"' BEQ fac_endstr
										STA
	fac_p:						0xffff INW g_pc INW fac_p INW g_cnt JPA fac_while
	fac_endstr:			LDI 0 STR fac_p                             ; write 0-termination byte
                  LDA fac_p+1 CPI >endsp BCS memerror					; MATH MEMORY CHECK SINGLE FACTOR
									INW g_pc RTS																; consume "

fac_next5:			CPI 'S' BNE fac_next6													; CALL
									INW g_pc LDR g_pc PHS PHS INW g_pc					; consume and push ID & container
									JPS getCall JPS FunctionCall PLS PLS				; ID -> getCall -> call pc -> function call
									RTS

fac_next6:			CPI '(' BNE fac_next7													; (..) EXPRESSION
									INW g_pc JPS Expr JPS AssertCRound
									RTS

fac_next7:			CPI 'K' BNE fac_error													; key()
									INW g_pc JPS AssertORound JPS AssertCRound
									LDI 1 STA g_type STA g_cnt+0 CLB g_cnt+1
									INP STR g_sp
									RTS

fac_error:			LDI <error05 PHS LDI >error05 PHS JPA Error		; error "Invalid expr"

facptr:					0xffff

; -------------------------------------------------------------------

Term:						JPS Factor
	term_while:		LDR g_pc CPI '*' BEQ term_mult
									CPI '/' BNE term_rts
										INW g_pc 																	; consume /
										JPS get LDA intA+0 PHS LDA intA+1 PHS			; push A
										JPS Factor JPS getB												; get into intB
										LDA intB+0 ADA intB+1 BCS term_okay BNE term_okay ; check for intB = 0
											LDI <error22 PHS LDI >error22 PHS JPA Error		; error "divide by 0"
		term_okay:			PLS STA intA+1 PLS STA intA+0							; pull A
										JPS int_div JPA term_reuse
	term_mult:		INW g_pc																			; consume *
								JPS get LDA intA+0 PHS LDA intA+1 PHS					; push A
								JPS Factor JPS getB
								PLS STA intA+1 PLS STA intA+0									; pull A
								JPS int_mul
		term_reuse:	LDA intA+0 STR g_sp LDA intA+1 STR g_spi			; store result as int
								CLB g_refset LDI 2 STA g_type
								CLB g_cnt+1 LDI 1 STA g_cnt+0
								JPA term_while
	term_rts:			RTS

; -------------------------------------------------------------------

BaseExpr:				LDR g_pc CPI '-' BEQ base_minus
									JPS Term JPA base_while
	base_minus:		INW g_pc																			; consume -
								JPS Term JPS get NEW intA
	base_reuse:		STR g_spi LDA intA+0 STR g_sp									; assumes MSB already in A
								CLB g_refset LDI 2 STA g_type
								CLB g_cnt+1 LDI 1 STA g_cnt+0
	base_while:		LDR g_pc CPI '+' BEQ base_plus
									CPI '-' BNE base_rts
										INW g_pc																	; consume '-'
										JPS get LDA intA+1 PHS LDA intA+0 PHS			; push A reversed here
										JPS Term JPS get NEW intA									; -b
										PLS ADW intA+0 PLS ADB intA+1							; a = a+(-b)
										JPA base_reuse
		base_plus:	INW g_pc																			; consume '+'
                JPS get LDA intA+1 PHS LDA intA+0 PHS					; push A reversed here
                JPS Term JPS get
								PLS ADW intA+0 PLS ADB intA+1									; a = a+b
								JPA base_reuse
	base_rts:			RTS

; -------------------------------------------------------------------

; handle relational operators <, ==, !=, <=, >=, >
RelExpr:				JPS BaseExpr
	rele_while:		LDR g_pc CPI 0xd2 BCC rele_rts BNE rele_eq    ; a < b <=> a+(-b) < 0
                  INW g_pc JPS get
                  LDA intA+0 PHS LDA intA+1 PHS
                  JPS BaseExpr JPS getB NEW intB
                  PLS ADB intB+1 PLS ADW intB BMI int_true
		int_false:			CLW intA JPA rele_reuse
		int_true2:			PLS	LDI 0xff STA intA+0 STA intA+1 JPA rele_reuse		; with PLS
		int_false2:			PLS CLW intA JPA rele_reuse													; with PLS
	rele_eq:			CPI 0xd3 BNE rele_neq                         ; a == b
									INW g_pc
                  JPS get LDA intA+0 PHS LDA intA+1 PHS
                  JPS BaseExpr JPS getB
									PLS CPA intB+1 BNE int_false2
										PLS CPA intB+0 BNE int_false
		  int_true:				LDI 0xff STA intA+0 STA intA+1
		rele_reuse:		LDA intA+0 STR g_sp LDA intA+1 STR g_spi		; store result as int
									CLB g_refset LDI 2 STA g_type
									CLB g_cnt+1 LDI 1 STA g_cnt+0
									JPA rele_while
	rele_neq:			CPI 0xd4 BNE rele_leq                         ; a != b
									INW g_pc
                  JPS get LDA intA+0 PHS LDA intA+1 PHS
                  JPS BaseExpr JPS getB
									PLS CPA intB+1 BNE int_true2
										PLS CPA intB+0 BNE int_true
											CLW intA JPA rele_reuse
	rele_leq:			CPI 0xd5 BNE rele_geq                         ; a <= b <=> b-a >= 0
									INW g_pc JPS get
                  LDA intA+0 PHS LDA intA+1 PHS
                  JPS BaseExpr JPS getB
									PLS SBB intB+1 PLS SBW intB BPL int_true
											CLW intA JPA rele_reuse
	rele_geq:			CPI 0xd6 BNE rele_greater                     ; a >= b <=> a+(-b) >= 0
									INW g_pc JPS get
                  LDA intA+0 PHS LDA intA+1 PHS
                  JPS BaseExpr JPS getB NEW intB
									PLS ADB intB+1 PLS ADW intB BPL int_true
											CLW intA JPA rele_reuse
	rele_greater:	CPI 0xd7 BNE rele_rts                         ; a > b <=> 0 > b+(-a)
                  INW g_pc JPS get NEW intA
                  LDA intA+0 PHS LDA intA+1 PHS
                  JPS BaseExpr JPS getB
                  PLS ADB intB+1 PLS ADW intB BMI int_true
									  CLW intA JPA rele_reuse
	rele_rts:			RTS

; -------------------------------------------------------------------

; handle logical operators: not, and, or, xor, <<, >> (and simultaeously bitwise operators)
Expr:						LDR g_pc CPI 0xd9 BEQ expr_not
									JPS RelExpr JPA expr_while
	expr_not:			INW g_pc																			; consume 'not'
								JPS RelExpr JPS get NOW intA									; NOT
		expr_reuse:	LDA intA+0 STR g_sp LDA intA+1 STR g_spi			; store result as int
								CLB g_refset LDI 2 STA g_type
								CLB g_cnt+1 LDI 1 STA g_cnt+0
	expr_while:		LDR g_pc CPI 0xda BCC expr_rts BNE expr_or
									INW g_pc
									JPS get LDA intA+0 PHS LDA intA+1 PHS				; push A
									JPS RelExpr JPS get
									PLS STF 0 LDA intA+1 STF 1									; AND
									AN1 AN1 AN1 AN1 AN1 AN1 AN1 AN1 STA intA+1
									PLS STF 0 LDA intA+0 STF 1
									AN1 AN1 AN1 AN1 AN1 AN1 AN1 AN1 STA intA+0
									JPA expr_reuse
	expr_or:			CPI 0xdb BNE expr_xor
									INW g_pc
                  JPS get LDA intA+0 PHS LDA intA+1 PHS				; push A
                  JPS RelExpr JPS get
									PLS STF 0 LDA intA+1 STF 1									; OR
									OR1 OR1 OR1 OR1 OR1 OR1 OR1 OR1 STA intA+1
									PLS STF 0 LDA intA+0 STF 1
									OR1 OR1 OR1 OR1 OR1 OR1 OR1 OR1 STA intA+0
									JPA expr_reuse
	expr_xor:			CPI 0xdc BNE expr_shiftl
									INW g_pc
                  JPS get LDA intA+0 PHS LDA intA+1 PHS				; push A
                  JPS RelExpr JPS get
									PLS STF 0 LDA intA+1 STF 1									; XOR
									XR1 XR1 XR1 XR1 XR1 XR1 XR1 XR1 STA intA+1
									PLS STF 0 LDA intA+0 STF 1
									XR1 XR1 XR1 XR1 XR1 XR1 XR1 XR1 STA intA+0
									JPA expr_reuse
	expr_shiftl:	CPI 0xdd BNE expr_shiftr
									INW g_pc
                  JPS get LDA intA+0 PHS LDA intA+1 PHS				; push A
                  JPS RelExpr JPS getB
                  PLS STA intA+1 PLS STA intA+0								; pull A
									JPS int_lsl JPA expr_reuse
	expr_shiftr:	CPI 0xde BNE expr_rts
									INW g_pc
                  JPS get LDA intA+0 PHS LDA intA+1 PHS				; push A
                  JPS RelExpr JPS getB
                  PLS STA intA+1 PLS STA intA+0								; pull A
									JPS int_lsr JPA expr_reuse
	expr_rts:			RTS

; -------------------------------------------------------------------

CompExpr:				JPS Expr
	compwhile:		LDR g_pc CPI '_' BNE comp_rts									; concatenation?
									INW g_pc
									LDA g_sp+0 PHS LDA g_sp+1 PHS								; save expr info on CPU stack
									LDA g_cnt+0 PHS LDA g_cnt+1 PHS
									LDA g_type PHS CPI 1 BEQ compbyte
										LLW g_cnt																	; g_cnt now holds bytesize of prev expression
		compbyte:			LDA g_cnt+1 ADB g_sp+1											; advance math stack pointers over ex. data
									LDA g_cnt+0 ADW g_sp+0 STA g_spi+1
                  LDA g_sp+0 STA g_spi+0 INW g_spi            ; MSB stays in A
									CPI >endsp BCS memerror											; MATH MEMORY CHECK
										JPS Expr																	; read next expression into SP
										PLS CPA g_type BEQ comptypeok							; vgl. gespeicherten g_type mit neuem g_type
											LDI <error06 PHS LDI >error06 PHS JPA Error	; "type mismatch"
	comptypeok:				PLS ADB g_cnt+1 PLS ADW g_cnt							; add up to total element count
										PLS STA g_sp+1 STA g_spi+1								; restore stack state
										PLS STA g_sp+0 STA g_spi+0 INW g_spi
										JPA compwhile
	comp_rts:			RTS

; -------------------------------------------------------------------

; Asserts a (compound) expression of specified type (casts single element, throws error for multiple)
; push: desired type
; pull: desired type
TypedCompExpr:	JPS CompExpr																	; parses compound expression of any type
								LDS 3 CPA g_type BEQ tcomp_rts								; matching types -> do nothing, else enforce type
									STA g_type CPI 1 BEQ tcompcntchk						; no further action if cast int -> char (truncate)
										LDR g_sp LSL LDI 0 ROL NEG STR g_spi			; cast char -> int in C-style w/o branching
	tcompcntchk:		LDA g_cnt+1 CPI 0 BNE tcomperror
										LDA g_cnt+0 CPI 2 BCS tcomperror					; error for g_cnt > 1
	tcomp_rts:					RTS
	tcomperror:		LDI <error06 PHS LDI >error06 PHS JPA Error		; error "type mismatch"

; --------------------------------------------------------------------------------------
; STATEMENTS
; --------------------------------------------------------------------------------------

CallStmt:				JPS AssertORound
								LDR g_pc CPI 0xd0 BEQ callint									; address is TN_INT_CONST
	callerror:			LDI <error05 PHS LDI >error05 PHS JPA Error	; error "invalid expr"
	callint:			INW g_pc																			; consume CONST marker
								LDR g_pc STA callto+0 INW g_pc								; extract target address
								LDR g_pc STA callto+1 INW g_pc
								LDR g_pc CPI 0xd0 BNE callerror								; backwards offset is TN_INT_CONST
									INW g_pc																		; consume CONST marker
									LDR g_pc SBB 0xffff													; SP=SP-offset prior to JPS
									JPS																					; jump to subroutine
	callto:					0xffff STF 2						  									; store possible A return value in 0xff02
									LDR g_pc ADB 0xffff													; read offset again and SP=SP+offset
									LDI 2 ADW g_pc															; consume int data "offset"
									JPS AssertCRound
									RTS

ReturnStmt:			LDR g_pc CPI 0xe0 BCS return_else
									JPS CompExpr LDI 4 STA g_haltret						; it is important to set halt *after* CompExpr()!
									LDA g_sp+0 STA g_retsp+0
									LDA g_sp+1 STA g_retsp+1
									RTS
	return_else:	LDI 4 STA g_haltret CLW g_cnt									; do not return anything after plain "return" statement
								RTS

WhileStmt:			LDA g_pc+0 PHS LDA g_pc+1 PHS
	whileloop:		JPS Expr JPS get
								LDA intA+0 ADA intA+1 BCS whilenobrk BEQ whilebreak
		whilenobrk:		JPS Block
									LDA g_haltend ADA g_haltbrk ADA g_haltret
									BNE whilebreak
										LDS 1 STA g_pc+1 LDS 2 STA g_pc+0
										JPA whileloop
	whilebreak:		PLS PLS
								JPS SkipStmt CLB g_haltbrk										; g_halt &= ~BREAK;
								RTS

IfStmt:					JPS Expr JPS get
								LDA intA+0 ADA intA+1 BCS if_1_not0 BEQ if_1_else
	if_1_not0:			LDI 1 PHS JPS Block JPA if_while
	if_1_else:		LDI 0 PHS JPS SkipStmt
	if_while:			LDR g_pc CPI 'F' BNE if_1_end
									LDA g_mind CPA g_tind BNE if_1_end
										INW g_pc
										LDS 1 CPI 0 BEQ if_2_else
											JPS SkipStmt JPA if_while
		if_2_else:			JPS Expr JPS get
										LDA intA+0 ADA intA+1 BCS if_2_not0 BEQ if_3_else
			if_2_not0:			LDI 1 STS 1 JPS Block JPA if_while
			if_3_else:		LDI 0 STS 1 JPS SkipStmt JPA if_while
	if_1_end:					LDR g_pc CPI 'E' BNE if_2_end
											LDA g_mind CPA g_tind BNE if_2_end
												INW g_pc
												LDS 1 CPI 0 BEQ if_4_else
													JPS SkipStmt JPA if_2_end
		if_4_else:				JPS Block
	if_2_end:					PLS RTS

PrintStmt:			JPS AssertORound
  printmore:    LDR g_pc CPI ')' BEQ printexit
								JPS CompExpr
                LDA g_type CPI 1 BEQ printchars
                  LDA g_cnt+0 STA intB+0 
									LDA g_cnt+1 STA intB+1   	; g_cnt -> intB as counter
									LDA g_sp+0 STA intD+0 LDA g_sp+1 STA intD+1     	; intD = print pointer
    printnext:    DEW intB BCC printmore														; first test for zero elements
    printnext2:     LDR intD STA intA+0 INW intD                  	; read out next int
                    LDR intD STA intA+1 INW intD
                    JPS int_tostr                                 	; convert intA to string
                    LDA strptr+0 PHS LDA strptr+1 PHS JPS _Print PLS PLS
                    DEW intB BCC printmore
                      LDI '_' OUT JPS _Wait JPA printnext2
  printchars:   LDA g_sp+0 PHS LDA g_sp+1 PHS JPS _Print PLS PLS
                JPA printmore
  printexit:    INW g_pc RTS																				; consume final ')'

; ------------------------------------------------------------------------------------------------
; FUNCTIONS AND VARIABLES
; ------------------------------------------------------------------------------------------------

; push: pc_lsb, pc_msb
; pull: #, #
FunctionCall: 			LDA g_nextvar+0 PHS LDA g_nextvar+1 PHS
										LDA g_sp+0 PHS LDA g_sp+1 PHS
										LDA g_tind PHS CLB g_tind
										JPS AssertORound											; consume caller (
										LDA g_pc+0 PHS LDA g_pc+1 PHS					; store g_pc -> args
										LDS 11 STA g_pc+0 LDS 10 STA g_pc+1		; callee params -> g_pc

	fun_while:				LDR g_pc CPI ')' BEQ fun_whileex			; parse for callee's parameter )
											CPI '1' BEQ fun_typeok
												CPI '2' BEQ fun_typeok
		fun_typeerr:					LDI <error17 PHS LDI >error17 PHS JPA Error	; error "Invalid parameter"
		fun_typeok:				SBI '0' STF 0 INW g_pc								; park type in X, consume type
											LDR g_pc CPI '&' BNE fun_plainvar		; reference & variable
												INW g_pc													; consume &
												LDR g_pc CPI 'V' BNE fun_typeerr
													INW g_pc																		; consume V
													LDR g_pc STR g_nextvar INW g_pc							; consume & store ->id
													INW g_nextvar LDA g_sub INC STR g_nextvar		; store ->sub
													INW g_nextvar LDF 0 STR g_nextvar							; store X ->type
													LDI 7 ADW g_nextvar													; goto new top of vars
													LDA g_pc+0 STS 11 LDA g_pc+1 STS 10					; g_pc -> par
													LDS 2 STA g_pc+0 LDS 1 STA g_pc+1						; arg -> g_pc
													LDR g_pc CPI 'V' BEQ fun_isvar
														LDI <error19 PHS LDI >error19 PHS JPA Error	; error "invalid argument"
			fun_isvar:					INW g_pc																		; consume V
													LDR g_pc PHS PHS INW g_pc JPS getVar				; consume and push ID
													PLS STA refptr+1 PLS STA refptr+0						; return pointer to ref variable *type*
													LDI 7 SBW g_nextvar													; down to ->type
													LDR refptr CPR g_nextvar BNE fun_typeerr		; error "Reference type mismatch"
														INW g_nextvar INW refptr									; advance to ->cnt
														LDR refptr STR g_nextvar INW g_nextvar INW refptr	; -> cnt
														LDR refptr STR g_nextvar INW g_nextvar INW refptr
														LDR refptr STR g_nextvar INW g_nextvar INW refptr	; -> ptr
														LDR refptr STR g_nextvar INW g_nextvar INW refptr
														LDR refptr STR g_nextvar INW g_nextvar INW refptr	; -> max
														LDR refptr STR g_nextvar INW g_nextvar INW refptr
														JPA fun_whileon
			refptr:							0xffff

		fun_plainvar:			CPI 'V' BNE fun_typeerr
												INW g_pc																		; consume 'V'
												LDR g_pc STR g_nextvar INW g_pc							; store & consume ->id
												INW g_nextvar LDA g_sub INC STR g_nextvar		; store ->sub
												INW g_nextvar LDF 0 STR g_nextvar							; store X ->type
												LDI 7 ADW g_nextvar													; goto new top of vars
												LDA g_pc+0 STS 11 LDA g_pc+1 STS 10					; g_pc -> par
												LDS 2 STA g_pc+0 LDS 1 STA g_pc+1						; arg -> g_pc
												LDF 0 PHS JPS TypedCompExpr										; request with type again
												LDI 6 SBW g_nextvar													; go down to ->cnt
												LDA g_cnt+0 STR g_nextvar INW g_nextvar			; ->cnt
												LDA g_cnt+1 STR g_nextvar INW g_nextvar
												LDA g_sp+0 STR g_nextvar INW g_nextvar			; ->ptr
												LDA g_sp+1 STR g_nextvar INW g_nextvar
												LDA g_cnt+0 STR g_nextvar INW g_nextvar			; ->max
												LDA g_cnt+1 STR g_nextvar INW g_nextvar
												PLS CPI 1 BEQ fun_pvarchar									; finally pull the type here
													LLW g_cnt																	; x2 for int
		fun_pvarchar:				LDA g_cnt+1 ADB g_sp+1
												LDA g_cnt+0 ADW g_sp												; g_sp += g_cnt * g_type
												LDA g_cnt+1 ADB g_spi+1
												LDA g_cnt+0 ADW g_spi												; g_sp += g_cnt * g_type
		fun_whileon:				LDA g_pc+0 STS 2 LDA g_pc+1 STS 1						; both cases: arg = g_pc; g_pc = par;
												LDS 11 STA g_pc+0 LDS 10 STA g_pc+1					; back to parameters
												JPA fun_while

	fun_whileex:			INW g_pc															; consume callee's param )
										INB g_sub JPS FastBlock DEB g_sub			; jump into callee's function block
										PLS STA g_pc+1 PLS STA g_pc+0					; pull arg -> g_pc (back to caller)
										JPS AssertCRound											; consume caller's ')' to reach next statement
										PLS STA g_tind
										PLS STA g_sp+1 STA g_spi+1
										PLS STA g_sp+0 STA g_spi+0 INW g_spi
										PLS STA g_nextvar+1 PLS STA g_nextvar+0
										LDA g_haltend ADA g_haltbrk ADA g_haltret BEQ fun_nohalt
											CLB g_haltret											; clear RETURN flag
											LDA g_cnt+0 ADA g_cnt+1 BCS fun_not0 BEQ fun_rts
		fun_not0:						LDA g_sp+0 STA fun_dst+0					; move return data
												LDA g_sp+1 STA fun_dst+1
												LDA g_retsp+0 STA fun_src+0
												LDA g_retsp+1 STA fun_src+1
												LDA g_cnt+0 STA intA+0 LDA g_cnt+1 STA intA+1
												LDA g_type CPI 1 BEQ fun_loop
													LLW intA
		fun_loop:						DEW intA BCC fun_rts
													LDA
			fun_src:						0xffff STA
			fun_dst:						0xffff INW fun_src INW fun_dst JPA fun_loop
	fun_rts:						RTS
	fun_nohalt:				CLW g_cnt RTS															; no 'return' happened

DefStmt:						LDR g_pc CPI 'S' BNE deferror
											LDA g_sub CPI 0 BNE deferror
												LDA g_mind CPI 0 BNE deferror
													INW g_pc																				; consume TN_CALL
													LDR g_pc STR g_nextcall INW g_pc INW g_nextcall ; consume and store call ID
													JPS AssertORound																; consume (
													LDA g_pc+0 STR g_nextcall INW g_nextcall				; store PC of call
													LDA g_pc+1 STR g_nextcall INW g_nextcall
													JPS SkipStmt
													RTS
	deferror:					LDI <error16 PHS LDI >error16 PHS JPA Error						; error "invalid definition"

; push: (vp->type)_lsb, (vp->type)_msb
; pull: #, #
VarAssignment:			LDR g_pc CPI '[' BEQ ass_element
											LDI 0xff PHS PHS JPA ass_operator						; push "no-offset" marker and goto operator
	ass_element:			INW g_pc																			; consume [
										JPS Expr JPS get JPS AssertCSquare						; parse offset ]
										LDA intA+0 PHS LDA intA+1 PHS									; push offset
	ass_operator:			LDR g_pc CPI '=' BNE ass_fastaddsub
											INW g_pc																		; consume =
											LDS 6 STA assptr+0 LDS 5 STA assptr+1   		; vp->type
											LDR assptr PHS															; load vp->type 1 or 2 and push
											JPS TypedCompExpr PLS												; request typed comp-expr (now g_type = vp->type)
											PLS CPI 0xff BEQ ass_nooffset								; pull and test offset MSB
												STA ass_dst+1 STA intA+1									; offset -> ass_dst, intA
												PLS STA ass_dst+0 STA intA+0
												LDA g_cnt+1 ADB intA+1										; RANGE SAFETY-CHECK 1
												LDA g_cnt+0 ADW intA											; intA = g_cnt + offset
												LDA g_type CPI 2 BNE ass_typedone					; get type from X
													LLW g_cnt LLW ass_dst										; x2 of address offset and expression size
					ass_typedone:	LDS 4 STA assptr+0 LDS 3 STA assptr+1			; goto vp->type
												LDI 3 ADW assptr LDR assptr ADW ass_dst		; ass_dst = vp->ptr + offset * vp->type
												INW assptr LDR assptr ADB ass_dst+1
												INW assptr LDR assptr STA intB+0					; RANGE SAFETY-CHECK 2: intB = ->max
												INW assptr LDR assptr STA intB+1
												LDA intA+1 SBB intB+1 BCC ass_indexerr		; ->max - (g_cnt + offset) >= 0 ? -> okay!
													LDA intA+0 SBW intB BCS ass_copy
			ass_indexerr:				  LDI <error14 PHS LDI >error14 PHS 		; error "Invalid index"
														JPA Error
		ass_nooffset:			PLS																					; discard "no-offset" LSB
											LDS 4 STA assptr+0 LDS 3 STA assptr+1   		; goto vp->type
											INW assptr LDA g_cnt+0 STR assptr						; g_cnt -> vp->cnt
											INW assptr LDA g_cnt+1 STR assptr
											INW assptr LDR assptr STA ass_dst+0					; ->ptr
											INW assptr LDR assptr STA ass_dst+1
											INW assptr LDR assptr STA intA+0						; ->max into intA for RANGE SAFETY-CHECK WHOLE
											INW assptr LDR assptr STA intA+1
											LDA g_cnt+1 SBB intA+1 BCC ass_indexerr				; ->max - g_cnt >= 0 means "okay"
												LDA g_cnt+0 SBW intA BCC ass_indexerr
													LDA g_type CPI 2 BNE ass_copy    				; reuse g_cnt as byte counter
														LLW g_cnt                         		; x 2 for int
			ass_copy:	          LDA g_sp+0 STA ass_src+0								; from g_sp to vp->ptr [+ offset * vp->type]
										      LDA g_sp+1 STA ass_src+1
			ass_loop:			      DEW	g_cnt BCC ass_rts										; reuses g_cnt as byte counter
											      LDA
			ass_src:				      0xffff STA
			ass_dst:				      0xffff INW ass_src INW ass_dst JPA ass_loop
			ass_rts:  		      RTS

		ass_fastaddsub:	STF 1 INW g_pc LDR g_pc CPI 0xd0 BNE ass_error	; TN_INT_CONST -> Y
											INW g_pc
											LDS 6 STA assptr+0 LDS 5 STA assptr+1   		; vp->type
											LDR assptr STF 0
											PLS CPI 0xff BEQ ass_nooffa
												STA intA+1 PLS STA intA+0									; intA = offset
												LDI 1 CPF 0 BEQ ass_achar
													LLW intA																; offset x 2 = byte offset
			ass_achar:				LDI 3 ADW assptr													; goto ->ptr
												LDR assptr ADW intA INW assptr						; intA = ->ptr + offset * ->type
												LDR assptr ADB intA+1 JPA ass_offaset
			ass_nooffa:			PLS																					; pull LSB rest of "null-offset"
											INW assptr																	; goto ->cnt
											LDI 1 STR assptr INW assptr									; ->cnt = 1
											LDI 0 STR assptr INW assptr
											LDR assptr STA intA+0 INW assptr						; intA = ->ptr
											LDR assptr STA intA+1
			ass_offaset:		LDI 1 CPF 0 BEQ ass_aachar
												LDR intA STA intB+0 INW intA
												LDR intA STA intB+1
												LDF 1 CPI 'a' BNE ass_fsubint
													LDR g_pc ADW intB INW g_pc							; add fast int
													LDR g_pc ADB intB+1 STR intA INW g_pc
													DEW intA LDA intB+0 STR intA RTS
				ass_fsubint:		CPI 's' BNE ass_error
													LDR g_pc SBW intB INW g_pc							; sub fast int
													LDR g_pc SBB intB+1 STR intA INW g_pc
													DEW intA LDA intB+0 STR intA RTS
				ass_aachar:		LDF 1 CPI 'a' BNE ass_fsubchar
												LDR intA ADR g_pc STR intA								; add fast char
												LDI 2 ADW g_pc RTS
				ass_fsubchar:	CPI 's' BNE ass_error
												LDR intA SBR g_pc STR intA								; sub fast char
												LDI 2 ADW g_pc RTS
		ass_error:			LDI <error05 PHS LDI >error05 PHS JPA Error		; error "Invalid assign"
	assptr:						0xffff

; 'type' token was just consumed, now expect a TN_VAR and it's identifier
; push: type (1 or 2)
; pull: #
VarDefinition:			LDR g_pc CPI 'V' BEQ var_okay
											LDI <error01 PHS LDI >error01 PHS JPA Error	; error "Expecting an identifier"
	var_okay:					INW g_pc LDR g_pc STR g_nextvar			; consume 'V', read & store id
										INW g_pc INW g_nextvar							; move to ->sub
										LDA g_sub ADA g_mind DEC BCC var_writesub ; if (g_sub == 0 && g_mind == 0) write -1
	var_not0:						LDA g_sub
	var_writesub:			STR g_nextvar INW g_nextvar					; move to ->type
										LDS 3 STR g_nextvar 								; write sub (0xff for global) and type

										LDR g_pc CPI '@' BNE var_localvar
											INW g_pc LDI 7 ADW g_nextvar			; protect the new var entry
											JPS Expr
											LDA g_type CPI 2 BEQ var_typok
												LDI <error05 PHS LDI >error05 PHS JPA Error	; error "Expecting an int address"
		var_typok:				JPS get LDI 4 SBW g_nextvar
											LDA intA+0 STR g_nextvar INW g_nextvar	; vp->ptr
											LDA intA+1 STR g_nextvar INW g_nextvar
											LDI 0xff STR g_nextvar INW g_nextvar		; vp->max
											LDI 0xff STR g_nextvar INW g_nextvar
											LDR g_pc CPI '=' BNE var_abselse
												INW g_pc
												LDS 3 PHS JPS TypedCompExpr
												LDI 6 SBW g_nextvar
												LDA g_cnt+0 STR g_nextvar INW g_nextvar
												LDA g_cnt+1 STR g_nextvar INW g_nextvar
												LDR g_nextvar STA var_dst+0 INW g_nextvar
												LDR g_nextvar STA var_dst+1 LDI 3 ADW g_nextvar
												LDA g_sp+0 STA var_src+0 LDA g_sp+1 STA var_src+1
												PLS CPI 1 BEQ var_loop											; check type for int
													LLW g_cnt
			var_loop:					DEW g_cnt BCC var_absexit
													LDA
			var_src:						0xffff STA
			var_dst:						0xffff INW var_src INW var_dst JPA var_loop
			var_absexit:			RTS

		var_abselse:			LDI 6 SBW g_nextvar
											LDA g_refset CPI 1 BEQ var_refset
												LDI 1 STR g_nextvar INW g_nextvar
												LDI 0 STR g_nextvar LDI 5 ADW g_nextvar
												RTS
			var_refset:			LDA g_refcnt+0 STR g_nextvar INW g_nextvar
											LDA g_refcnt+1 STR g_nextvar LDI 5 ADW g_nextvar
											RTS

	var_localvar:			LDI 3 ADW g_nextvar																; move to ->ptr
										LDA g_sp+0 STR g_nextvar INW g_nextvar						; write g_sp ->ptr
										LDA g_sp+1 STR g_nextvar INW g_nextvar						; points to v->max
										LDR g_pc CPI '=' BNE var_locelse
											INW g_pc																				; consume =
											LDI 0xff STR g_nextvar INW g_nextvar						; vp->max = 0xffff
											LDI 0xff STR g_nextvar INW g_nextvar
											LDS 3 PHS JPS TypedCompExpr PLS
											LDI 6 SBW g_nextvar
											LDA g_cnt+0 STR g_nextvar INW g_nextvar					; ->cnt = g_cnt
											LDA g_cnt+1 STR g_nextvar LDI 3 ADW g_nextvar		; move to ->max
											LDA g_cnt+0 STR g_nextvar INW g_nextvar					; ->max = g_cnt
											LDA g_cnt+1 STR g_nextvar INW g_nextvar
											LDS 3 CPI 1 BEQ var_char
												LLW g_cnt																			; g_cnt now is g_cnt * g_type
		var_char:					LDA g_cnt+0 ADW g_sp
											LDA g_cnt+1 ADB g_sp+1
											LDA g_cnt+0 ADW g_spi
											LDA g_cnt+1 ADB g_spi+1
											RTS

		var_locelse:		LDI 4 SBW g_nextvar														; move to ->cnt
										LDI 1 STR g_nextvar INW g_nextvar							; vp->cnt = 1
										LDI 0 STR g_nextvar LDI 3 ADW g_nextvar				; move to ->max
										LDI 1 STR g_nextvar INW g_nextvar							; vp->max = 1
										LDI 0 STR g_nextvar INW g_nextvar
										LDS 3 ADW g_sp
										LDS 3 ADW g_spi
										RTS

; --------------------------------------------------------------------------------------
; LANGUAGE STRUCTURE
; --------------------------------------------------------------------------------------

; push: character
; pull: #
SimpleLine:			LDR g_pc
                CPI 'V' BNE linenext1
									INW g_pc LDR g_pc PHS PHS INW g_pc JPS getVar
									JPS VarAssignment PLS PLS JPA linecont
	linenext1:		CPI 'B' BNE linenext2
									INW g_pc CLB g_haltbrk JPA linecont					; BreakStmt: g_halt |= BREAK
	linenext2:		CPI 'S' BNE linenext3
									INW g_pc LDR g_pc PHS PHS INW g_pc JPS getCall
									JPS FunctionCall PLS PLS JPA linecont
	linenext3:		CPI 'R' BNE linenext4
									INW g_pc JPS ReturnStmt JPA linecont
	linenext4:		CPI '1' BNE linenext5
									INW g_pc LDI 1 PHS JPS VarDefinition PLS JPA linecont
	linenext5:		CPI '2' BNE linenext6
									INW g_pc LDI 2 PHS JPS VarDefinition PLS JPA linecont
	linenext6:		CPI 'C' BNE linenext7
									INW g_pc JPS CallStmt JPA linecont
  linenext7:    CPI 'P' BNE linenext8
                  INW g_pc JPS PrintStmt JPA linecont
	linenext8:		LDI <error02 PHS LDI >error02 PHS JPA Error				; error "invalid simple stmt"
	linecont:			LDR g_pc CPI 0xe0 BCS lineindent									; end of the line (indent) reached?
									LDA g_haltend ADA g_haltbrk ADA g_haltret
									BEQ SimpleLine 																	; any halt flag set?
										RTS
	lineindent:		NOT DEC STA g_mind INW g_pc RTS

; -------------------------------------------------------------------

Statement:			LDA g_mind CPA g_tind BEQ stmtnormal
									BMI stmtblockend
										LDI <error11 PHS LDI >error11 PHS JPA Error		; error "unexpected indent"
	stmtnormal:		LDR g_pc CPI 'I' BNE stmtnext1
									INW g_pc JPS IfStmt RTS
		stmtnext1:	CPI 'W' BNE stmtnext2
									INW g_pc JPS WhileStmt RTS
		stmtnext2:	CPI 'D' BNE stmtsimple
									INW g_pc JPS DefStmt RTS
		stmtsimple:	JPS SimpleLine
								RTS
	stmtblockend:	LDI 1 STA g_haltend																; set BLOCKEND flag
								RTS

; -------------------------------------------------------------------

Block:					LDA g_nextvar+0 PHS LDA g_nextvar+1 PHS							; save variable and stack state
								LDA g_sp+0 PHS LDA g_sp+1 PHS
								LDR g_pc CPI 0xe0 BCC blocksimple										; is there an indent? => "hanging" block
									NOT DEC STA g_mind INW g_pc												; consume indentation mark
									INB g_tind																				; indentation +1
	blockwhile:			JPS Statement
									LDA g_haltend ADA g_haltbrk ADA g_haltret
									BEQ blockwhile
										DEB g_tind JPA blockend													; indentation -1
	blocksimple:	JPS SimpleLine
	blockend:			CLB g_haltend																			; clear BLOCKEND flag
								PLS STA g_sp+1 STA g_spi+1													; restore variable and stack state
								PLS STA g_sp+0 STA g_spi+0 INW g_spi
								PLS STA g_nextvar+1 PLS STA g_nextvar+0							; (forget blocks's local variables)
								RTS

; -------------------------------------------------------------------

; function block does not need an additional push/pull of variables and math stack
FastBlock:			LDR g_pc CPI 0xe0 BCC fblocksimple									; is there an indent? => "hanging" block
									NOT DEC STA g_mind INW g_pc												; consume indentation mark
									INB g_tind																				; indentation +1
	fblockwhile:			JPS Statement
										LDA g_haltend ADA g_haltbrk ADA g_haltret
										BEQ fblockwhile
									DEB g_tind																				; indentation -1
									CLB g_haltend																		; clear BLOCKEND flag (bit 0)
									RTS
	fblocksimple:	JPS SimpleLine
								CLB g_haltend																			; clear BLOCKEND flag (bit 0)
								RTS

; --------------------------------------------------------------------------------------
; GLOBAL STATE
; --------------------------------------------------------------------------------------

g_stop:         0x0000				; tokenizer will stop here, set to 0xffff to tokenize the entire source code
g_pc:						0x0000				; program counter
g_line:					0x0000				; line number (set by the tokenizer)
g_sub:					0xff					; subroutine calling level
g_tind:					0xff					; target indentation
g_mind:					0xff					; measured indentation
g_haltend:			0xff					; halt flag "end" stop processing of statements
g_haltbrk:			0xff					; halt flag "break" stop processing of statements
g_haltret:			0xff					; halt flag "return" stop processing of statements
g_nextcall:			0xffff				; free top of call list
g_nextvar:			0xffff				; free top of var list
g_nextsrc:			0xffff				; free top of the source list
g_sp:						0xffff				; expression stack pointer (to char or LSB of int)
g_spi:					0xffff				; expression stack pointer (to MSB of int)
g_cnt:					0xffff				; element count of expression (or returned data) on stack
g_type:					0xff					; element type of last expression (or returned data) on stack
g_retsp:				0xffff				; pointer at returned expression data on the stack
g_refcnt:				0xffff				; used by @: referenced element count, set by & only if cnt > 1
g_refset:				0xff					; 1: refcnt was actively set, 0: use refcnt = 1

NotFoundMsg:  	'Not found: ', 0
InLineMsg:			' in ', 0
QuestionMsg:  	'??', 10, 0
MaxFileMsg:   	'Use max 5 files.', 10, 0

error01:				'Invalid ID', 0
error02:				'Unknown stmt', 0
error05:				'Invalid expr', 0
error06:				'Type mismatch', 0
error07:				'Out of IDs', 0
error08:				'Out of RAM', 0
error11:				'Unclear indent', 0
error14:				'Invalid index', 0
error16:				'Invalid def', 0
error17:				'Invalid parameter', 0
error19:				'Invalid argument', 0
error22:				'Devide by 0', 0
error30:				'Expect ]', 0
error31:				'Expect (', 0
error32:				'Expect )', 0
error33:				'Expect =', 0

															; tokenizing item dictionary
items:  	    	'if',0,'...........', 'I',	0xff,	'elif',0,'.........', 'F',	0xff,	'else',0,'.........', 'E',	0xff,
								'while',0,'........', 'W',	0xff,	'break',0,'........', 'B',	0xff,	'def',0,'..........', 'D',	0xff,
								'return',0,'.......', 'R',	0xff,	'char',0,'.........', '1',	0xff,	'int',0,'..........', '2',	0xff,
								'call',0,'.........', 'C',	0xff,	'not',0,'..........', 0xd9,	0xff,	'and',0,'..........', 0xda,	0xff,
								'or',0,'...........', 0xdb,	0xff,	'xor',0,'..........', 0xdc,	0xff, 'print',0,'........', 'P',	0xff,
								'key',0,'..........', 'K',	0xff,
newitems:		  								; start of new tokenizer items (variables and calls)

#mute

; --------------------------------------------------------------------------------------
; MIN GLOBAL CONSTANTS
; --------------------------------------------------------------------------------------

#org 0x9000     file:        	; beginning of the source file (editor text file)
#org 0xdf00			firstcall:		; call dictionary 3 bytes * 256 = 0x300 bytes
#org 0xe200     firstvar: 	  ; var dictionary  9 bytes * 256 = 0x900 bytes
#org 0xeb00			firstsp:			; data memory stack (1152 bytes)
#org 0xef80			endsp:				; data memory end
#org 0xef92			firstsrc:			; vector of imported source files (22bytes * 5 = 110 bytes, max. 5 entries)
#org 0xf000			endsrc:				; end of source vector

#org 0xfe75     _PtrA:        ; lokaler OS pointer (3 bytes) used by LoadFileTo routine
#org 0xfe78     _PtrB:        ; lokaler OS pointer (3 bytes)
#org 0xfe7e     _PtrD:        ; lokaler pointer (2 bytes)

#mute                         ; MinOS label definitions generated by 'asm os.asm -s_'

#org 0xf000 _Kernel:
#org 0xf003 _Prompt:
#org 0xf006 _MemMove:
#org 0xf009 _Random:
#org 0xf00c _ReadLine:
#org 0xf00f _SkipSpace:
#org 0xf012 _ReadHex:
#org 0xf015 _Print:
#org 0xf018 _PrintHex:
#org 0xf01b _Wait:
#org 0xf01e _FlashErase:
#org 0xf021 _FlashWrite:
#org 0xf024 _FlashPtrA:
#org 0xf027 _FindFile:
#org 0xf02a _LoadFile:
#org 0xf02d _SaveFile:
#org 0xf030 _Clear:
#org 0xf033 _ClearRow:
#org 0xf036 _CursorOn:
#org 0xf039 _CursorOff:
#org 0xf03c _CursorX:
#org 0xf03f _CursorY:
#org 0xf042 _MoveX:
#org 0xf045 _MoveY:
#org 0xfe70 _ReadPtr:
#org 0xfe72 _ReadNum:
#org 0xfe84 _RandomState:
#org 0xfe8e _ReadBuffer:



