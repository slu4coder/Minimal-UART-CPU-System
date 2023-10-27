#org 0xd000

start:    LDI 0x1e
next:     OUT NOP NOP NOP NOP NOP
          NOP NOP NOP NOP NOP NOP
          INC BPL next
            JPA start
