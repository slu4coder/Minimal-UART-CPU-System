; ------------------------------------------------------------------------
; Displays the 'Mandelbrot' set by projecting the area (-2.5..1) * (-1..1)
; onto 32 x 22 pixels using a maximum of 15 iterations and 16/32-bit math
; operations with fixed-point int values written by C. Herting (slu4) 2023
; ------------------------------------------------------------------------
#org 0xd000   JPS _Clear
              LIF 1 <anz

loop:         DEF <anz BCC _Prompt
              LIF 0 <ypos
              LIF 0xfe <cb+1 LIF 0x06 <cb+0         ; set cb
nextline:     LIF 0 <xpos
              LIF 0xfa <ca+1 LIF 0xf8 <ca+0         ; set ca
nextpixel:    TF2 <ca <za TF2 <cb <zb               ; init with za=ca and zb=cb
              LIF 14 <iter                          ; set max iteration steps to (n+1)
iterate:      TF2 <za <inta TF2 <za <intb           ; calculate za^2
              JPS Multiply
              LDF <intc+3 LSR                       ; store (result>>9) in zaq
              LDF <intc+2 ROR STF <zaq+1
              LDF <intc+1 ROR STF <zaq+0
              TF2 <zb <inta TF2 <zb <intb           ; calculate zb^2
              JPS Multiply
              LDF <intc+3 LSR                       ; store (result>>9) in zbq
              LDF <intc+2 ROR STF <zbq+1
              LDF <intc+1 ROR STF <zbq+0
              LDF <zaq+0 ADF <zbq+0                 ; calculate za^2 + zb^2
              LDF <zaq+1 ACA zbq+1
              CPI 0x08 FCS plotpixel                ; quit iteration if result >= 4
                TF2 <za <inta TF2 <zb <intb         ; zb = (za * zb)>>8 + cb (eff x2)
                JPS Multiply                        ; intc_32 = inta_16 * intb_16
                TFF <intc+1 <zb+0
                LDF <intc+2 ADF <cb+1 STF <zb+1
                LDF <cb+0 ADW zb
                TF2 <zaq <za                        ; za = za^2 - zb^2 + ca
                LDF <zbq+1 SBB za+1 LDF <zbq+0 SBW za
                LDF <ca+0 ADW za LDF <ca+1 ADB za+1
                DEF <iter FCS iterate               ; 15 iterations from 14..0

plotpixel:    AIF 33 <iter OUT                      ; plot current pixel in ASCII style
              LDI 56 ADW ca
              INF <xpos CPI 32 FCC nextpixel        ; advance to next position
                NOP NOP NOP NOP NOP                 ; UART wait
                NOP NOP NOP NOP NOP
                LDI 10 OUT                          ; output ENTER
                LDI 46 ADW cb
                INF <ypos CPI 22 FCC nextline       ; advance to next line
                  JPS _Wait JPA loop

; ----------------------------------------------------------------------------------
; Fastest shortest signed multiplication 32-bit intc = (16-bit inta) * (16-bit intb)
; ----------------------------------------------------------------------------------
              #org 0xd0f0
Multiply:     LIF 0 <sign
              CIF 0 <inta+1 FPL aposi AIF 0x80 <sign NEW inta  ; make A positive
  aposi:      CIF 0 <intb+1 FPL bposi AIF 0x80 <sign NEW intb  ; make B positive
  bposi:      CL4 <intc
              LL2 <inta FMI high14
                LL2 <inta FMI high13
                  LL2 <inta FMI high12
                    LL2 <inta FMI high11
                      LL2 <inta FMI high10
                        LL2 <inta FMI high09
                          LL2 <inta FMI high08
                            LL2 <inta FMI high07
                              LLF <inta+1 FMI high06
                                LLF <inta+1 FMI high05
                                  LLF <inta+1 FMI high04
                                    LLF <inta+1 FMI high03
                                      LLF <inta+1 FMI high02
                                        LLF <inta+1 FMI high01
                                          LLF <inta+1 FMI high00
                                            RTS
      high14:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test13:   LL4 <intc LL2 <inta FPL test12
      high13:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test12:   LL4 <intc LL2 <inta FPL test11
      high12:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test11:   LL4 <intc LL2 <inta FPL test10
      high11:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test10:   LL4 <intc LL2 <inta FPL test09
      high10:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test09:   LL4 <intc LL2 <inta FPL test08
      high09:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test08:   LL4 <intc LL2 <inta FPL test07
      high08:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test07:   LL4 <intc LL2 <inta FPL test06
      high07:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test06:   LL4 <intc LLF <inta+1 FPL test05
      high06:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test05:   LL4 <intc LLF <inta+1 FPL test04
      high05:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test04:   LL4 <intc LLF <inta+1 FPL test03
      high04:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test03:   LL4 <intc LLF <inta+1 FPL test02
      high03:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test02:   LL4 <intc LLF <inta+1 FPL test01
      high02:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test01:   LL4 <intc LLF <inta+1 FPL test00
      high01:   AF4 <intb <intc AF4 <intb+1 <intc+1
    test00:   LL4 <intc LLF <inta+1 FPL testdone
      high00:   AF4 <intb <intc AF4 <intb+1 <intc+1
    testdone: LLF <sign FCS negate RTS              ; check <sign upper bit
      negate:   NOW intc NOW intc+2                 ; result is negative => negate full 32-bit output
                AF4 <one <intc
                RTS

#mute
#org 0xff02                                         ; place all variables in fast page

inta:         0x0000                                ; math registers
intb:         0x0000
intc:         0x0000, 0x0000, 0
sign:         0
cnt:          0
one:          1

xpos:         0
ypos:         0
iter:         0
ca:           0, 0                                  ; fixed-point Mandelbrot variables
cb:           0, 0
za:           0, 0
zb:           0, 0
zaq:          0, 0
zbq:          0, 0

anz:          0

#org 0xf003 _Prompt:                                ; API routines
#org 0xf01b _Wait:
#org 0xf030 _Clear:
