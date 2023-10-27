; ------------------------------------------------------------
; Native Assembler Version 2.1 for the 'Minimal' Home Computer
; written by Carsten Herting      02.10.2022 - 06.10.2022
; adapted to Minimal UART Ultra   10.09.2023 - 11.09.2023
; ------------------------------------------------------------

; CHANGE LOG:
; 11.09.2023: Initial release includes new mnemonics and support for fast jump instructions "F..".
; 10.10.2023: Upgraded to the latest standard version for Minimal 64, Minimal 64x2 and Minimal UART Ultra.

; LICENSING INFORMATION
; This is free software: you can redistribute it and/or modify it under the terms of the
; GNU General Public License as published by the Free Software Foundation, either
; version 3 of the License, or (at your option) any later version.
; This software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
; the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
; License for more details. You should have received a copy of the GNU General Public License along
; with this program. If not, see https://www.gnu.org/licenses/.

#org 0xe000   ; build address of the assembler (change to 0xd000 for natively building this assembler by itself)

; Building this assembler on the Minimal natively: Change the above build address from 0xe000 to 0xd000.
; Remove all comments of this file by searching for REGEX ;([\s\S]*) and replacing with nothing.
; Remove all trailing SPACES, too. Upload the remaining source file into the MINIMAL editor with Ctrl+R.
; Build with 'asm ENTER'. Copy the output to it's target address with 'memmove d000 dfff e000 ENTER'.

#mute
#org 0xe000   ; target address of the assembler (do not change this unless you know what you are doing)
#emit

Init:         LDI 0xfe STA 0xffff                           ; init stack
              LDI <IntroText PHS LDI >IntroText PHS
              JPS _Print PLS PLS                            ; print the intro message
              JPS _SkipSpace                                ; parse command line: skip spaces after 'asm   filename'
              LDR _ReadPtr CPI 33 BCC PassOne               ; FILENAME in command line?
                JPS _LoadFile                               ; load it with filename in _ReadPtr
                CPI 1 BEQ PassOne                           ; file found?
                  LDI <FileMsg PHS LDI >FileMsg PHS         ; print out "file not found" error
                  JPS _Print PLS PLS
                  JPA _Prompt

IntroText:    'Minimal Ultra Assembler', 10, 0
FileMsg:      'File not found.', 10, 0
LineMsg:      'Error in line ', 0
FastMsg:      'Invalid jump in line ', 0

; --------------------------------------------------------- ;

; evaluate byte size of all elements, extract label definitions and calculate their addresses
PassOne:      JPS init_cntrs CLB labels CLB isfastjump      ; write a EOF zero to "empty" label table, no fastjump
              JPS findelem CPI 0 BNE p1_entry               ; check for a first element
                JPA _Prompt
  OneFind:    JPS findelem CPI 0 BEQ PassTwo                ; find next element starting at ep
    p1_entry:   LDA ep+0 STA ptr+0 LDA ep+1 STA ptr+1       ; ptr = ep
                JPS elength                                 ; get element length 'elen'
                DEC ADW ptr                                 ; look at last char of the element...
  OneTest:      LDR ptr CPI ':' BEQ OneLabeldef             ; ... and test for :
                LDR ep CPI '#' BEQ OnePreproc               ; look at start of element... test for #
                CPI 39 BEQ OneString                        ; test for '
                CPI '<' BEQ OneByte                         ; test for < LSB operator
                CPI '>' BEQ OneByte                         ; test for > MSB operator
  OneExpression:  CPI '+' BEQ OneSign
                  CPI '-' BNE OneHex
    OneSign:        INW ep DEB elen                         ; consume sign
    OneHex:       LDR ep CPI '0' BNE OneStar
                    INW ep DEB elen
                    LDR ep CPI 'x' BNE OneNothex
                      INW ep DEB elen CPI 2 BLE OneByte
    OneWord:            LDA isfastjump CPI 1 BEQ OneByte    ; isfastjump == 1 => only count 1 byte for "fast jump" addr
                          INW pc                            ; case counts 2 bytes
    OneByte:            INW pc
                        CLB isfastjump JPA OneExit          ; clear isfastjump after any element except "F.."
    OneNothex:    DEW ep INB elen
                  LDR ep
    OneStar:      CPI '*' BEQ OneWord
    OneDecimal:   CPI '0' BCC OneMnemon
                    CPI '9' BGT OneMnemon
                      JPA OneByte
    OneMnemon:    LDA elen CPI 3 BNE OneWord
                    JPS OpCode LSL BCS OneWord              ; check for mnemonic, otherwise, it must be a label!
                      LDR ep CPI 'F' BNE OneByte            ; it's a mnemonic, now check for "F.."
                        LDI 1 STA isfastjump                ; it's a "fast jump" instruction "F.."
                        INW pc JPA OneExit                  ; count 1 byte without clearing "isfastjump"
  OneLabeldef:    LDA elen DEC STF 0                        ; handle label definitions here
                    JPS findlabel CPI 0 BNE Error           ; already existing? => Error!
                    JPS putlabel JPA OneExit                ; store the new label
  OnePreproc:     LDA elen CPI 4 BNE OneExit
                    LDA ep+0 STA ptr+0 LDA ep+1 STA ptr+1
                    INW ptr LDR ptr CPI 'o' BNE OneExit
                    INW ptr LDR ptr CPI 'r' BNE OneExit
                    INW ptr LDR ptr CPI 'g' BNE OneExit
                      LDA elen ADW ep
                      JPS findelem JPS elength
                      LDA ep+0 STA ptr+0 LDA ep+1 STA ptr+1
                      LDR ptr CPI '0' BNE Error INW ptr
                      LDR ptr CPI 'x' BNE Error INW ptr
                        LDA ptr+0 STA _ReadPtr+0
                        LDA ptr+1 STA _ReadPtr+1
                        JPS _ReadHex
                        LDA _ReadNum+2 CPI 0xf0 BEQ Error
                          LDA _ReadNum+0 STA pc+0           ; accept new PC
                          LDA _ReadNum+1 STA pc+1
                          JPA OneExit
  OneString:  LDA elen SBI 2 ADW pc
  OneExit:    LDA elen ADW ep JPA OneFind                   ; jump over this element and look for more elements

; --------------------------------------------------------- ;

; emit code directly into memory, substituting address values for label references
PassTwo:      JPS init_cntrs                                ; reset ep, pc, mc
              LDI 1 STA isemit                              ; switch ON code emission by default
  TwoFindNext:  JPS findelem CPI 0 BEQ PassDone             ; goto next element starting at ep?
                JPS elength                                 ; get element length
                LDA ep+0 STA enext+0 LDA ep+1 STA enext+1   ; compute (ep + elen) = position beyond this element
                LDA elen ADW enext
              LDR ep CPI '#' BEQ TwoPreproc                 ; handle PREPROCESSOR commands
                LDA ep+0 STA ptr+0 LDA ep+1 STA ptr+1       ; ep -> ptr for look-ahead
                LDA elen DEC ADW ptr                        ; look at last char of current element
                LDR ptr CPI ':' BEQ TwoExit                 ; ignore label definitions (they don't emit anything)
                  LDR ep CPI 39 BEQ TwoString               ; test for ' string
                    LDA elen CPI 3 BNE TwoExpress           ; anything with length != 3 => EXPRESSION
                      JPS OpCode CPI 0x80 BCS TwoExpress    ; anything != OpCode => EXPRESSION
; --------------------------------------------------------- ;
  TwoMnemonic:          STF 0 INW pc                        ; MNEMONIC => save the opcode temporarily
                        LDA isemit CPI 0 BEQ tm_noemit
                          LDF 0 STR mc INW mc               ; isemit = 1 => emit opcode
    tm_noemit:            LDR ep CPI 'F' BNE TwoExit        ; test for "fast jump" instruction "F.."
                            LDI 1 STA isfastjump            ; enable "fastjump" check for next element
                            JPA TwoExitF                    ; same as JPA TwoExit but w/o clearing "isfastjump"
; --------------------------------------------------------- ;
  TwoExpress:   CLB lsbmsb LDI 1 STA sign                   ; ***** EXPRESSION PARSING IN "+/-TERMS" *****
                CLW expr CLW term

                LDR ep CPI '<' BEQ ex_lsbmsbop              ; read LSB and MSB operators
                  CPI '>' BNE ex_while                      ; enter part loop
  ex_lsbmsbop:      STA lsbmsb INW ep                       ; consume an LSB/MSB operator

  ex_while:     LDA ep+1 CPA enext+1 BCC ex_dosign          ; while (x < ep + elen) ...
                  LDA ep+0 CPA enext+0 BCS TwoEmitExpr      ; end of expression reached? => end while and emit expr!

    ex_dosign:      LDR ep CPI '+' BNE ex_noplus            ; check for a +/- sign of that part
                      LDI 1 JPA ex_storesign
    ex_noplus:      CPI '-' BNE ex_dohex
                      LDI -1
      ex_storesign:   STA sign CLW term INW ep              ; store sign, reset term and move over sign

    ex_dohex:       LDR ep CPI '0' BNE ex_dostar            ; check for 0x...
                      LDA ep+0 STA _ReadPtr+0               ; use pointer for look-ahead
                      LDA ep+1 STA _ReadPtr+1
                      INW _ReadPtr
                      LDR _ReadPtr CPI 'x' BNE ex_latedeci  ; maybe late entry into decimal number?
                        INW _ReadPtr LDA _ReadPtr+0 STF 0   ; remember LSB of position
                        JPS _ReadHex                        ; _ReadPtr points beyond hex number
                        LDA _ReadNum+2 CPI 0xf0 BEQ Error
                          LDA _ReadNum+0 STA term+0
                          LDA _ReadNum+1 STA term+1
                          LDA _ReadPtr+0 SBF 0
                          CPI 3 BCC ex_hexno_w              ; if (k-x > 4 && lsbmsb == 0) lsbmsb = 'w';
                            LDA lsbmsb CPI 0 BNE ex_hexno_w
                              LDI 'w' STA lsbmsb            ; it's a word
    ex_hexno_w:       LDA _ReadPtr+0 STA ep+0               ; advance over hex num
                      LDA _ReadPtr+1 STA ep+1
                      JPA ex_addterm

    ex_dostar:      CPI '*' BNE ex_dodecimal                ; check for * location symbol
                      LDA mc+0 STA term+0                   ; term = mc (emission counter); x++;
                      LDA mc+1 STA term+1
                      INW ep                                ; consume *
                      LDA lsbmsb CPI 0 BNE ex_addterm       ; if (lsbmsb == 0) lsbmsb = 'w';
                        LDI 'w' STA lsbmsb JPA ex_addterm

    ex_dodecimal:   CPI '0' BCC ex_dolabel                  ; decimal number (test this only after 0x test)
      ex_latedeci:    LDR ep CPI '9' BGT ex_dolabel
      ex_nextdec:       LLW term STA ptr+1
                        LDA term+0 STA ptr+0                ; store term*2 in ptr
                        LLW term LLW term
                        LDA ptr+1 ADB term+1
                        LDA ptr+0 ADW term                  ; term*8 + term*2 = term*10
                        LDR ep SBI '0' ADW term INW ep      ; consume this digit
                        LDR ep CPI '0' BCC ex_addterm       ; next one still decimal?
                          CPI '9' BGT ex_addterm
                            JPA ex_nextdec

    ex_dolabel:     LDA lsbmsb CPI 0 BNE ex_cutref          ; make it a word?
                      LDI 'w' STA lsbmsb
      ex_cutref:    JPS findreflength                       ; ep = label start, returns X = label byte length
                    JPS findlabel                           ; length X and ep remain unchanged!
                    CPI 1 BNE Error                         ; ERROR: Unknown label reference.
                      LDF 0 ADW ep                          ; advance over label
                      LDR lptr STA term+0 DEW lptr          ; take label value from table
                      LDR lptr STA term+1
                      JPA ex_addterm

  ex_addterm:   LDA sign CPI 1 BEQ ex_possign               ; ADD TERM TO EXPRESSION expr += sign * term
                  NEW term                                  ; term = -term
    ex_possign: LDA term+1 ADB expr+1 LDA term+0 ADW expr
                JPA ex_while

; --------------------------------------------------------- ;
  TwoEmitExpr:  LDA lsbmsb CPI 'w' BNE ex_trymsb            ; EMISSION OF EXPRESSION: case LSB MSB (little endian)
                  LDA isfastjump CPI 0 BEQ ex_lsbmsb        ; "w": check for "fast jump" flag
                    LDA expr+1 CPA pc+1 BEQ ex_emitlsb      ; assert matching MSBs for a fast branch
                      LDI <FastMsg PHS LDI >FastMsg PHS     ; ERROR: Fast branch is out of reach!
                      JPS _Print PLS JPS linenr PLS
                      LDI 10 OUT JPS _Wait
                      JPA _Prompt
    ex_lsbmsb:    INW pc LDA isemit CPI 0 BEQ ex_emitmsb    ; case LSB MSB
                    LDA expr+0 STR mc INW mc
    ex_emitmsb:   INW pc LDA isemit CPI 0 BEQ TwoExit
                    LDA expr+1 STR mc INW mc JPA TwoExit
    ex_trymsb:  CPI '>' BEQ ex_emitmsb                      ; case MSB only
    ex_emitlsb:   INW pc LDA isemit CPI 0 BEQ TwoExit       ; case LSB only
                    LDA expr+0 STR mc INW mc JPA TwoExit    ; isemit = 1
                    
; --------------------------------------------------------- ;
  TwoString:  INW ep LDA elen SBI 2 STF 0                   ; move over ' and let X = elen - 2 (omit '')
    ts_loop:  DEF 0 BCC TwoExit                             ; emit the characters to *mc++
                LDA isemit CPI 0 BEQ ts_noemit              ; isemit = 0 => pc++, mc unchanged
                  LDR ep STR mc INW mc                      ; emit something!
    ts_noemit:  INW ep INW pc JPA ts_loop
; --------------------------------------------------------- ;
  TwoPreproc: LDA ep+0 STA ptr+0 LDA ep+1 STA ptr+1         ; ep -> working ptr
              LDA elen CPI 4 BNE TwoFive                    ; "#mute" or "#emit"?
                INW ptr LDR ptr CPI 'o' BNE TwoExit         ; no => assert "#org"
                INW ptr LDR ptr CPI 'r' BNE TwoExit
                INW ptr LDR ptr CPI 'g' BNE TwoExit
                  LDA elen ADW ep                           ; move over #org manually, no way back to TwoExit!!!
                  JPS findelem JPS elength                  ; parse 0x0000 after #org
                  LDA ep+0 STA ptr+0 LDA ep+1 STA ptr+1     ; ep -> working ptr
                  LDR ptr CPI '0' BNE Error INW ptr         ; assert a hex address
                  LDR ptr CPI 'x' BNE Error INW ptr
                    LDA ptr+0 STA _ReadPtr+0                ; prepare HEX parsing
                    LDA ptr+1 STA _ReadPtr+1
                    JPS _ReadHex                            ; parse!
                    LDA _ReadNum+2 CPI 0xf0 BEQ Error       ; valid hex number?
                      LDA _ReadNum+0 STA pc+0               ; always accept as new PC
                      LDA _ReadNum+1 STA pc+1
                      LDA isemit CPI 0 BEQ TwoPreExit       ; isemit = 1?
                        LDA _ReadNum+0 STA mc+0             ; then accept as new emission counter, too!
                        LDA _ReadNum+1 STA mc+1
      TwoPreExit:     LDA elen ADW ep JPA TwoFindNext       ; move over '0x0000' manually and look for next element
    TwoFive:  CPI 5 BNE TwoExit
                INW ptr LDR ptr CPI 'm' BEQ TwoMute
                CPI 'e' BNE TwoExit
                INW ptr LDR ptr CPI 'm' BNE TwoExit
                INW ptr LDR ptr CPI 'i' BNE TwoExit
                INW ptr LDR ptr CPI 't' BNE TwoExit
                  LDI 1 STA isemit JPA TwoExit              ; emit
    TwoMute:  INW ptr LDR ptr CPI 'u' BNE TwoExit
              INW ptr LDR ptr CPI 't' BNE TwoExit
              INW ptr LDR ptr CPI 'e' BNE TwoExit
                CLB isemit JPA TwoExit                      ; mute
; --------------------------------------------------------- ;
  TwoExit:    CLB isfastjump                                ; clear "fastjump" support for next element
    TwoExitF: LDA enext+0 STA ep+0 LDA enext+1 STA ep+1     ; jump over element and look for more elements
              JPA TwoFindNext
; --------------------------------------------------------- ;

PassDone:     LDI <DoneText PHS LDI >DoneText PHS           ; print out last used address
              JPS _Print PLS PLS                            ; to facilitate saving
              DEW mc
              LDA mc+1 PHS JPS _PrintHex PLS
              LDA mc+0 PHS JPS _PrintHex PLS
              LDI 10 OUT JPS _Wait
              JPA _Prompt                                   ; also cleans up stack

DoneText:     'Last byte at 0x', 0

; --------------------------------------------------------- ;

; initializes element pointer and program counter
init_cntrs:   LDI <source STA ep+0 LDI >source STA ep+1     ; set ep to start of source code
              LDI <default STA pc+0 STA mc+0                ; set pc & mc to default target address
              LDI >default STA pc+1 STA mc+1
              RTS

; prints out an error message containing the line number and the erroneous element
Error:        LDI <LineMsg PHS LDI >LineMsg PHS JPS _Print PLS
              JPS linenr
              LDI ' ' OUT JPS _Wait
              LDI '"' OUT JPS _Wait
  er_loop:    DEB elen BCC er_endelem                       ; print out erroneous element
                LDR ep OUT JPS _Wait INW ep JPA er_loop
  er_endelem: LDI '"' OUT JPS _Wait
              LDI 10 OUT JPS _Wait
              LDI 0xfe STA 0xffff
              JPA _Prompt

; checks whether a mnemonic is present at ep+0..2
; returns: opcode or 0x80 for 'no mnemonic'
OpCode:         CLB oc_opcode                                    ; start at the first opcode
                LDI <mnemonics STA oc_mptr+0                     ; oc_mptr at start of mnemonic table
                LDI >mnemonics STA oc_mptr+1
                LDA ep+0 STA oc_ep0+1 STA oc_ep1+1 STA oc_ep2+1  ; init ep pointers to 1s2, 2nd, 3rd letter
                LDA ep+1 STA oc_ep0+2 STA oc_ep1+2 STA oc_ep2+2
                INW oc_ep1+1 LDI 2 ADW oc_ep2+1
  oc_ep0:       LDA 0xffff CPR oc_mptr BNE oc_isnt0
                  INW oc_mptr
  oc_ep1:       LDA 0xffff CPR oc_mptr BNE oc_isnt1
                  INW oc_mptr
  oc_ep2:       LDA 0xffff CPR oc_mptr BNE oc_isnt2
                  LDA oc_opcode RTS
  oc_isnt0:     INW oc_mptr
  oc_isnt1:     INW oc_mptr
  oc_isnt2:     INW oc_mptr
                INB oc_opcode BPL oc_ep0
                  RTS                                           ; return 0x80 as "no mnemonic"
  oc_opcode:    0xff
  oc_mptr:      0xffff

; print out the line number of current 'ep' position
linenr:         LDI 1 STA ln_num+0 CLB ln_num+1             ; set line number to 1
                LDI <source STA ln_ptr+0                    ; point to start of source
                LDI >source STA ln_ptr+1
  ln_loop:      LDA ln_ptr+0 CPA ep+0 BNE ln_noteq
                  LDA ln_ptr+1 CPA ep+1 BNE ln_noteq
                    LIF '0' 0                               ; ep is reached => print dec line number
      p100loop:     LDI 100 SBW ln_num BCC p99end100
                      INF 0 JPA p100loop
      p99end100:    LDI 100 ADW ln_num                      ; correct it
                    LDF 0 OUT JPS _Wait                     ; print 100er
                    LIF '0' 0
      p10loop:      LDI 10 SBB ln_num+0 BCC p99end10
                      INF 0 JPA p10loop                     ; correct it
      p99end10:     LDF 0 OUT JPS _Wait                     ; print 10er
                    LDA ln_num+0 ADI 58                     ; '0' + 10 correction
                    OUT JPS _Wait
                    RTS
    ln_noteq:   LDR ln_ptr CPI 10 BNE ln_noenter            ; count LFs
                  INW ln_num                                ; count up for ENTER
    ln_noenter: INW ln_ptr JPA ln_loop

  ln_ptr:       0xffff                                      ; local source pointer
  ln_num:       0xffff

; assumes a label to start at ep and determines the length of that label
; returns: X = label byte length -> find_first_of(" +-\n\r\t,;:\0", x), A = char beyond label
findreflength:  LDA ep+0 STA frl_test+3 LDA ep+1 STA frl_test+4
                LIF 0 0
    frl_test:   LDF 0 LTA 0xffff
                CPI 32 BLE frl_exit
                  CPI '+' BEQ frl_exit
                    CPI '-' BEQ frl_exit
                      CPI ',' BEQ frl_exit
                        CPI 59 BEQ frl_exit                 ; ';'
                          CPI ':' BEQ frl_exit
                          INF 0 JPA frl_test
    frl_exit:   RTS

; find the next element starting from ep pointing to whitespace (typically end of previous element)
; returns: A = char at element position (0 for EOF element)
findelem:       LDR ep
                CPI 0 BEQ fe_return
                CPI 33 BCC fe_moveover
                CPI ',' BEQ fe_moveover
                CPI 59 BEQ fe_comment                       ; ';'
                  RTS                                       ; next element found!
  fe_moveover:  INW ep JPA findelem
  fe_comment:   INW ep LDR ep                               ; consume element & analyze next
                CPI 10 BEQ fe_moveover
                CPI 0 BNE fe_comment                        ; comment continues...
  fe_return:      RTS                                       ; next element found

; calculate the byte length of the element
; only to be called at the start of a valid element != EOF
; returns: elen and A = element byte length
elength:        LDA ep+0 STA elen+0 LDA ep+1 STA elen+1     ; copy ep -> elen
                LDR elen CPI 39 BNE elen_usual              ; is it a ' string marker?
  elen_string:    INW elen LDR elen                         ; consume old char and analyze new one
                  CPI 39 BEQ elen_strout                    ; consume ' as end marker
                  CPI 32 BCS elen_string                    ; normal printable character
                    LDA ep+1 SBB elen+1 LDA ep+0 SBW elen
                    JPA Error                               ; no closing mark found!
  elen_strout:  INW elen                                    ; return n + 1 - ep;
  elen_out:     LDA ep+1 SBB elen+1 LDA ep+0 SBW elen       ; return elen = n - ep;
                LDA elen+0 RTS
  elen_usual:   LDR elen
                CPI 33 BCC elen_out                         ; case usual element
                CPI ',' BEQ elen_out
                CPI 59 BEQ elen_out                         ; ';'
                  INW elen JPA elen_usual

; searches label database for a match with label of length X starting at 'ep'
; X is NOT chaned!
; returns: not found: A = 0 and lptr points at ent of table.
;          found      A = 1 and lptr points at LSB of label PC.
findlabel:      LDF 0 STA fl_len                            ; computer max index from length
                LDI <labels STA lptr+0 LDI >labels STA lptr+1
                LDA ep+0 STA fl_nextc+3 LDA ep+1 STA fl_nextc+4
  fl_nextl:     LIF 0 0                                     ; goto start of label at ep
  fl_nextc:     LDF 0 LTA 0xffff CPR lptr BNE fl_noteq
                  DEW lptr INF 0 CPA fl_len BCC fl_nextc
                    LDR lptr CPI ':' BEQ fl_found           ; does the stored label end, too?
  fl_searchend:   DEW lptr                                  ; didn't end => move over nonzero char and search end
  fl_noteq:       LDR lptr
                  CPI 0 BEQ fl_end                          ; is there even a label?
                  CPI ':' BEQ fl_labelend                   ; find end of label that isn't matching
                    JPA fl_searchend
    fl_labelend:  LDI 3 SBW lptr                            ; advance to next label pos
                  LDR lptr CPI 0 BNE fl_nextl               ; is there another table entry we can check?
  fl_end:           LDA fl_len STF 0 LDI 0 RTS              ; NOT FOUND => lptr points to table's EOF
  fl_found:       DEW lptr LDA fl_len STF 0 LDI 1 RTS       ; lptr points to PC_LSB
  fl_len:       0xff                                        ; length of label at 'ep'

; stores label definition of length 'elen' (includes :) and it's PC at the
; current lptr position in database in reversed order: 0, MSB, LSB, ':', 'lebal'
; first call findlabel to check whether the label existis and to find free slot.
putlabel:       LDA ep+0 STA pl_loop+3 LDA ep+1 STA pl_loop+4
                LIF 0 0
  pl_loop:      LDF 0 LTA 0xffff STR lptr
                DEW lptr                                    ; store label including :
                INF 0 CPA elen BCC pl_loop
                LDA pc+0 STR lptr DEW lptr
                LDA pc+1 STR lptr DEW lptr
                LDI 0 STR lptr
                RTS

mnemonics:      'NOP', 'BNK', 'WIN', 'INP', 'OUT', 'NOT', 'NEG', 'INC', 'DEC',
                'LSL', 'L2L', 'L3L', 'L4L', 'L5L', 'L6L', 'L7L', 'LSR',
                'ROL', 'R2L', 'R3L', 'R4L', 'R5L', 'R6L', 'R7L', 'ROR',
                'AN1', 'OR1', 'XR1', 'NBL', 'NBH',
                'LDI', 'ADI', 'SBI', 'CPI', 'ACI', 'SCI',
                'JPA', 'LDA', 'LTA', 'STA', 'ADA', 'SBA', 'CPA', 'ACA', 'SCA',
                'JPR', 'LDR', 'STR', 'ADR', 'SBR', 'CPR', 'ACR', 'SCR',
                'CLB', 'NOB', 'NEB', 'INB', 'DEB', 'ADB', 'SBB', 'ACB', 'SCB', 'LLB', 'LRB', 'RLB', 'RRB',
                'CLW', 'NOW', 'NEW', 'INW', 'DEW', 'ADW', 'SBW', 'ACW', 'SCW', 'LLW', 'RLW',
                'JPS', 'RTS', 'PHS', 'PLS', 'LDS', 'STS',
                'BNE', 'BEQ', 'BCC', 'BCS', 'BPL', 'BMI', 'BGT', 'BLE',
                'FPA', 'FNE', 'FEQ', 'FCC', 'FCS', 'FPL', 'FMI', 'FGT', 'FLE',
                'LDF', 'STF', 'ADF', 'SBF', 'CPF', 'LIF', 'AIF', 'SIF', 'CIF',
                'INF', 'DEF', 'LLF', 'RLF', 'AFF', 'SFF', 'CFF', 'TFF',
                'CL2', 'IN2', 'DE2', 'LL2', 'RL2', 'TF2', 'CL4', 'AF4', 'SF4', 'LL4', 'HLT'

#mute                         ; variables used by the assembler

isemit:         0xff          ; toggle switch for code emission
isfastjump:     0xff          ; toggle switch for fastjump support (Minimal Ultra)
pc:             0xffff        ; program counter (used in pass 1 and 2)
mc:             0xffff        ; emission counter (used in pass 2)
ep:             0xffff        ; element pointer (used in pass 1 and 2)
elen:           0xffff        ; length of an element (LSB only, MSB used for calculation)
enext:          0xffff        ; = ep + elen
term:           0xffff        ; holds term value
sign:           0xff          ; holds term info
expr:           0xffff        ; holds expression = expression + sign * term + ...
lsbmsb:         0xff          ; info about bytesize of expression: '<', '>', 0: 1 byte, 'w': 2 bytes
ptr:            0xffff        ; multi-purpose pointer
lptr:           0xffff        ; pointer to free label table. Format: 'label', ' ', 2-byte address in reverse order

#org 0x9000     source:       ; default beginning of the src code
#org 0xd000     default:      ; default beginning of the program
#org 0xcfff     labels:       ; beginning of the temp buffer area, growing downwards!!!

#mute                         ; MinOS API definitions generated by 'asm os.asm -s_'

#org 0xf003 _Prompt:
#org 0xf00f _SkipSpace:
#org 0xf012 _ReadHex:
#org 0xf015 _Print:
#org 0xf018 _PrintHex:
#org 0xf01b _Wait:
#org 0xf02a _LoadFile:
#org 0xfe70 _ReadPtr:
#org 0xfe72 _ReadNum:



