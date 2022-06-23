# Minimal UART CPU System - Breadboard REDUX Revision 1.6 Out Now!

NEW: Build your own 'Minimal CPU System' on breadboards: https://www.youtube.com/watch?v=Gz1VVOsNn_8

NEW: Python-like high-level programming language MIN released: https://www.youtube.com/watch?v=H342TwW4R7k

NEW: 'Minimal VGA Extension Card' released! https://github.com/slu4coder/DIY-VideoRAM/tree/main/KiCAD

NEW: 'Minimal CPU System' Emulator released! See user manual chapter 'Minimal Emulator' for details.

● Native assembler and text editor released!

● User Manual and Reference: https://docs.google.com/document/d/1c2ZHtLd1BBAwcBAjBZZJmCA3AXpbpv80dlAtsMYpuF4/edit?usp=sharing

● Revision 1.5 is out now featuring 512KB FLASH SSD, 3.6864MHz clock speed and an expansion port!
https://www.youtube.com/watch?v=osVi06VKvA0

● Minimal Python Assembler released: https://www.youtube.com/watch?v=rdKX9hzA2lU

● The Minimal CPU System now has a dedicated hardware serial 'Minimal Terminal': https://github.com/slu4coder/Minimal-Terminal
but can also be operated via a USB-to-serial breakout board and a terminal emulation (e. g. Tera Term) of cause.

I've built my own Computer from scratch - using nothing but TTL chips, because, well, why not? I wanted a CPU that is easy to understand, fun to build and powerful enough to allow for programming educational stuff and little games on it. Ah, and by the way - it should be as simple as possible - sort of the "Simplest Usable Personal Computer". This repo provides you with everything you need to follow my one-and-a-half-year journey down this rabbit hole. Besides running some video game classics, this little DIY CPU is capable of parsing arbitrary mathmatical expressions and performing floating point calculations in single (32-bit) precision. And it comes with an SSD file system, too, since it uses it's own FLASH IC as permanent SSD storage.

WHAT YOU GET:

  ● Block diagram of the CPU and overview it's instruction set
  
  ● KiCAD project files with detailed schematics and PCB layout
  
  ● Gerber files ready to be submitted at any PCB manufacturer of your choice
  
  ● Bill of material
  
  ● Images in .bin format of both the ROM and the CPU's control microcode
  
  ● Source code of the minimal operating system MinOS and several demos and games
  
  ● Cross-assembler 'asm.exe' running on Windows (or Python) to comfortably write, assemble and upload your own software
  

TECHNICAL SPECIFICATION:
  
  ● Processing power (approx. 0.5Mips @ 3,6864MHz) comparable to C64 or Apple II
  
  ● Clear(est?) and simple(st? – you judge!) design for fun and education
  
  ● 8-bit data bus, 16-bit address bus, Von-Neumann architecture
  
  ● 64 instructions (conditional branching, subroutines, stack and word ops)
  
  ● 32KB RAM / 512KB FLASH ROM (OS, memory monitor, disassembler, tools)
  
  ● SSD file system (commands LOAD, SAVE, DIR, DELETE, FORMAT as you'd expect)
  
  ● UART interface (up to 230.4kbps) for terminal display, keyboard input and file I/O
  
  ● 16 control signals, 2 registers A and B, ALU (arithmetic and logic unit) = simple adder, 3 flags (negative, carry and zero)
  
  ● Built from 74HCxx TTL logic on 120mm x 190mm PCB
  

I hope you find this information useful, educational or otherwise interesting. I'd love to hear about your build, so meet me on YouTube.

https://www.youtube.com/channel/UCXYQcMpUBT3aaQKfmAVJNow

Have fun!
slu4
