**************************************************
*****                                        *****
***** Slu4's Minimal 8-Bit Computer Emulator *****
*****                                        *****
**************************************************

1) Emulator Keyboard Shortcuts
------------------------------
ALT+TAB				Change focus to another application
END						Quits the emulator
F1						Toggles the emulator's HUD control screen
F2/F3					Changes the memory bank shown on HUD control screen
Pos1					Resets the program counter to 0x0000
ESC e					Clears the RAM of the 8-Bit CPU
ESC c					Clears the terminal screen
ESC p<adr>		Sets the program counter to <adr>. Example: ESCp0800 sets the PC to 0x0800
ESC r					Resets the 8-Bit CPU
ESC l<prog>		Assembles the text file <prog> and uploads the corresponding machine code to RAM
ESC 0					Halts the clock
ESC 1					Sets clock speed to 10Hz
ESC 2					Sets clock speed to 100Hz
ESC 3					Sets clock speed to 1kHz
ESC 4					Sets clock speed to 10kHz
ESC 5					Sets clock speed to 100kHZ
ESC 6					Sets clock speed to 1MHz
ESC s					Performs a single clock cycle
ESC h					Performs a half single clock cycle
ESC x					Executes instruction until next 'II' control signal (fetch) is hit
ESC i<raw>		Reads in the content of file <raw> as direct keyboard/Datasette input
ESC #<hex>		Writes the specified hex data into RAM starting at PC (ESC#cafe writes 0xca 0xfe)
Ctrl+V				Pastes clipboard as 'keyboard input' into the emulator. You can copy the output of the
							stand-alone assembler asm.exe and paste it like this.

2) Loading, assembling and running the example program 'chars.txt'
------------------------------------------------------------------
- Launch the emulator
- type ESC l chars.txt ENTER
- type ESC 2
- Press F1 to see the program in memory and the blinkenlights control signals.
  Change the clock speed to your liking.

3) Some Assembler syntax (also take a look at the example programs)
-------------------------------------------------------------------
*=$xxxx				sets the program counter address to hex address xxxx
label:				defines a label
JPA label			uses that label
$xxxx					16-bit hex word
$xx						8-bit hex byte
123						8-bit dec byte
'a'						equivalent to 65 or $41
"hello"				defines a byte string in memory
1, 2, 3				defines a byte string in memory
<label				least significant byte (LSB) of the 16-bit address 'label'
>label				most significant byte (MSB) of the 16-bit address 'label'
; comment			inserts a comment. The semicolon and everything onwards will be ignored
LDI 'A' OUT		multiple opcodes are allowed in one line

4) OpCodes
----------
See appendix 'Opcode_Table_Minimal_8-Bit_CPU.pdf'.

I hope this get you started. Let me know how things are going. Cheers!
