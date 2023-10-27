#org 0x8000
; *****************************************
; *****                               *****
; *****    Minimal BLOCKS by slu4     *****
; *****                               *****
; *****    last update 10.09.2023     *****
; *****                               *****
; *****************************************
              LDI 0xfe STA 0xffff                      ; init stack
game_restart: CLB state                                ; 0: state_intro, 1: state_run, 2:state_over
              JPS PrintIntro                           ; print the intro screen

game_loop:    LDA state
              DEC BCC state_intro                      ; switching states
                DEC BCC state_run
                  JPA state_over

state_intro:  INB _RandomState+0                       ; randomize pseudo-random generator
              INP CPI ' ' BNE game_loop                ; immediate loop-back
                LDI <vram STA ptr+0                    ; SETUP THE GAME 
                LDI >vram STA ptr+1                    ; clear playfield
  cfloop:       LDI '.' STR ptr
                INW ptr
                LDA ptr+0
                CPI 200
                BCC cfloop
                  CLW score            ; reset all game variables
                  CLW gameframes
                  LDI 80 STA waiting   ; fall timer init
                  CLW counter          ; init slow-down counter
                  CLB dropsteps
                  JPS PrintFrame       ; print empty field
                  JPS NewShape         ; pick new shape to start with (no test required)
                  LDI '#' STA shapechar JPS PrintShape       ; draw tetromino
                  LDI <scoretext PHS
                  LDI >scoretext PHS
                  JPS _Print PLS PLS
                  LDI <hightext PHS
                  LDI >hightext PHS
                  JPS _Print PLS PLS
                  LDA highscore+0 PHS LDA highscore+1 PHS
                  JPS U16_Print PLS PLS
                  LDI <controltext PHS
                  LDI >controltext PHS
                  JPS _Print PLS PLS
                  INB state            ; STATE = RUNNING!!!
                  JPA game_loop

state_run:    INP CPI 0xff BEQ run_nokey     ; non-blocking key input
                CPI 'a' BEQ a_key
                CPI 'd' BEQ d_key
                CPI 'w' BEQ w_key
                CPI 's' BEQ s_key
                JPA run_nokey

      a_key:      LDI '.' STA shapechar JPS PrintShape
                  LDA xpos DEC PHS LDA ypos PHS JPS TestShape PLS
                  PLS SBB xpos
                  JPA r_drshape
      d_key:      INB _RandomState+1
                  LDI '.' STA shapechar JPS PrintShape
                  LDA xpos INC PHS LDA ypos PHS JPS TestShape PLS
                  PLS ADB xpos
                  JPA r_drshape
      w_key:      INB _RandomState+2
                  LDI '.' STA shapechar JPS PrintShape  ; delete old shape
                  JPS RotateShape                       ; make rotate shape
                  LDA xpos PHS LDA ypos PHS JPS TestShape PLS PLS DEC BCS r_drshape                  ; test position
                  LDA xpos INC STA xpos PHS LDA ypos PHS JPS TestShape PLS PLS DEC BCS r_drshape     ; and possible wall kicks
                  LDA xpos SBI 2 STA xpos PHS LDA ypos PHS JPS TestShape PLS PLS DEC BCS r_drshape
                  LDA xpos ADI 3 STA xpos PHS LDA ypos PHS JPS TestShape PLS PLS DEC BCS r_drshape
                  LDA xpos SBI 4 STA xpos PHS LDA ypos PHS JPS TestShape PLS PLS DEC BCS r_drshape
                    INB xpos           ; back to beginning
                    INB xpos
                    JPS RotateShape    ; rotation wasn't free -> rotate back
                    JPS RotateShape
                    JPS RotateShape
                    JPA r_drshape
      s_key:      INB _RandomState+3
                  INB dropsteps
                  LDI -1 STA waiting
                  JPA game_loop

  run_nokey:  DEW counter BCS game_loop
                LDI 0x01 STA counter+1 LDI 0x80 STA counter+0   ; restart counter
                INW gameframes           ; count a frame
                DEB waiting              ; tetromino falling? Watch out: waiting may already be < 0 due to 's' key
                BPL game_loop

                  LDA gameframes+1       ; set fall timer 'waiting'
                  LSR                    ; 'logical shift right' for a divide by two
                  NEG ADI 80 STA waiting
                  
                  LDA xpos PHS LDA ypos INC PHS
                  JPS TestShape PLS
                  PLS DEC BCC run_place                   ; no space? place it here
                    LDI '.' STA shapechar JPS PrintShape  ; free space? let it fall
                    INB ypos

  r_drshape:  LDI '#' STA shapechar JPS PrintShape
              JPA game_loop

  run_place:  LDI <shape STA ptr+0
              LDI >shape STA ptr+1
              LDI >vram STA ptr2+1
              LDI 4 STA vari
  rploop:     LDA xpos                ; DRAW SHAPE TO VRAM
              ADR ptr                 ; add shape xoffset
              STA ptr2+0              ; write x info
              INW ptr                 ; goto shape yoffset
              LDA ypos
              ADR ptr                 ; add shape yoffset
              LSL PHS ADW ptr2        ; add y x 2 zum vram-pointer
              PLS L2L ADW ptr2
              LDI '#' STR ptr2        ; write to VRAM
              INW ptr
              DEB vari
              BNE rploop
                CLB anzrows
                LDI 10 STA ptr2+0     ; start of VRAM = Anfang Reihe 1
                LDI >vram STA ptr+1
                STA ptr1+1
                LDI 19 STA vary       ; test 19 rows
  rpyloop:    LDI 1 STA rowfull       ; assume row is full
              LDI 10 STA varx
  rpxloop:    LDI '.' CPR ptr2
              BNE rpiswall
                CLB rowfull           ; mark row as not empty
  rpiswall:   INB ptr2
              DEB varx
              BNE rpxloop
                LDA rowfull DEC
                BCC rpcopydone
                  INB anzrows         ; row is full
                  LDA ptr2+0 DEC STA ptr+0
                  SBI 10 STA ptr1+0
  rpcopyloop:     LDR ptr1 STR ptr
                  DEB ptr DEB ptr1
                  BCS rpcopyloop
  rpleerloop:       INB ptr1
                    CPI 10
                    BCC rpcopydone
                    LDI '.' STR ptr1
                    JPA rpleerloop
  rpcopydone:   DEB vary
                BNE rpyloop
                  LDI >wintable STA ptr+1 LDI <wintable STA ptr+0
                  LDA anzrows ADW ptr
                  LDR ptr ADW score LDR ptr ADW score  ; add score for cleared rows
                  LDA dropsteps ADW score              ; add the drop points
                  LDI <pretext PHS LDI >pretext PHS
                  JPS _Print PLS PLS
                  LDA score+0 PHS LDA score+1 PHS
                  JPS U16_Print PLS PLS ; print score
                  LDA score+1           ; check if there is a new highscore
                  CPA highscore+1
                  BCC rpnewshape
                  BNE rpnewhigh
                    LDA score+0
                    CPA highscore+0
                    BCC rpnewshape
  rpnewhigh:          LDA score+0 STA highscore+0   ; score = highscore
                      LDA score+1 STA highscore+1

  rpnewshape:   CLB dropsteps
                JPS NewShape            ; pick a new shape
                JPS PrintField          ; draw field
                JPS PrintShape          ; Tetromino malen
                LDA xpos PHS LDA ypos PHS JPS TestShape PLS
                PLS DEC BCS game_loop
                  INB state             ; INVALID POSITION => GAME OVER
                  JPS PrintOver
                  JPA game_loop

state_over:   INP CPI 32 BNE game_loop
                JPA game_restart

NewShape:     LDI <shape STA ptr2+0    ; copy a random piece into shape
              LDI >shape STA ptr2+1
              LDI <minos STA ptr+0
              LDI >minos STA ptr+1

  rndagain:   JPS _Random LSL R3L L6L R3L ; divide by 32
              CPI 7 BCS rndagain
              STA vari L3L ADA vari   ; x 9
              ADW ptr
              LDI 8 STA vari
  nscopyloop: LDR ptr STR ptr2
              INW ptr INW ptr2
              DEB vari
              BNE nscopyloop
                LDI 4 STA xpos
                LDI 1 STA ypos
                CLB yoff
                LDR ptr STA xoff
                RTS

TestShape:    LDI <shape STA ptr+0     ; test if pos is free
              LDI >shape STA ptr+1
              LDI >vram STA ptr2+1
              LDI 4 STA vari
  tsloop:     LDS 4                   ; lade test-xpos
              ADR ptr                 ; addiere shape-xoffset hinzu
              BMI tsoutside           ; prüfe linke Grenze
                CPI 10 BCS tsoutside  ; prüfe rechte Grenze
              STA ptr2+0              ; beschreibe vram-pointer mit x-info
              INW ptr                 ; gehe zum shape-yoffset
              LDS 3                   ; lade test-ypos
              ADR ptr                 ; addiere shape-yoffset hinzu
              BMI tsoutside           ; prüfe linke Grenze
                CPI 20 BCS tsoutside  ; prüfe untere Grenze
              LSL PHS ADW ptr2        ; addiere y x 2 zum vram-pointer
              PLS L2L ADW ptr2    ; addiere y x 8 zum vram-pointer
              LDR ptr2                ; lies VRAM an dieser Stelle
              CPI '#'
              BEQ tsoutside
                INW ptr
                DEB vari
                BNE tsloop
                  LDI 1 STS 4 ; return 'space is valid'
                  RTS
  tsoutside:  LDI 0 STS 4     ; return 'space is invalid'
              RTS

RotateShape:  LDA xoff ADB xpos
              LDA yoff ADB ypos
              LDI 5 STA vari
              LDI >shape STA ptr+1
              LDI <shape STA ptr+0
  rsloop:     LDR ptr PHS INW ptr
              LDR ptr PHS DEW ptr
              PLS STR ptr INW ptr
              PLS NEG STR ptr INW ptr
              DEB vari
              BNE rsloop
                RTS

PrintShape:   LDI >shape STA ptr+1
              LDI <shape STA ptr+0
              LDI 4 STA vari
  psloop:     LDA xpos ADI 14 ADR ptr
              PHS JPS _CursorX PLS
              INW ptr
              LDA ypos ADR ptr
              PHS JPS _CursorY PLS
              LDA shapechar OUT JPS _Wait
              INW ptr         ; next square
              DEB vari
              BNE psloop
                RTS

PrintField:   LDI 27 OUT JPS _Wait
              LDI '[' OUT JPS _Wait
              LDI 'H' OUT JPS _Wait
              LDI >vram STA ptr+1
              CLB ptr+0
              LDI 20 STA vary
  pflinstart: LDI 14 PHS JPS _CursorX PLS
              LDI 10 STA varx
  pfxloop:    LDR ptr
              OUT JPS _Wait
              INB ptr+0
              DEB varx
              BNE pfxloop
                LDI 10 OUT JPS _Wait
                DEB vary
                BNE pflinstart
                  RTS

PrintFrame:   LDI <clrtext PHS LDI >clrtext PHS
              JPS _Print PLS PLS
              LDI 20 STA vary
  pfrloop:    LDI <textframe1 PHS
              LDI >textframe1 PHS
              JPS _Print PLS PLS
              DEB vary
              BNE pfrloop
                LDI <textframe2 PHS
                LDI >textframe2 PHS
                JPS _Print PLS PLS
                LDI <textframe3 PHS
                LDI >textframe3 PHS
                JPS _Print PLS PLS
                RTS

PrintIntro:   LDI <tetristext PHS
              LDI >tetristext PHS
              JPS _Print PLS PLS
              JPA PrintSpace

PrintOver:    LDI <overtext PHS
              LDI >overtext PHS
              JPS _Print PLS PLS

PrintSpace:   LDI <spacetext PHS
              LDI >spacetext PHS
              JPS _Print PLS PLS
              RTS

; print out an unsigned 16-bit decimal number in the format 00000
; push: number_lsb, number_msb
; pull: #, #
U16_Print:      LDS 3 STA U16_C+1  ; PRINT A POSITIVE NUMBER
                LDS 4 STA U16_C+0
                LDI 0 PHS STA U16_digits
  U16_start:    CLB U16_C+2
                LDI 16 STA U16_count
  U16_shift:    LDA U16_C+2 ROL
                LDA U16_C+0 ROL STA U16_C+0
                LDA U16_C+1 ROL STA U16_C+1
                LDA U16_C+2 ROL STA U16_C+2
                CPI 10 BCC U16_done
                  ADI 118 STA U16_C+2
  U16_done:     DEB U16_count BNE U16_shift
                  LDA U16_C+2 CPI 0 BPL bit7iszero ; clear highest byte
                    SBI 0x80
    bit7iszero:   ADI '0' PHS INB U16_digits
                  LDA U16_C+2 ROL
                  LDA U16_C+0 ROL STA U16_C+0
                  LDA U16_C+1 ROL STA U16_C+1
                  LDA U16_C+2 ROL STA U16_C+2
                  LDI 0
                  CPA U16_C+0 BNE U16_start
                    CPA U16_C+1 BNE U16_start
  U16_before:         INB U16_digits CPI 6 BEQ U16_stack
                        LDI '0' OUT JPS _Wait JPA U16_before
  U16_stack:          PLS CPI 0 BEQ U16_exit
                        OUT JPS _Wait
                        JPA U16_stack
  U16_exit:            RTS

textframe1:   27, '[12C<!..........!>', 10, 0
textframe2:   27, '[12C<!==========!>', 10, 0
textframe3:   27,   '[14CVVVVVVVVVV', 10, 0

tetristext:   27, '[?25l', 27, '[H', 27, '[J', 27           ; hide cursor, clear screen
              '[10B  M I N I M A L   6 4   B L O C K S', 10, 0
overtext:     27, '[H', 27, '[10B', 27, '[14CGAME  OVER', 10, 0
spacetext:    27, '[12B', 27, '[13C', 'Press  SPACE', 10, 0
scoretext:    27, '[HSCORE 00000', 0
hightext:     27, '[16CHIGH ', 0
pretext:      27, '[H', 27, '[6C', 0
clrtext:      27, '[H', 27, '[J', 0
controltext:  10, 10, 10                     ; output text for keyboard controls
              'CONTROLS', 10, 10
              'A - Left', 10
              'D - Right', 10
              'W - Rotate', 10
              'S - Drop', 0

              ;  initial tetrominos with initial x-offset for SRS
minos:        0,  0,  1,  0,  0, -1, 1, -1,   1  ; square
              -1, -1, 0,  -1, 0, 0,  1, 0,    0  ; Z
              -1, 0,  0,  0,  0, -1, 1, -1,   0  ; neg. Z
              -1, 0,  0,  0,  1, 0,  2, 0,    1  ; slab
              -1, 0,  0,  0,  1, 0,  0, -1,   0  ; pyramid
              -1, -1, -1, 0,  0, 0,  1, 0,    0  ; L
              -1, 0,  0,  0,  1, 0,  1, -1,   0  ; neg. L

wintable:     0, 20, 50, 100, 250     ; points depending on cleared rows (x2)

highscore:    0x1bca                  ; holding the current highscore 10.5.2021

#mute

#org 0x8700   vram:                   ; 20*10 bytes VideoRAM
#org 0x87c8                           ; variables

U16_C:        0xffff, 0xff            ; for U16_Print
U16_count:    0xff
U16_digits:   0xff

shapechar:    0                       ; current look of a piece, either '#' or '.'
shape:        0, 0, 0, 0, 0, 0, 0, 0  ; current shape (and it's rotation state)
xoff:         0                       ; SRS rotation compensation
yoff:         0

state:        0xff          ; 0: intro, 1: running, 2: over
score:        0xffff        ; holding the current score
waiting:      0xff          ; timer
counter:      0x0000        ; 1/60s wait counter
gameframes:   0xffff        ; counting the game frames
xpos:         0xff          ; current position of tetromino
ypos:         0xff
ptr:          0xffff        ; multi-purpose pointers
ptr1:         0xffff
ptr2:         0xffff
vari:         0xff          ; multi-purpose
varx:         0xff
vary:         0xff
dropsteps:    0xff          ; counting hard drops
anzrows:      0xff          ; count cleared lines
rowfull:      0xff          ; boolean line completed

#mute                       ; MinOS label definitions generated by 'asm os.asm -s_'

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

