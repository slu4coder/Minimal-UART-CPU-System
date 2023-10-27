; ****************************************************************
; *****                                                      *****
; ***** MinOS2 Operating System for the 'Minimal UART Ultra' *****
; *****                                                      *****
; ***** by Carsten Herting (slu4)  -  updated 2023 Sept 23th *****
; *****                                                      *****
; ****************************************************************

#org 0x0000                                                    ; Bank 0, Address 0 = entry point after RESET

OS_Bootloader:  ; LDI 'A' OUT                                    ; for debug only
                ; NOP NOP NOP NOP NOP NOP
                ; NOP NOP NOP NOP NOP
                
                LDI <OS_Image STA 0xfffc                       ; move image source address to 0xfffc/d
                LDI >OS_Image STA 0xfffd
                LDI <_Kernel STA 0xfffe                        ; move kernel destination address to 0xfffe/f
                LDI >_Kernel STA 0xffff

  imcopyloop:   ; LDA 0xffff SBI 0xf0 ADI '0' OUT                ; for debug only
                ; NOP NOP NOP NOP NOP NOP
                ; NOP NOP NOP NOP NOP
                
                LDR 0xfffc STR 0xfffe                          ; copy the OS image to kernel RAM area
                INW 0xfffc INW 0xfffe
                LDA 0xfffe CPI <OS_Beyond BNE imcopyloop       ; destination LSB < kernel LSB? Note: BNE instead of BCS!
                  LDA 0xffff CPI >OS_Beyond BCC imcopyloop     ; destination MSB < kernel MSB?

                    ; LDI 'B' OUT                                ; for debug only
                    ; NOP NOP NOP NOP NOP NOP
                    ; NOP NOP NOP NOP NOP

; **********************************************************************************************************

OS_Image:                                                      ; OS image starts HERE on bank 0

  #mute                                                        ; do not emit origin address...
  #org 0xf000                                                  ; ... but assemble for kernel destination
  #emit                                                        ; begin emitting code here

  _Kernel:        JPA OS_Start                                 ; KERNEL START WITH JUMP TABLE
  _Prompt:        JPA OS_Prompt
  _MemMove:       JPA OS_MemMove
  _Random:        JPA OS_Random

  _ReadLine:      JPA OS_ReadLine
  _SkipSpace:     JPA OS_SkipSpace
  _ReadHex:       JPA OS_ReadHex
  _Print:         JPA OS_Print
  _PrintHex:      JPA OS_PrintHex
  _Wait:          JPA OS_Wait

  _FlashErase:    JPA OS_FlashErase
  _FlashWrite:    JPA OS_FlashWrite
  _FlashPtrA:     JPA OS_FlashPtrA

  _FindFile:      JPA OS_FindFile
  _LoadFile:      JPA OS_LoadFile
  _SaveFile:      JPA OS_SaveFile

  _Clear:         JPA OS_Clear
  _ClearRow:      JPA OS_ClearRow
  _CursorOn:      JPA OS_CursorOn
  _CursorOff:     JPA OS_CursorOff
  _CursorX:       JPA OS_CursorX
  _CursorY:       JPA OS_CursorY
  _MoveX:         JPA OS_MoveX
  _MoveY:         JPA OS_MoveY

OS_Start:       LDI 0xfe STA 0xffff                            ; init stack

                LDI <logotxt PHS LDI >logotxt PHS              ; print splash screen
                JPS OS_Print PLS PLS

  OS_Prompt:    LDI 0xfe STA 0xffff                        ; switch off FLASH and init stack
                LDI <readytxt PHS LDI >readytxt PHS
                JPS OS_Print PLS PLS

  newline:      LDI <_ReadBuffer STA _ReadPtr+0                ; parse a line of user input
                LDI >_ReadBuffer STA _ReadPtr+1
                JPS OS_ReadLine                                ; MAIN LOOP: read in a line of user input
                JPS OS_SkipSpace                               ; omit leading spaces
                LDR _ReadPtr CPI 10 BEQ newline                ; empty line?
                  JPS OS_LoadFile CPI 0 BEQ OS_Error           ; load the file (=instruction)
                    JPR PtrD                                   ; run a loaded program with command line ptr on stack

  OS_Error:     LDI <errortxt PHS LDI >errortxt PHS JPS OS_Print
                JPA OS_Prompt

  logotxt:      27, '[H', 27, '[J', 27, '[?25h',               ; clear screen and show cursor
                27, '[8G', 'Minimal UART Ultra CPU with MinOS2', 10, 10
                27, '[8G', '32KB RAM - 512KB SSD - 10MHz Clock', 10, 10, 0
  readytxt:     'READY.', 10, 0
  errortxt:     'File not found.', 10, 0

; -------------------------------------------------------------------------------------
; Reads a line of input into _ReadBuffer starting from _ReadPtr
; set _ReadPtr to the desired position within _ReadBuffer buffer (1-50 chars)
; modifies: _ReadPtr
; -------------------------------------------------------------------------------------
OS_ReadLine:    LDA _ReadPtr+0 PHS LDA _ReadPtr+1 PHS       ; save desired buffer start
  waitchar:     WIN CPI 0x80 BCS waitchar                   ; ignore unprintable chars (UP, DN, PgUp, etc.)
                  CPI 9 BEQ waitchar                        ; ignore TAB
                  CPI 27 BNE checkback                      ; ESC invalidates input data
                    PLS STA _ReadPtr+1 PLS STA _ReadPtr+0   ; move back to start of input buffer
                    LDI 10 STR _ReadPtr OUT RTS             ; quit with ENTER at beginning
  checkback:      CPI 8 BNE havenoback                      ; check for BACKSPACE
                    OUT LDS 2 CPA _ReadPtr+0 BEQ waitchar
                      DEB _ReadPtr+0 JPA waitchar
  havenoback:     STR _ReadPtr CPI 10 BEQ haveenter         ; store char & check for ENTER
                    LDA _ReadPtr+0 CPI <ReadLast BEQ waitchar ; end of line reached? => don't print!
                      LDR _ReadPtr OUT INB _ReadPtr+0 JPA waitchar ; enough space => print it
  haveenter:      PLS STA _ReadPtr+1 PLS STA _ReadPtr+0     ; move pointer back to start of input buffer
                  LDI 10 OUT RTS                            ; perform 'ENTER'

; ---------------------------------------------------------------------------------------
; Advances the input line pointer _ReadPtr over SPACES, " and ' to the next relevant char
; modifies: _ReadPtr
; ---------------------------------------------------------------------------------------
OS_SkipSpace:   LDR _ReadPtr CPI 32 BCC ps_useit            ; use < SPACE
                  CPI 40 BCS ps_useit                       ; use above code 39 (above " and ')
                    INB _ReadPtr+0 JPA OS_SkipSpace
  ps_useit:     RTS

; --------------------------------------------------
; Schreibt einen nullterminierten String at <stradr>
; push: stradr_lsb, stradr_msb
; pull: #, #
; --------------------------------------------------
OS_Print:       LDS 4 STA printaddr+0           ; get string pointer LSB
                LDS 3 STA printaddr+1           ; get string pointer MSB
  printloop:    LDA
  printaddr:    0xffff CPI 0 BEQ printend       ; self-modifying code
                  OUT JPS _Wait                 ; will wait a bit longer than needed
                  INW printaddr JPA printloop
  printend:      RTS

; --------------------------------------------------
; Prints out a byte value <val> in HEX format
; push: <val>
; pull: #
; modifies:
; --------------------------------------------------
OS_PrintHex:    LDS 3 NBH ADI '0'               ; extract MSB
                CPI 58 BCC th_msn
                  ADI 39
  th_msn:       OUT JPS _Wait
                LDS 3 NBL ADI '0'               ; extract LSB
                CPI 58 BCC th_lsn
                  ADI 39
  th_lsn:       OUT JPS _Wait
                RTS

; --------------------------------------------------
; Parses hex number 0000..ffff from _ReadPtr into _ReadNum
; breaks at any char != [0..9, a..f]
; modifies: _ReadPtr, _ReadNum
; --------------------------------------------------
OS_ReadHex:    CLW _ReadNum LDI 0xf0 STA _ReadNum+2
  hxgetchar:    LDR _ReadPtr                    ; input string lesen
                CPI 'g' BCS hxreturn            ; above f? -> melde Fehler!
                CPI 'a' BCS hxletter            ; a...f?
                CPI ':' BCS hxreturn            ; above 9? -> Separator: Zurück, wenn was da ist, sonst übergehen.
                CPI '0' BCS hxzahl              ; 0...9?
                  JPA hxreturn                  ; unter 0? -> Separator: Zurück, wenn was da ist, sonst übergehen.
  hxletter:     SBI 39
  hxzahl:       SBI 48 PHS
                LLW _ReadNum RLB _ReadNum+2     ; shift existing hex data 4 steps to the left
                LLW _ReadNum RLB _ReadNum+2
                LLW _ReadNum RLB _ReadNum+2
                LLW _ReadNum RLB _ReadNum+2
                PLS ADB _ReadNum+0              ; add new hex nibble (carry cannot happen)
                INW _ReadPtr JPA hxgetchar
  hxreturn:     RTS

; ---------------------------------------------------------------------------------------------
; This routine forces a 176 cycle OUT repetition time of TI when called via 'OUT JPS _Wait OUT'
; ---------------------------------------------------------------------------------------------
OS_Wait:        LDI 21                          ; LDI: 2
  wuart_loop:   DEC BNE wuart_loop              ; (3+4)*n - 1
                RTS                             ; JPS: 13, RTS: 9, API-JPA: 4, OUT: 2

; ******************************
; Generates a pseudo-random byte
; A: pseudo-random byte
; ******************************
OS_Random:      INB _RandomState+0 STF 0        ; ++x
                LDA _RandomState+3 STF 1        ; c
                XR1 XR1 XR1 XR1 XR1 XR1 XR1 XR1 ; result c^x in F1
                LDA _RandomState+1 STF 0        ; a in F0
                XR1 XR1 XR1 XR1 XR1 XR1 XR1 XR1 ; A/F1 = a^c^x
                STA _RandomState+1              ; a = a^c^x
                ADB _RandomState+2              ; A/b = b+a
                LSR                             ; logical shift right b result
                ADA _RandomState+3 STF 0        ; add c and move to F0
                XR1 XR1 XR1 XR1 XR1 XR1 XR1 XR1 ; result a^c^x in A/F1
                STA _RandomState+3              ; c = (c+(b>>1))^a
                RTS

; --------------------------------------------------
; positions/moves (or sets) the cursor
; push: cursor position/displacement (or x, y position)
; pull: # (or #, #)
; --------------------------------------------------
OS_CursorX:     LDS 3 INC STA cu_store1+1 JPS cu_print LDI 'G' OUT JPS _Wait RTS     ; set x
OS_CursorY:     LDS 3 INC STA cu_store1+1 JPS cu_print LDI 'd' OUT JPS _Wait RTS     ; set y
OS_MoveX:       LDS 3 CPI 0 BEQ cu_rts BPL mx_ispos
                  NEG STA cu_store1+1 JPS cu_print LDI 'D' OUT JPS _Wait RTS         ; dx<0
  mx_ispos:           STA cu_store1+1 JPS cu_print LDI 'C' OUT JPS _Wait RTS         ; dx>0
OS_MoveY:       LDS 3 CPI 0 BEQ cu_rts BPL my_ispos
                  NEG STA cu_store1+1 JPS cu_print LDI 'A' OUT JPS _Wait RTS         ; dy<0
  my_ispos:           STA cu_store1+1 JPS cu_print LDI 'B' OUT JPS _Wait RTS         ; yd>0

  cu_print:     LDI 27 OUT JPS _Wait
                LDI '[' OUT JPS _Wait
  cu_number:    LDI '0' STA cu_store10+1
  cu_loop:      LDI 10 SBB cu_store1+1 BCC cu_store10
                  INB cu_store10+1 JPA cu_loop
  cu_store10:   LDI 0xff CPI '0' BEQ cu_store1
                  OUT JPS _Wait
  cu_store1:    LDI 0xff ADI 58 OUT JPS _Wait              ; add '0' + 10, which was already subtracted above
  cu_rts:       RTS

; --------------------------------------------------
; Clear, Cursor on/off
; --------------------------------------------------
OS_Clear:       LDI <clrtxt PHS LDI >clrtxt PHS JPS OS_Print PLS PLS RTS
OS_ClearRow:    LDI <clrrowtxt PHS LDI >clrrowtxt PHS JPS OS_Print PLS PLS RTS
OS_CursorOn:    LDI <curontxt PHS LDI >curontxt PHS JPS OS_Print PLS PLS RTS
OS_CursorOff:   LDI <curofftxt PHS LDI >curofftxt PHS JPS OS_Print PLS PLS RTS
  clrtxt:       27, '[H', 27, '[J', 0                      ; home & clear screen
  clrrowtxt:    27, '[1G', 27, '[K', 0                     ; move cursor to the left and clear the row
  curontxt:     27, '[?25h', 0                             ; switch cursor on
  curofftxt:    27, '[?25l', 0                             ; switch cursor off

; --------------------------------------------------
; Searches SSD for file <filename> stored at _ReadPtr (any char <= 39 terminates <filename>)
; returns A=1: _ReadPtr points *beyond* <filename>, PtrA0..2(=BANK) point at start of file in FLASH
; returns A=0: _ReadPtr points to *start* of <filename>, PtrA0..2(=BANK) point *beyond last file* in FLASH
; modifies: _ReadPtr, PtrA, PtrB, PtrC, BANK
; --------------------------------------------------
OS_FindFile:      ; browse through all stored files and see if <filename> matches name, any char <=39 stops
                  LDI 0 STA PtrA+2 BNK STA PtrA+0 LDI 0x10 STA PtrA+1 ; goto sector #1 (start of SSD)
  ff_search:        LDR PtrA CPI 0xff BEQ ff_returnfalse           ; end of data reached -> no match
                    ; check if name matches (across banks)
                    LDA PtrA+0 STA PtrC+0                          ; PtrA -> PtrC
                    LDA PtrA+1 STA PtrC+1
                    LDA PtrA+2 STA PtrC+2
                    LDA _ReadPtr+0 STA PtrB+0                      ; _ReadPtr -> PtrB
                    LDA _ReadPtr+1 STA PtrB+1
  match_loop:       LDR PtrB CPI 40 BCS ff_isnoend                 ; cast code <= 39 (') (SPACE, ENTER) to 0
                      LDI 0
  ff_isnoend:       CPR PtrC BNE files_dontmatch                   ; stimmen Buchstaben überein?
                      CPI 0 BEQ ff_returntrue                      ; wurde gemeinsame 0 erreicht => match!
                        INW PtrB INW PtrC SBI 0x80 BCC match_loop  ; teste nä. Buchstaben, handle 15-bit overflow in C
                          STA PtrC+1 INB PtrC+2 BNK JPA match_loop
                    ; this filename does not match => jump over (across banks)
  files_dontmatch:  LDI 22 ADW PtrA JPS OS_FlashPtrA               ; advance over header to bytesize LSB
                    LDR PtrA STA PtrB+0 INW PtrA JPS OS_FlashPtrA  ; extract bytesize -> PtrB
                    LDR PtrA STA PtrB+1 INW PtrA
                    LDA PtrB+0 ADW PtrA LDA PtrB+1 ADB PtrA+1      ; PtrA points beyond this file
                      JPS OS_FlashPtrA JPA ff_search
  ff_returntrue:    LDA PtrB+0 STA _ReadPtr+0                      ; parse over good filename
                    LDA PtrB+1 STA _ReadPtr+1
                    LDI 1 RTS
  ff_returnfalse:   LDI 0 RTS                                      ; not found, don't change _ReadPtr

; -------------------------------------------------------
; Loads <filename> pointed to by _ReadPtr from SSD
; <filename> must be terminated by <= 39 "'"
; success: returns A=1, _ReadPtr points beyond <filename>
; failure: returns A=0, _ReadPtr points to <filename>
; modifies: _ReadPtr, PtrA, PtrB, PtrC, PtrD
; -------------------------------------------------------
OS_LoadFile:        JPS OS_FindFile CPI 1 BNE lf_failure            ; check result in A
                      ; PtrA0..2 now points to file in FLASH, BANK is set
                      LDI 20 ADW PtrA JPS OS_FlashPtrA              ; search for target addr
                      LDR PtrA STA PtrC+0 STA PtrD+0                ; destination addr -> PtrC, PtrD
                      INW PtrA JPS OS_FlashPtrA
                      LDR PtrA STA PtrC+1 STA PtrD+1
                      INW PtrA JPS OS_FlashPtrA
                      LDR PtrA STA PtrB+0 INW PtrA JPS OS_FlashPtrA ; bytesize -> PtrB (PtrA now points to data)
                      LDR PtrA STA PtrB+1 INW PtrA JPS OS_FlashPtrA
  lf_loadloop:        DEW PtrB BCC lf_success                      ; alles kopiert?
                        LDR PtrA STR PtrC                          ; copy block from A -> to C
                        INW PtrC INW PtrA JPS OS_FlashPtrA
                        JPA lf_loadloop
  lf_success:         LDI 1 RTS                                    ; switch off FLASH
  lf_failure:         LDI 0 RTS

; Produces a FLASH/BANK address in the correct form: PtrA+2: 32KB bank, PtrA0..1: 15bit section address
; Adds (and clears) bit 15 of PtrA to PtrA+2 and updates bank register
; Call this routine everytime the FLASH pointer PtrA is increased!
; modifies: PtrA+0..2, BANK register
OS_FlashPtrA:     LDA PtrA+1 SBI 0x80 BCC fa_rts                   ; check bit 15
                    STA PtrA+1 INB PtrA+2 BNK                      ; clear bit 15 and increment PtrA+2 and BANK
  fa_rts:         RTS

; --------------------------------------------------
; Saves a RAM area as file <name> to SSD drive, checks if there is enough space, asks before overwriting
; expects: _ReadPtr points to filename starting with char >= 40, terminated by char <= 39
; push: first_lsb, first_msb, last_lsb, last_msb
; pull: #, #, #, result (1: success, 0: failure, 2: user abortion) same as in A
; modifies: X, PtrA, PtrB, PtrC, PtrD, PtrE, PtrF, _ReadPtr
; --------------------------------------------------
OS_SaveFile:      LDS 3 STA PtrF+1 LDS 4 STA PtrF+0
                  LDS 5 STA PtrE+1 LDS 6 STA PtrE+0
                  ; assemble a zero-filled 20-byte filename starting at _ReadBuffer for the header
                  LIF 19 0                                         ; copy up to 19 chars of filename
                  LDI <_ReadBuffer STA PtrD+0                      ; _ReadBuffer -> temp PtrD
                  LDI >_ReadBuffer STA PtrD+1
  sf_namecopy:    LDR _ReadPtr CPI 40 BCC sf_nameend               ; read a name char, anything <= 39 ends name
                    STR PtrD INW _ReadPtr INW PtrD                 ; copy name char
                    DEF 0 BNE sf_namecopy
  sf_nameend:     LDI 0 STR PtrD                                   ; overwrite rest including 20th byte with zero
                  INW PtrD DEF 0 BCS sf_nameend                    ; PtrD points beyond 20-byte area

                  ; invalidate exisiting files with that name, look for enough free space on the SSD
  sf_existfile:   LDI <_ReadBuffer STA _ReadPtr+0                  ; _ReadPtr points back to filename
                  LDI >_ReadBuffer STA _ReadPtr+1
                  JPS OS_FindFile CPI 1 BNE sf_foundfree
                    LDA PtrA+2 CPI 0 BNE sf_notprotect
                      LDA PtrA+1 CPI 0x10 BCC sf_returnfalse       ; file is in write-protected area
  sf_notprotect:    LDI <sf_asktext PHS LDI >sf_asktext PHS
                    JPS OS_Print PLS PLS
                    WIN CPI 'y' BEQ sf_overwrite
                      LDI 10 OUT JPS _Wait JPA sf_returnbrk        ; used break => no error
  sf_overwrite:     LDI 10 OUT JPS _Wait
                    ; invalidate existing filename by setting it's first byte to 0 (this always works in NOR FLASH!)
                    LDI 0 BNK                                      ; spec: addresses A15-A18 must be zero
                    LDI 0xaa STA 0x5555                            ; INIT FLASH BYTE WRITE PROGRAM
                    LDI 0x55 STA 0x2aaa
                    LDI 0xa0 STA 0x5555
                    LDA PtrA+2 BNK
                    LDI 0 STR PtrA                                 ; START INVALIDATE WRITE PROCESS (overwrite to 0)
                    LIF 20 0                                       ; re-read a maximum times
    sf_delcheck:    DEF 0 BCC sf_returnfalse                       ; write took too long => ERROR!!!
                      LDR PtrA CPI 0 BNE sf_delcheck               ; re-read FLASH location -> data okay?
                        JPA sf_existfile

  sf_foundfree:   ; PtrA/PtrA+2 now point to free SSD space
                  LDA PtrE+1 SBB PtrF+1                            ; calculate data bytesize in PtrF
                  LDA PtrE+0 SBW PtrF
                  INW PtrF                                         ; PtrF = last - first + 1 = bytesize

                  LDA PtrA+2 STA PtrB+2                            ; FLASH start PtrA -> temp PtrB
                  LDA PtrA+1 STA PtrB+1
                  LDA PtrA+0 STA PtrB+0
                  LDA PtrF+0 ADW PtrB LDI 24 ADW PtrB              ; add data bytesize + 24 bytes for header
                  LDA PtrF+1 ADB PtrB+1 BPL sf_fitsin              ; no overflow > 0x8000?
                    LDI 0x80 SBB PtrB+1 INB PtrB+2                 ; handle FLASH addr overflow
                    CPI 0x10 BCS sf_returnfalse                    ; bank OVERFLOW => doesn't fit!

                  ; write header start address and bytesize
  sf_fitsin:      LDA PtrE+0 STA _ReadBuffer+20                    ; write start addr to header
                  LDA PtrE+1 STA _ReadBuffer+21
                  LDA PtrF+0 STA _ReadBuffer+22                    ; write data bytesize to header
                  LDA PtrF+1 STA _ReadBuffer+23

                  ; write header to FLASH memory
                  LDI <_ReadBuffer STA PtrC+0                      ; start addr of header -> PtrC
                  LDI >_ReadBuffer STA PtrC+1                      ; free addr is already in PtrA, PtrA+2
                  CLB PtrB+1 LDI 24 STA PtrB+0                     ; bytesize of header -> PtrB
                  JPS OS_FlashWrite                                ; write the header (incrementing PtrA, PtrA+2)
                  LDA PtrB+1 CPI 0xff BNE sf_returnfalse           ; check if all bytes have been written successfully

                  ; write body to FLASH memory
                  LDA _ReadBuffer+20 STA PtrC+0                    ; start -> PtrC
                  LDA _ReadBuffer+21 STA PtrC+1
                  LDA _ReadBuffer+22 STA PtrB+0                    ; bytesize -> PtrB
                  LDA _ReadBuffer+23 STA PtrB+1                    ; PtrA, PtrA+2 already positioned behind header
                  JPS OS_FlashWrite                                ; write the data body
                  LDA PtrB+1 CPI 0xff BNE sf_returnfalse           ; check if all bytes have been written successfully
                    LDI 1 STS 6 RTS                                ; return success, FLASH off

  sf_returnfalse: LDI 0 STS 6 RTS                                  ; return failure, FLASH off
  sf_returnbrk:   LDI 2 STS 6 RTS                                  ; signal user abortion

  sf_asktext:     'Overwrite (y/n)?', 0

; --------------------------------------------------
; Writes data to free FLASH memory starting at PtrA0..2
; The caller has to ensure that this is indeed FREE FLASH!
; PtrC: RAM source, PtrB: bytesize
; modifies: PtrB (0xffff: success, else failure)
;           PtrA (points beyond written FLASH data if successful)
;           PtrC (points to beyond written RAM source data if successful)
;           BANK
; modifies: F0
; --------------------------------------------------
OS_FlashWrite:    DEW PtrB BCC fw_return                    ; count down bytesize, underflow => success
                    LDI 0 BNK                               ; spec: addresses A15-A18 must be zero
                    LDI 0xaa STA 0x5555                     ; INIT FLASH BYTE WRITE PROGRAM
                    LDI 0x55 STA 0x2aaa
                    LDI 0xa0 STA 0x5555
                    LDA PtrA+2 BNK
                    LDR PtrC STR PtrA                       ; INITIATE BYTE WRITE PROCESS
                    LIF 20 0                                ; re-read a maximum times
  fw_writecheck:    DEF 0 BCC fw_return                     ; write took too long => PtrB != 0xffff => ERROR!
                      LDR PtrC CPR PtrA BNE fw_writecheck   ; re-read FLASH location until is data okay
                    INW PtrC INW PtrA                       ; DATA OKAY! Increase both pointers to next byte
                    JPS _FlashPtrA JPA OS_FlashWrite        ; correct PtrA and write next data byte to FLASH
  fw_return:      RTS

; ----------------------------------------------------------------------
; Eraseses a 4KB FLASH sector without any protection (handle with care!)
; push: FLASH sector 0..127 to be erased completely to 0xff
; pull: #
; modifies: PtrF, BANK
; ----------------------------------------------------------------------
OS_FlashErase:  LDI 0 BNK                        ; spec: addresses A15-A18 must be zero
                LDI 0xaa STA 0x5555              ; issue FLASH ERASE COMMAND
                LDI 0x55 STA 0x2aaa
                LDI 0x80 STA 0x5555
                LDI 0xaa STA 0x5555
                LDI 0x55 STA 0x2aaa
                LDS 3 LSR LSR LSR BNK            ; move upper 4 bits in BANK to set FLASH A15..18
                LDS 3 L5L LSR ADI 0x0f           ; shift the lower 3 bits to A12..14, set A8..11 = 1
                STA PtrF+1 LDI 0xff STA PtrF+0   ; PtrF holds A12..14, A0..11 = 0xfff (last byte of that sector).
                LDI 0x30 STR PtrF                ; initiate the BLOCK ERASE command
  fe_wait:      LDR PtrF LSL BCC fe_wait         ; wait for 8th bit of the last byte 0x...fff to go HIGH
                  RTS

; --------------------------------------------------
; Moves N bytes from S.. to D.. taking overlap into account
; push: D_lsb, D_msb, S_lsb, S_msb, N_lsb, N_msb
; Pull: #, #, #, #, #, #
; --------------------------------------------------
OS_MemMove:   LDS 3 STA PtrB+1 LDS 4 STA PtrB+0            ; B = number of bytes
              DEW PtrB BCC mc_done
              LDS 5 STA PtrA+1 LDS 6 STA PtrA+0            ; A = source
              LDS 7 STA PtrC+1 LDS 8 STA PtrC+0            ; C = destination
              LDA PtrA+1 CPA PtrC+1 BCC a_less_c BNE c_less_a
                LDA PtrA+0 CPA PtrC+0 BCC a_less_c BEQ mc_done
  c_less_a:   LDR PtrA STR PtrC
              INW PtrA INW PtrC
              DEW PtrB BCS c_less_a
                RTS
  a_less_c:   LDA PtrB+1 ADB PtrA+1 LDA PtrB+1 ADB PtrC+1
              LDA PtrB+0 ADW PtrA LDA PtrB+0 ADW PtrC
    alc_loop: LDR PtrA STR PtrC
              DEW PtrA DEW PtrC
              DEW PtrB BCS alc_loop
  mc_done:      RTS

OS_Beyond:                                   ; address of first byte beyond OS kernel code

#mute
                ; GLOBAL OS LABELS AND CONSTANTS
#org 0xfe70     _ReadPtr:                    ; Zeiger (2 bytes) auf das letzte eingelesene Zeichen (to be reset at startup)
#org 0xfe72     _ReadNum:                    ; 3-byte storage for parsed 16-bit number, MSB: 0xf0=invalid, 0x00=valid
#org 0xfe75     PtrA:                        ; lokaler pointer (3 bytes) used for FLASH addr and bank
#org 0xfe78     PtrB:                        ; lokaler pointer (3 bytes)
#org 0xfe7b     PtrC:                        ; lokaler pointer (3 bytes)
#org 0xfe7e     PtrD:                        ; lokaler pointer (2 bytes)
#org 0xfe80     PtrE:                        ; lokaler pointer (2 bytes)
#org 0xfe82     PtrF:                        ; lokaler pointer (2 bytes)
#org 0xfe84     _RandomState:                ; 4-byte storage (x, a, b, c) state of the pseudo-random generator
#org 0xfe88     ; unused
#org 0xfe89     ; unused
#org 0xfe8a     ; unused
#org 0xfe8b     ; unused
#org 0xfe8c     ; unused
#org 0xfe8d     ; unused
#org 0xfe8e     _ReadBuffer:                 ; 50 bytes of OS read buffer (input line)
#org 0xfebf     ReadLast:                    ; last byte of read buffer

                                             ; 0xfec0 - 0xfeff reserved for expansion cards

#emit

; **********************************************************************************************************

#org 0x1000                                                     ; store MinOS commands as files in bank 2

'save', 0, '              ', 0, SaveStart, SaveEnd-SaveStart    ; file header

  #mute
  #org 0xfe00                                                   ; target address at the end of OS kernel RAM
  #emit                                                         ; this allows to save code with target 0xfc00

  ; --------------------------------------------------
  ; usage: "save <first_hex_addr> <last_hex_addr> <filename> <ENTER>"
  ; receives access to command line on stack
  ; --------------------------------------------------
  SaveStart:      LIF 1 0                                       ; read in first and last hex woard address
    sv_loop:      JPS _SkipSpace JPS _ReadHex                   ; skip spaces and parse first address
                  LDA _ReadNum+2 CPI 0xf0 BEQ sv_syntax         ; wurde eine Zahl eingelesen?
                    LDA _ReadNum+0 PHS LDA _ReadNum+1 PHS       ; push onto stack
                  DEF 0 BCS sv_loop
                    JPS _SkipSpace
                    LDR _ReadPtr CPI 40 BCC sv_syntax           ; look for a valid filename, <= 39 ends name
                      JPS _SaveFile CPI 0 BNE _Prompt
                        LDI <sv_errortxt PHS LDI >sv_errortxt PHS
                        JPA sv_print
    sv_syntax:      LDI <sv_syntaxtxt PHS LDI >sv_syntaxtxt PHS
    sv_print:       JPS _Print JPA _Prompt                      ; stack cleanup intentionally left out

    sv_syntaxtxt: 'save <fst> <lst> <name>', 10, 0
    sv_errortxt:  'ERROR', 10, 0

  SaveEnd:

; **********************************************************************************************************

'dir', 0, '               ', 0, DirStart, DirEnd-DirStart       ; file header

  #mute
  #org 0xfc00                                                   ; target address of the code
  #emit

  ; ---------------------------------------------------------------------------
  ; Displays the directory of the SSD drive
  ; usage: "dir <ENTER>"
  ; Note: Do not make this routine any longer - it barely fits into command RAM
  ; ---------------------------------------------------------------------------
  DirStart:       LDI <dirtext PHS LDI >dirtext PHS JPS _Print PLS PLS ; print the directory headline
                  CLB PtrA+2 CLB PtrA+0 LDI 0x10 STA PtrA+1  					 ; point PtrA to start of SSD
                  LDI 0x07 STA PtrC+2 LDI 0xf0 STA PtrC+1 CLB PtrC+0   ; PtrC holds SSD bytesize 0x07f000

  dc_lookfiles:   LDA PtrA+2 BNK LDR PtrA CPI 0xff BEQ dc_endreached   ; end of used area reached?

                    ; first extract all data, later decide on printing
                    LDA PtrA+0 STA _ReadNum+0                          ; copy PtrA and PtrA+2 for printing
                    LDA PtrA+1 STA _ReadNum+1
                    LDA PtrA+2 STA _ReadNum+2
                    LDI 20 ADW PtrA JPS _FlashPtrA										 ; jump over filename
                    LDR PtrA STA PtrE+0 INW PtrA JPS _FlashPtrA        ; read start address -> PtrE
                    LDR PtrA STA PtrE+1 INW PtrA JPS _FlashPtrA
                    LDR PtrA STA PtrB+0 INW PtrA JPS _FlashPtrA        ; read bytesize -> PtrB
                    LDR PtrA STA PtrB+1 INW PtrA JPS _FlashPtrA        ; PtrA, PtrA+2 now point to data section
                    LDA PtrB+0 ADW PtrA                                ; add data byte size to reach beyond file
                    LDA PtrB+1 ADB PtrA+1 JPS _FlashPtrA
                    LDA PtrB+0 SBW PtrC LDI 0 SCB PtrC+2               ; subtract data bytesize in PtrB from PtrC
                    LDA PtrB+1 SBW PtrC+1
                    LDI 24 SBW PtrC LDI 0 SCB PtrC+2                   ; subtract headersize from PtrC

                    INP CPI 33 BCC _Prompt                             ; SPACE, ENTER, DEL or ESC = user break

                    LDA _ReadNum+2 BNK																 ; go back to beginning of file
										LDR _ReadNum CPI 0 BEQ dc_lookfiles  							 ; check if it is a deleted file
  dc_nextchar:        OUT JPS _Wait                                    ; print filename char
                      INW _ReadNum SBI 0x80 BCC dc_noover
                        STA _ReadNum+1 INB _ReadNum+2 BNK
  dc_noover:          LDR _ReadNum CPI 0 BNE dc_nextchar  						 ; print stuff until end marker
  dc_nameend:         LDI 20 PHS JPS _CursorX PLS
                      LDA PtrE+1 PHS JPS _PrintHex PLS                 ; start
                      LDA PtrE+0 PHS JPS _PrintHex PLS
                      LDI 27 PHS JPS _CursorX PLS
                      LDA PtrB+1 PHS JPS _PrintHex PLS                 ; bytesize
                      LDA PtrB+0 PHS JPS _PrintHex PLS
                      LDI 10 OUT JPS _Wait JPA dc_lookfiles

  dc_endreached:  LDI 25 PHS JPS _CursorX PLS
                  LDA PtrC+2 PHS JPS _PrintHex PLS
                  LDA PtrC+1 PHS JPS _PrintHex PLS
                  LDA PtrC+0 PHS JPS _PrintHex PLS
                  LDI 20 PHS JPS _CursorX PLS
                  LDI <freetext PHS LDI >freetext PHS JPS _Print
                  JPA _Prompt

  dirtext:      10, 'FILENAME........... DEST ..SIZE (ESC)', 10, 0
  freetext:     'FREE ', 10, 0

  DirEnd:

; **********************************************************************************************************

'run', 0, '               ', 0, RunStart, RunEnd-RunStart ; file header

  #mute
  #org 0xfc00                                             ; target address of the code
  #emit

  ; --------------------------------------------------
  ; Displays the directory of the SSD drive
  ; usage: "jump <address> <ENTER>"
  ; --------------------------------------------------
  RunStart:       JPS _SkipSpace JPS _ReadHex             ; skip spaces and parse first address
                  LDA _ReadNum+2 CPI 0xf0 BEQ 0x8000      ; default ist 0x8000
                    LDA _ReadNum+1 CPI 0x80 BCC rn_error  ; won't run code from SSD area
                      JPR _ReadNum
    rn_error:     LDI <rn_errortxt PHS LDI >rn_errortxt PHS JPS _Print JPA _Prompt

    rn_errortxt:  'RAM address expected.', 10, 0

  RunEnd:

; **********************************************************************************************************

'del', 0, '               ', 0, DelStart, DelEnd-DelStart ; file header

  #mute
  #org 0xfc00                                             ; target address of the code
  #emit

  ; --------------------------------------------------
  ; Deletes a file from the SSD
  ; usage: "del <filename> <ENTER>"
  ; modifies: X
  ; --------------------------------------------------
  DelStart:       JPS _SkipSpace
                  LDR _ReadPtr CPI 40 BCC de_syntax       ; look for a valid filename, code <= 39 ends
                    ; invalidate exisiting file with that name
                    JPS _FindFile CPI 1 BNE de_notferror
                    LDA PtrA+2 CPI 0 BNE de_candel        ; files from bank>0 can always be deleted
                      LDA PtrA+1 CPI 0x20 BCC de_canterror  ; protect OS command files (sector 1)
                    ; file exists and may be deleted, invalidate it's name to 0
    de_candel:      LDI 0 BNK                             ; spec: addresses A15-A18 must be zero
                    LDI 0xaa STA 0x5555                   ; INIT FLASH WRITE PROGRAM
                    LDI 0x55 STA 0x2aaa
                    LDI 0xa0 STA 0x5555
                    LDA PtrA+2 BNK
                    LDI 0 STR PtrA                        ; START WRITE PROCESS
                    LIF 20 0                              ; re-read a maximum times
    de_delcheck:    DEF 0 BCC de_flasherror               ; write took too long => ERROR!!!
                      LDR PtrA CPI 0 BNE de_delcheck      ; re-read FLASH location -> data okay?
                        JPA _Prompt                       ; FLASH off und zurück
  de_syntax:      LDI <de_errortxt PHS LDI >de_errortxt PHS JPS _Print JPA _Prompt
  de_flasherror:  LDI <de_flashtxt PHS LDI >de_flashtxt PHS JPS _Print JPA _Prompt
  de_canterror:   LDI <de_canttxt PHS LDI >de_canttxt PHS JPS _Print JPA _Prompt
  de_notferror:   LDI <de_notftxt PHS LDI >de_notftxt PHS JPS _Print JPA _Prompt

  de_errortxt:    'del <name>', 10, 0
  de_flashtxt:    'ERROR', 10, 0
  de_canttxt:     'File protected.', 10, 0
  de_notftxt:     'File not found.', 10, 0

  DelEnd:

; **********************************************************************************************************

'flash', 0, '             ', 0, FlashStart, FlashEnd-FlashStart  ; file header

  #mute
  #org 0xfc00                                                    ; target address of the code
  #emit

  ; --------------------------------------------------
  ; usage: "update <ENTER>", then paste a HEX file
  ; --------------------------------------------------
  FlashStart:         LDI <asktext PHS LDI >asktext PHS
                      JPS _Print PLS PLS
                      WIN CPI 'y' BNE _Prompt
                        LDI <writetext PHS LDI >writetext PHS
                        JPS _Print PLS PLS
                        LDI 0x00 PHS JPS _FlashErase PLS       ; erase banks 0x00-0x01
                        LDI 0x01 PHS JPS _FlashErase PLS
                        LDI <0x8000 STA PtrC+0                   ; set data source
                        LDI >0x8000 STA PtrC+1                   ; write data to banks 0x00-0x01
                        LDI <0x2000 STA PtrB+0
                        LDI >0x2000 STA PtrB+1                   ; byte size of the 2 sectors
                        CLW PtrA LDI 0 BNK STA PtrA+2            ; set destination
                        JPS _FlashWrite
                        LDA PtrB+1 CPI 0xff BEQ _Prompt          ; all went well
                          LDI <ferrortext PHS LDI >ferrortext PHS
                          JPS _Print JPA _Prompt

  asktext:        'Write RAM 8000-9fff to boot sector (y/n)?', 10, 0
  writetext:      'Writing...', 10, 0
  ferrortext:     'ERROR', 10, 0

  FlashEnd:

; **********************************************************************************************************

'receive', 0, '           ', 0, ReceiveStart, ReceiveEnd-ReceiveStart     ; file header

  #mute
  #org 0xfc00                                                    ; target address of the code
  #emit

  ; -----------------------------------------------
  ; usage: "receive <ENTER>", then paste a HEX file
  ; -----------------------------------------------
  ReceiveStart:   LDI 0xfe STA 0xffff
                  LDI <hl_starttext PHS LDI >hl_starttext PHS
                  JPS _Print PLS PLS
                  LDI >_ReadBuffer STA PtrA+1 STA _ReadPtr+1
                  CLW hl_errors                                  ; clear number of errors

  hl_readline:    LDI <_ReadBuffer STA PtrA+0 STA _ReadPtr+0
  hl_readchar:    WIN CPI 27 BEQ _Prompt
                    STR PtrA                                     ; store char ggfs. OUT
                    CPI 10 BEQ hl_scanforhex                     ; end of the line?
                      INB PtrA JPA hl_readchar                   ; look for more (just write CR=13 here)

  hl_scanforhex:  LDR _ReadPtr
                  CPI ':' BEQ hl_validline
                    CPI 10 BEQ hl_readline                       ; ignore CR=13
                      INB _ReadPtr JPA hl_scanforhex

  hl_validline:   INB _ReadPtr                                   ; move over ':'
                  JPS hl_ReadHexByte                             ; parse number of data bytes
                  STA hl_numbytes STA hl_checksum                ; store number, init line checksum
                  JPS hl_ReadHexByte STA PtrB+1 ADB hl_checksum  ; parse 16-bit address
                  LDA PtrB+1 CPI 0 BMI hl_bit15set               ; always set bit15 to move addresses < 0x8000 into RAM
                    ADI 0x80 STA PtrB+1
    hl_bit15set:  JPS hl_ReadHexByte STA PtrB+0 ADB hl_checksum
                  JPS hl_ReadHexByte                             ; parse record type
                  CPI 0x01 BEQ hl_endoffile
                    CPI 0x00 BNE hl_countaserr                   ; only allow DATA type 0x00 here
                      DEB hl_numbytes BCC hl_alllineread         ; > 0 bytes to process?

                      LDA hl_first+1 CPI 0xff BNE hl_dataloop
                        LDA PtrB+1 STA hl_first+1
                        LDA PtrB+0 STA hl_first+0

  hl_dataloop:          JPS hl_ReadHexByte STR PtrB ADB hl_checksum
                        INW PtrB DEB hl_numbytes BCS hl_dataloop

                          LDA PtrB+1 STA hl_last+1
                          LDA PtrB+0 STA hl_last+0

  hl_alllineread:         JPS hl_ReadHexByte ADB hl_checksum     ; read the checksum at the end
                          CPI 0x00 BEQ hl_readline               ; no errors? -> goto next line
  hl_countaserr:            INW hl_errors JPA hl_readline        ; go read the next line even with errors

  hl_endoffile:   ADB hl_checksum                                ; add record type that was already read
                  JPS hl_ReadHexByte ADB hl_checksum BNE hl_haveerrors   ; errors in last checksum?
                    LDA hl_errors+0 CPI 0 BNE hl_haveerrors      ; ... or in any line of the file?
                    LDA hl_errors+1 CPI 0 BEQ hl_allgood         ; ... or in any line of the file?
  hl_haveerrors:  LDI <hl_errortext PHS LDI >hl_errortext PHS    ; output the number of errors that occured
                  JPS _Print PLS PLS
                  LDA hl_errors+1 PHS JPS _PrintHex PLS          ; output number of errors
                  LDA hl_errors+0 PHS JPS _PrintHex PLS
                  JPA hl_exit

  hl_allgood:       LDI <hl_ramarea PHS LDI >hl_ramarea PHS      ; output the number of errors that occured
                    JPS _Print PLS PLS
                    LDA hl_first+1 PHS JPS _PrintHex PLS
                    LDA hl_first+0 PHS JPS _PrintHex PLS
                    LDI 32 OUT JPS _Wait
                    DEW hl_last
                    LDA hl_last+1 PHS JPS _PrintHex PLS
                    LDA hl_last+0 PHS JPS _PrintHex PLS
  hl_exit:          LDI 10 OUT JPS _Wait                         ; ENTER
                    JPA _Prompt

  ; *****************************************************************
  ; Parse a two digit HEX number
  ; *****************************************************************
  hl_ReadHexByte:  LDR _ReadPtr SBI 48
                    CPI 17 BCC hl_gotfirst
                      SBI 7
    hl_gotfirst:    L4L STA hl_hexresult                         ; store upper nibble
                    INB _ReadPtr
                    LDR _ReadPtr SBI 48
                    CPI 17 BCC hl_gotsecond
                      SBI 7
    hl_gotsecond:   ADB hl_hexresult                             ; add lower nibble
                    INB _ReadPtr
                    LDA hl_hexresult                             ; return full byte value in A
                    RTS

  hl_starttext:     'Waiting for HEX file (ESC)', 10, 0
  hl_errortext:     'Checksum errors ', 0
  hl_ramarea:       'Data written to ', 0

  hl_hexresult:     0x00
  hl_checksum:      0x00
  hl_numbytes:      0x00
  hl_errors:        0x0000
  hl_first:         0xffff
  hl_last:          0x0000

  ReceiveEnd:

; **********************************************************************************************************

'defrag', 0, '            ', 0, DefragStart, DefragEnd-DefragStart     ; file header

  #mute
  #org 0xfc00                                                          ; target address of the code
  #emit

  ; ---------------------------------------------------------------
  ; Defragments the SSD by removing/formating/freeing deleted parts
  ; usage: "defrag <ENTER>"
  ; bis: pointer beyond processed FLASH area (pbis+2 = BANK)
  ; next: pointer beyond current file in FLASH (pnext+2 = BANK)
  ; newsect: next 4KB sector to write data into (top 4 bits = BANK)
  ; ---------------------------------------------------------------
  DefragStart:    CLB dg_next+2 CLB dg_bis+2                           ; pnext = pbis = FLASH start
                  CLB dg_next+0 CLB dg_bis+0
                  LDI 0x20 STA dg_next+1 STA dg_bis+1
                  LDI 0x02 STA dg_newsect                              ; point sector to start of user SSD

    dg_nextchunk: LDI <0xe000 STA dg_ram+0 LDI >0xe000 STA dg_ram+1    ; reset RAM buffer pointer to buffer start

    dg_biseqnext: LDA dg_bis+0 CPA dg_next+0 BNE dg_copyabyte          ; bis = next?
                    LDA dg_bis+1 CPA dg_next+1 BNE dg_copyabyte
                      LDA dg_bis+2 CPA dg_next+2 BNE dg_copyabyte

                        ; current file was processed (read into RAM) completely => try fetching next file
                        LDA dg_next+0 STA PtrA+0                       ; bis now points beyond current file
                        LDA dg_next+1 STA PtrA+1
                        LDA dg_next+2 STA PtrA+2                       ; PtrA = next pointer
      dg_checknext:     LDA PtrA+2 BNK LDR PtrA                        ; READ BYTE AT "NEXT" LOCATION
                        CPI 0xff BEQ dg_endofused                      ; END OF USED SSD AREA REACHED?
                          PHS                                          ; NO! -> store first byte of filename
                          LDI 22 ADW PtrA JPS _FlashPtrA               ; find file data bytesize
                          LDR PtrA STA PtrB+0 INW PtrA JPS _FlashPtrA  ; read bytesize -> PtrB
                          LDR PtrA STA PtrB+1 INW PtrA JPS _FlashPtrA  ; PtrA now point to data section
                          LDA PtrB+0 ADW PtrA+0                        ; add bytesize to get beyond file for new "next"
                          LDA PtrB+1 ADB PtrA+1 JPS _FlashPtrA         ; PtrA points beyond current file!
                          LDA PtrA+0 STA dg_next+0                     ; WE HAVE AN UNTESTED NEW NEXT FILE LOCATION
                          LDA PtrA+1 STA dg_next+1
                          LDA PtrA+2 STA dg_next+2
                          PLS CPI 0 BNE dg_copythisfile                ; *bis != 0? Visible file that needs copying?
                            LDI '.' OUT JPS _Wait                      ; signal an invisible fragment
                            LDA dg_next+0 STA dg_bis+0                 ; mark it as processed...
                            LDA dg_next+1 STA dg_bis+1                 ; ... without copying it to RAM
                            LDA dg_next+2 STA dg_bis+2                 ; now PtrA = next = bis
                            JPA dg_checknext                           ; go look for a non-deleted file
    dg_copythisfile:      LDI 'f' OUT JPS _Wait                        ; signal a visible file
                          JPA dg_biseqnext                             ; reenter copying loop

    dg_copyabyte: LDA dg_ram+1 CPI >0xf000 BCC dg_ramokay              ; is there enough space in RAM 0x8000..0xefff?
                    ; RAM buffer is full => byte cannot be read and written
                    JPS writeRAM LDA PtrB+1 CPI 0xff BEQ dg_nextchunk  ; formats and writes (unfinished) chunk
      dg_error:       LDI <dg_errtxt PHS LDI >dg_errtxt PHS JPS _Print ; error message
                      JPA _Prompt
    dg_ramokay:   ; read a byte from 'dg_bis' to dg_ram
                  LDA dg_bis+2 BNK                                     ; set bank register for read
                  LDR dg_bis STR dg_ram                                ; read FLASH address and result store in RAM
                  INW dg_ram
                  INW dg_bis SBI 0x80 BCC dg_biseqnext      ; correct FLASH address
                    STA dg_bis+1 INB dg_bis+2 JPA dg_biseqnext

; writes a chunk of copied RAM data to FLASH starting at sector 'dg_newsect', FLASH addr 0x000
; PtrA+0..2: FLASH destination
; PtrB+0..1: RAM bytesize
; PtrC+0..1: RAM source addr
  writeRAM:     LDI '#' OUT JPS _Wait
								LDA dg_newsect LSR LSR LSR STA PtrA+2                  ; set FLASH write destination
                LDA dg_newsect L5L LSR STA PtrA+1 CLB PtrA+0           ; to start of that sector
                LDA dg_ram+0 STA PtrB+0                                ; PtrB = bytesize
                LDA dg_ram+1 SBI >0xe000 STA PtrB+1                    ; = RAM "beyond" pointer - RAM "start"
                LDI <0xe000 STA PtrC+0                                 ; PtrC = RAM source 0x8000
                LDI >0xe000 STA PtrC+1
                DEW dg_ram                                             ; goto "last used" RAM location
                LDI >0xe000 SBB dg_ram+1 BCS dg_bytes                  ; calc required highest bank
                  STA PtrB+1 RTS                                       ; return "success" since nothing was written
  dg_bytes:     LDA dg_newsect PHS JPS OS_FlashErase PLS               ; erase this FLASH bank
                INB dg_newsect                                         ; goto next free bank
                  LDA PtrA+2 BNK                                       ; set bank register, everything else was set above
                  JPS OS_FlashWrite                                    ; write used RAM chunk to FLASH
                  RTS

; end of used SSD area => write the rest of RAM buffer to FLASH, format all used banks above
  dg_endofused: JPS writeRAM LDA PtrB+1 CPI 0xff BNE dg_error          ; formats and writes (unfinished) chunk
                DEW dg_bis BCS dg_nounder                              ; perform dg_bis-- to point to "last processed" location
                  DEB dg_bis+2 LDI 0x7f STA dg_bis+1                   ; correct FLASH pointer during underflow
    dg_nounder: LDA dg_bis+2 NBL L3L STA dg_bis+2                      ; calculate last used sector in bis+2 (destroying it)
                LDA dg_bis+1 LSL LSR NBH ADB dg_bis+2                  ; add lower 3 bits
    dg_laloop:  LDA dg_newsect CPA dg_bis+2 BGT dg_raus                ; FORMAT NOW EMPTY SECTIONS THAT WERE USED
                  PHS JPS OS_FlashErase PLS                            ; format this bank
                  INB dg_newsect JPA dg_laloop
    dg_raus:    LDI 10 OUT JPS _Wait                                   ; ENTER
                JPA _Prompt                                            ; END

  dg_errtxt:      10, 'WRITE ERROR', 10, 0

  dg_ram:         0xffff                     ; pointer to next free RAM location (0x8000..0xefff)
  dg_bis:         0xffff, 0xff               ; pointer (bank/sector addr) to last read location of FLASH
  dg_next:        0xffff, 0xff               ; pointer beyond current file's FLASH area
  dg_newsect:     0xff                       ; next free bank

  DefragEnd:

; **********************************************************************************************************

'clear', 0, '             ', 0, ClearStart, ClearEnd-ClearStart    ; file header

  #mute
  #org 0xfc00                                             ; target address of the code
  #emit

  ; --------------------------------------------------
  ; Clears the VGA screen and positions the cursor at the top
  ; usage: "jump <address> <ENTER>"
  ; --------------------------------------------------
  ClearStart:     JPS _Clear
                  JPA _Prompt

  ClearEnd:

; **********************************************************************************************************

'mon', 0, '               ', 0, MonStart, MonEnd-MonStart ; file header

  #mute
  #org 0xfc00                                             ; target address of the code
  #emit

  ; --------------------------------------------------
  ; Memory Monitor
  ; usage: "mon [hexaddr.hexaddr] <ENTER>"
  ; modifies: X
  ; --------------------------------------------------
  MonStart:   LDI <montxt PHS LDI >montxt PHS JPS _Print PLS PLS   ; print start line
              CLB PtrA+2 CLW PtrA+0                       ; default memory address and bank

              LDR _ReadPtr CPI 10 BNE initline            ; use command line of mon

              JPS _SkipSpace JPS _ReadHex                 ; skip an optional start address
              LDA _ReadNum+2 CPI 0xf0 BEQ monline         ; wurde eine Zahl eingelesen?
                JPS mon_numtoa                            ; first address

  monline:    JPS mon_addr
              LDI ' ' OUT JPS _Wait

              LDI <_ReadBuffer+5 STA _ReadPtr+0           ; parse fewer bytes due to "0000 _"
              LDI >_ReadBuffer+5 STA _ReadPtr+1
              JPS _ReadLine                               ; get a line of input until ENTER or end of input buffer

  initline:   LDI 0xf0 STA _ReadNum+2                     ; invalidate parsed number
              CLW _ReadNum CLB mode                       ; reset monitor mode=0

              LDR _ReadPtr CPI 10 BNE parsing
                JPS _Wait JPA _Prompt                     ; FLASH off and back to OS

  parsing:    LDR _ReadPtr                                ; BYTE-BY-BYTE PARSING OF THE LINE INPUT BUFFER
              CPI '#' BEQ cross                           ; # switch to 'bank' mode
              CPI ':' BEQ doppel                          ; : switch to 'deposit' mode
              CPI '.' BEQ punkt                           ; . switch to 'list' mode
              CPI 'a' BCS sletter                         ; a..f for hex numbers
              CPI '0' BCS zahl                            ; 0..9 for numbers
                NOP NOP
                LDA _ReadNum+2                            ; ALLES ANDERE IST "ENTER"
                CPI 0xf0 BNE doaction                     ; prüfe, ob valide parse-Daten vorliegen
  clrparsed:      LDI 0xf0 STA _ReadNum+2                 ; ***** ENDE DES PARSINGS (AUCH MEHRERER BYTES) *****
                  CLW _ReadNum
  parsed:         LDR _ReadPtr                            ; ENDE DES PARSINGS EINES BYTES
                  CPI 10 BEQ monline                      ; prüfe hier NOCHMAL auf ENTER wg. Zeilenende
                    INB _ReadPtr JPA parsing              ; gehe zum nächsten Zeichen des Puffers

  doppel:     LDI 1 JPA setmode                           ; : => umschalten auf DEPOSIT mode
  punkt:      LDI 2 JPA setmode                           ; . => umschalten auf LIST mode
  cross:      LDI 3                                       ; # => umschalten auf BANK mode
  setmode:    STA mode
              LDA _ReadNum+2                              ; validen input vorhergehend . oder : als 'PtrA' übernehmen
              CPI 0xf0 BEQ clrparsed                      ; liegt kein valider input vor?
    setmemadr:  JPS mon_numtoa
                JPA clrparsed                             ; . : kam ohne valide Addresse davor

    sletter:  SBI 39                                      ; parse one byte normal hex input
    zahl:     SBI 48 PHS
              LLW _ReadNum RLB _ReadNum+2                 ; this automatically validates a parsed number
              LLW _ReadNum RLB _ReadNum+2                 ; shift existing hex data to the left
              LLW _ReadNum RLB _ReadNum+2
              LLW _ReadNum RLB _ReadNum+2
              PLS ADB _ReadNum                            ; add new hex nibble to the right
              JPA parsed

  doaction:     LDA mode                                  ; ***** ES LIEGT EIN VALIDES PARSE-DATUM VOR *****
                CPI 0 BEQ setmemadr                       ; mode=0 -> übernimm Daten als einfache neue PtrA
                CPI 1 BEQ mode_deposit                    ; mode=1 -> übernimm Daten als 'deposit'
                CPI 2 BEQ startlistpage

  ; mode=3 -> set bank address
                  LDI <banktxt PHS LDI >banktxt PHS JPS _Print PLS PLS
                  LDA _ReadNum+0 STA PtrA+2 PHS JPS _PrintHex PLS   ; pointless to set BNK here, just store in PtrA+2
                  LDI 10 OUT JPS _Wait                    ; ENTER
                  JPA clrparsed

  ; mode=2 -> Daten sind 'list until', print list
  startlistpage:  LDI 24 STA PtrC                         ; reuse as line counter
  startlistline:  LIF 16 0                                ; init 16-bytes counter
                  JPS mon_addr
                  LDI ' ' OUT JPS _Wait
                  LDI ' ' OUT JPS _Wait
  nextlist:       LDA PtrA+2 BNK LDR PtrA
                  PHS JPS _PrintHex PLS                   ; Speicherinhalt drucken
                  LDA PtrA+0
                  CPA _ReadNum+0
                  BNE listweiter
                    LDA PtrA+1
                    CPA _ReadNum+1
                    BNE listweiter
                      JPS mon_enter
                      JPA clrparsed
  listweiter:     INW PtrA
                  DEF 0 BEQ lineend
                    L5L BNE nextlist
                      LDI ' ' OUT JPS _Wait
                      JPA nextlist                        ; bug-fix by paulscottrobson Thank you!

  lineend:        JPS mon_enter
                  DEB PtrC BNE startlistline              ; reuse as line counter
                    WIN  CPI 27 BNE startlistpage         ; warte auf Tastendruck
                      JPA clrparsed

  mode_deposit: LDA _ReadNum STR PtrA                     ; validen Daten -> deposit in RAM only
                INW PtrA JPA clrparsed

  mon_enter:    LDI 10 OUT JPS _Wait                      ; ENTER
                RTS
  mon_addr:     LDA PtrA+1 PHS JPS _PrintHex PLS          ; Drucke aktuelle list-Adresse
                LDA PtrA+0 PHS JPS _PrintHex PLS
                RTS
  mon_numtoa:   LDA _ReadNum+0 STA PtrA+0                 ; valide Daten -> PtrA
                LDA _ReadNum+1 STA PtrA+1
                RTS

  mode:         0xff
  montxt:       10, 'MONITOR (',39,':',39,' write, ',39,'.',39,' to, ',39,'#',39,' bank, ESC to stop)', 0
  banktxt:      'BANK ', 0

  MonEnd:

; **********************************************************************************************************

'memset', 0, '            ', 0, MemsetStart, MemsetEnd-MemsetStart          ; file header

  #mute
  #org 0xfc00                                             ; target address of the code
  #emit

  ; --------------------------------------------------
  ; usage: "memset <adr_first> <adr_last> <byte> <ENTER>"
  ; --------------------------------------------------
  MemsetStart:    JPS _SkipSpace JPS _ReadHex             ; skip spaces and parse first address
                  LDA _ReadNum+2 CPI 0xf0 BEQ mf_syntax   ; wurde eine Zahl eingelesen?
                    LDA _ReadNum+0 STA PtrA+0             ; first address
                    LDA _ReadNum+1 STA PtrA+1
                  JPS _SkipSpace JPS _ReadHex             ; skip spaces and parse last address
                  LDA _ReadNum+2 CPI 0xf0 BEQ mf_syntax
                    LDA _ReadNum+0 STA PtrB+0             ; last address
                    LDA _ReadNum+1 STA PtrB+1
                  JPS _SkipSpace JPS _ReadHex             ; skip spaces and parse byte value
                  LDA _ReadNum+2 CPI 0xf0 BEQ mf_syntax

  mfnext:           LDA _ReadNum+0 STR PtrA               ; BESCHREIBE DEN SPEICHER
                    LDA PtrA+0 CPA PtrB+0 BNE mfweiter
                      LDA PtrA+1 CPA PtrB+1 BEQ _Prompt
  mfweiter:             INW PtrA
                        JPA mfnext

  mf_syntax:      LDI <mf_errortxt PHS LDI >mf_errortxt PHS JPS _Print
                  JPA _Prompt

  mf_errortxt:    'memset <fst> <lst> <val>', 10, 0

  MemsetEnd:

; **********************************************************************************************************

'memmove', 0, '           ', 0, MemmoveStart, MemmoveEnd-MemmoveStart   ; file header

  #mute
  #org 0xfc00                                                    ; target address of the code
  #emit

  ; --------------------------------------------------
  ; usage: "memmove <adr_first> <adr_last> <adr_dest> <ENTER>"
  ; --------------------------------------------------
  MemmoveStart:   JPS _SkipSpace JPS _ReadHex                    ; skip spaces and parse first address
                  LDA _ReadNum+2 CPI 0xf0 BEQ sc_syntax          ; wurde eine Zahl eingelesen?
                    LDA _ReadNum+0 STA PtrA+0                    ; first address
                    LDA _ReadNum+1 STA PtrA+1
                  JPS _SkipSpace JPS _ReadHex                    ; skip spaces and parse last address
                  LDA _ReadNum+2 CPI 0xf0 BEQ sc_syntax
                    LDA _ReadNum+0 STA PtrB+0                    ; last address
                    LDA _ReadNum+1 STA PtrB+1
                  JPS _SkipSpace JPS _ReadHex                    ; skip spaces and parse byte value
                  LDA _ReadNum+2 CPI 0xf0 BEQ sc_syntax
                    LDA _ReadNum+0 PHS
                    LDA _ReadNum+1 PHS                           ; push destination
                    LDA PtrA+0 PHS SBW PtrB                      ; push source
                    LDA PtrA+1 PHS SBB PtrB+1 INW PtrB           ; B = B - A + 1
                    LDA PtrB+0 PHS LDA PtrB+1 PHS                ; push number of bytes
                    JPS OS_MemMove                               ; do not clean up the stack
                    JPA _Prompt

  sc_syntax:      LDI <sc_errortxt PHS LDI >sc_errortxt PHS JPS _Print
                  JPA _Prompt

  sc_errortxt:    'memmove <fst> <lst> <dst>', 10, 0

  MemmoveEnd:

; **********************************************************************************************************

'format', 0, '            ', 0, FormatStart, FormatEnd-FormatStart      ; file header

  #mute
  #org 0xfc00                                                    ; target address of the code
  #emit

  ; --------------------------------------------------
  ; usage: "format <ENTER>"
  ; --------------------------------------------------
  FormatStart:    LDI <fm_asktext PHS LDI >fm_asktext PHS JPS _Print PLS PLS
                    WIN CPI 'y' BNE _Prompt
                    LDI <fm_formtext PHS LDI >fm_formtext
                    PHS JPS _Print PLS PLS  
    format_all:     LDI 2                                        ; start of SSD sector
    format_loop:    PHS JPS _FlashErase PLS                      ; push sector numbers ..127 and delete
                    INC BPL format_loop
                  JPA _Prompt

    fm_asktext:   'Are you sure? (y/n)', 10, 0
    fm_formtext:  'Formating SSD.', 10, 0

  FormatEnd:

; **********************************************************************************************************

0, '                  ', 0, 0x0000, 0x2000-*-2                   ; dummy file filling up rest of bank 1
