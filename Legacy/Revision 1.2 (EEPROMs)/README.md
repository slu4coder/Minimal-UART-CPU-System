# Minimal UART Computer Revision 1.2 with EEPROMs

Current version: https://github.com/slu4coder/Minimal-UART-CPU-System

Hi there, I built my own Computer from scratch - using nothing but TTL chips, because, well, that's what I wanted to do, I guess! I wanted
a CPU that is easy to understand, fun to build and powerful enough to allow for programming educational stuff and little games on it.
Ah, and by the way - it should be as simple as possible - sort of the "Simplest Usable Personal Computer Ever". Well, in case you're
interested, this repo aims to provide you with everything you need to follow my one-and-a-half year journey down this rabbit hole. 


WHAT YOU GET HERE:

  ● Block diagram of the CPU and overview it's instruction set

  ● KiCAD project files with detailed schematics and PCB layout

  ● Gerber files ready to be submitted at any PCB manufacturer of your choice

  ● Bill of material

  ● Images in .bin format of both the ROM and the CPU's control microcode

  ● Source code of the minimal operating system MinOS and several demos and games

  ● Cross-assembler 'asm.exe' running on Windows in order to comfortably write, assemble and upload your own software


TECHNICAL SPECIFICATION:

  ● Comparable to Altair 8800 or Apple 1

  ● Clear(est?) and simple(st? – you judge!) design for fun and education

  ● 8-bit data bus, 16-bit address bus, Von-Neumann architecture

  ● 64 instructions (conditional branching, subroutines, stack and word ops)

  ● 1,8432MHz clock with 0.25Mips (Altair 8800: 0.29Mips, Apple 1: 0.43Mips)

  ● 24kB RAM / 8kB ROM (OS, memory monitor, disassembler, tools, games)

  ● UART interface (115.2kbps) for terminal display, keyboard input and file I/O

  ● 16 control signals, 2 registers A and B, ALU (arithmetic and logic unit) = simple adder, 3 flags (negative, carry and zero)

  ● Built from 74HCxx TTL logic on 120mm x 190mm PCB


I hope you find this information useful, educational or otherwise interesting. I'd love to hear about you build, so meet me on YouTube.

https://www.youtube.com/channel/UCXYQcMpUBT3aaQKfmAVJNow

Cheers,
Slu4
