// Minimal UART Emulator by Carsten Herting (2020/2021) Version 1.02
// Compile with g++ main.cpp -Os -s
// Have fun!

#include <iostream>											// console output
#include <windows.h>										// simple windows timing
#include <conio.h>											// keyboard input, ancient and non-portable :-)
#include <memory>
#include <vector>
#include <fstream>

#define BO   		0b0000000000000001			// definition of control lines within control word
#define BI  		0b0000000000000010
#define AO   		0b0000000000000100
#define AI   		0b0000000000001000
#define RO   		0b0000000000010000
#define RI   		0b0000000000100000
#define MI   		0b0000000001000000
#define HI   		0b0000000010000000
#define EOFI 		0b0000000100000000
#define ES   		0b0000001000000000
#define EC   		0b0000010000000000
#define IC   		0b0000100000000000
#define II   		0b0001000000000000
#define CEME 		0b0010000000000000
#define CO   		0b0100000000000000
#define CI   		0b1000000000000000
#define ACTLOW 	0b1101100101111111    	// 1: control signal is active low

class Component													// component interface class of the CPU
{
public:
	virtual void Reset() {}								// virtual defines that this Function will be overwritten in derived classes
	virtual void FallingEdge() {}
	virtual void BeingLow() {}	
	virtual void RisingEdge() {}	
	virtual void GettingHigh() {}
	virtual void BeingHigh() {}	
};

class Register : public Component				// modeled after 74LS161 / 74HC161 (4-Bit Counter) bzw. 74HC173 (4-Bit Register Latch)
{
public:	
	Register(uint8_t& port, uint16_t& ctrl, uint16_t inmask, uint16_t outmask, uint16_t countmask, uint16_t himask)
	: mPortLines(port), mCtrlLines(ctrl), mInMask(inmask), mOutMask(outmask), mCountMask(countmask), mHiMask(himask) {}
	void Reset() { mStore = 0; }
	void BeingLow()
	{
		if (mCtrlLines & mOutMask)
		{
			if (mCtrlLines & mHiMask) mPortLines = mStore>>8;
			else mPortLines = mStore & 0x00ff;
		}
	}
	void RisingEdge()
	{
		if (mCtrlLines & mInMask)
		{
			if (mCtrlLines & mHiMask) mStore = (mStore & 0x00ff) | mPortLines<<8;
			else mStore = (mStore & 0xff00) | mPortLines;
		}
		else if ((mCtrlLines & mCountMask) || mCountMask == 0xffff) mStore++;
	}
	uint16_t Get() { return mStore; }			// direct access (used by ALU and RAM)
private:
	uint16_t mStore;											// internal storage
	uint8_t& mPortLines;
	uint16_t& mCtrlLines;									// reference to the IO lines the component is connected to
	uint16_t mInMask, mOutMask, mCountMask, mHiMask;
};

class Adder : public Component
{
public:	
	Adder(uint8_t& port, uint16_t& ctrl, uint16_t outmask, uint16_t invmask, uint16_t cinmask, std::shared_ptr<Register> a, std::shared_ptr<Register> b, uint8_t& flags)
	: mPortLines(port), mCtrlLines(ctrl), mOutMask(outmask), mInvMask(invmask), mCinMask(cinmask), mRegA(a), mRegB(b), mFlagLines(flags) {}
	void BeingLow()
	{	
		int a, b;																													// A and B registers
		a = int(mRegA->Get()) & 0xff;
		if (mCtrlLines & mInvMask) b = int(~(mRegB->Get()) & 0xff);
		else b = int(mRegB->Get()) & 0xff;
		int result = a + b + bool(mCtrlLines & mCinMask);									// add operation with carry in
		if ((result & 0xff) == 0) mFlagLines |= 1; else mFlagLines &= ~1;	// zero flag
		if (result > 0xff) mFlagLines |= 2; else mFlagLines &= ~2;				// carry flag
		if (result & 0x80) mFlagLines |= 4; else mFlagLines &= ~4;				// negative flag
		if (mCtrlLines & mOutMask) mPortLines = uint8_t(result);					// output result if EO is active
	}
	void GettingHigh() { BeingLow(); }			// 74HC283 works asynchroneous, use "EO|AI, EO|RI" instead of "EO|AI|RI" (same for BI)
private:
	uint8_t& mPortLines;										// reference to the IO lines the component is connected to
	uint16_t& mCtrlLines;										// reference to the control word	
	uint16_t mOutMask, mInvMask, mCinMask;
	std::shared_ptr<Register> mRegA, mRegB;
	uint8_t& mFlagLines;										// connection to the flag lines (ALU outputs flags)
};

class Memory : public Component
{
public:	
	Memory(uint8_t& port, uint16_t& ctrl, uint16_t inmask, uint16_t outmask, std::shared_ptr<Register> mar, std::string& inbuf)
	: mPortLines(port), mCtrlLines(ctrl), mInMask(inmask), mOutMask(outmask), mMAR(mar), mInBuf(inbuf)
	{
		std::ifstream rom;
		rom.open("ROM.bin", std::ios::binary | std::ios::in);
		if (rom.is_open()) rom.read((char*)mStore, 0x2000);		
	}
	void BeingLow()
	{	
		if (mCtrlLines & mOutMask)
		{
			if (mMAR->Get() & 0x8000)									// Terminal -> Port
			{
				if (mInBuf.size() > 0) { mPortLines = mInBuf[0]; mInBuf = mInBuf.substr(1); }
				else mPortLines = 0;
			}
			else mPortLines = mStore[mMAR->Get()];		// RAM -> Port
		}
	}
	void BeingHigh()
	{
		if ((mCtrlLines & mInMask))
		{
			if((mMAR->Get() & 0x8000) == 0x8000 && mPortLines != 0) std::cout << mPortLines;	// 0x8000-0xffff: schreiben in UART
			else if (mMAR->Get() >= 0x2000) mStore[mMAR->Get()] = mPortLines;									// 0x2000-0x7fff: RAM, do not overwrite ROM 0x0000-0x1fff																																			// 0x0000-0x7fff: schreiben in RAM
		}		
	}
private:
	uint8_t& mPortLines;									// reference to the IO lines the component is connected to
	uint16_t& mCtrlLines;									// reference to the control word	
	uint16_t mInMask, mOutMask;
	std::shared_ptr<Register> mMAR;
	uint8_t mStore[32768];
	std::string& mInBuf;									// reference to the input buffer
};

class Control : public Component
{
public:	
	Control(uint8_t& port, uint16_t& ctrl, std::shared_ptr<Register> ireg, std::shared_ptr<Register> freg, std::shared_ptr<Register> sreg)
	: mPortLines(port), mCtrlLines(ctrl), mRegInstr(ireg), mRegFlags(freg), mRegSteps(sreg)
	{
		std::ifstream lsb("CTRL_LSB.bin", std::ios::binary | std::ios::in), msb("CTRL_MSB.bin", std::ios::binary | std::ios::in);
		if (lsb.is_open() && msb.is_open())
			for(int i=0; i<0x2000; i++) { lsb.read((char*)&mMicrocode[i]+0, 1); msb.read((char*)&mMicrocode[i]+1, 1); mMicrocode[i] ^= ACTLOW; }
	}
	void FallingEdge()						// set the control lines according to flags, instruction & step
	{
		mCtrlLines = mMicrocode[((mRegFlags->Get() & 0b111)<<10) | ((mRegInstr->Get() & 0b111111)<<4) | (mRegSteps->Get() & 0b1111)];
		if (mCtrlLines & IC)				// immediate asnychroneous reset
		{
			mRegSteps->Reset();
			mCtrlLines = mMicrocode[((mRegFlags->Get() & 0b111)<<10) | ((mRegInstr->Get() & 0b111111)<<4) | (mRegSteps->Get() & 0b1111)];
		}
		if (mCtrlLines & HI) mPortLines = 0x7f; else mPortLines = 0xff;				// also set the state of the port (pull-up to +5V)
	}	
private:
	uint8_t& mPortLines;									// reference to the IO lines the component is connected to
	uint16_t& mCtrlLines;									// reference to the control word	
	std::shared_ptr<Register> mRegInstr, mRegFlags, mRegSteps;
	uint16_t mMicrocode[8192];
};

class Computer
{
public:
	Computer()
	{
		std::shared_ptr<Register> areg = std::make_shared<Register>(mBusLines, mCtrlLines, AI, AO, 0, 0);
		std::shared_ptr<Register> breg = std::make_shared<Register>(mBusLines, mCtrlLines, BI, BO, 0, 0);
		std::shared_ptr<Register> ireg = std::make_shared<Register>(mBusLines, mCtrlLines, II, 0, 0, 0);
		std::shared_ptr<Register> freg = std::make_shared<Register>(mFlagLines, mCtrlLines, EOFI, 0, 0, 0);
		std::shared_ptr<Register> sreg = std::make_shared<Register>(mBusLines, mCtrlLines, 0, 0, 0xffff, 0);	// always counting
		std::shared_ptr<Register> pc = std::make_shared<Register>(mBusLines, mCtrlLines, CI, CO, CEME, HI);
		std::shared_ptr<Register> mar = std::make_shared<Register>(mBusLines, mCtrlLines, MI, 0, CEME, HI);
		std::shared_ptr<Control> ctrl = std::make_shared<Control>(mBusLines, mCtrlLines, ireg, freg, sreg);
		std::shared_ptr<Adder> alu = std::make_shared<Adder>(mBusLines, mCtrlLines, EOFI, ES, EC, areg, breg, mFlagLines);
		std::shared_ptr<Memory> ram = std::make_shared<Memory>(mBusLines, mCtrlLines, RI, RO, mar, mInput);
		mComponents.emplace_back(areg); mComponents.emplace_back(breg);
		mComponents.emplace_back(ireg); mComponents.emplace_back(freg); mComponents.emplace_back(sreg);
		mComponents.emplace_back(pc); mComponents.emplace_back(mar);
		mComponents.emplace_back(ctrl); mComponents.emplace_back(alu); mComponents.emplace_back(ram);	
		Reset();
	}
	void Reset()
	{
		for (auto& c : mComponents) c->Reset();
		mInput = ""; mSimTime = 0.0f;
		mLastTicks = GetTickCount();
	}
	void Update()
	{
		uint32_t nowticks = GetTickCount();
		mSimTime += (nowticks - mLastTicks)*0.001f;
		mLastTicks = nowticks;		
		while (mSimTime > 1.0f / 1843200.0f)
		{
			for(auto& c : mComponents) c->FallingEdge();
			for(auto& c : mComponents) c->BeingLow();
			for(auto& c : mComponents) c->RisingEdge();
			for(auto& c : mComponents) c->GettingHigh();
			for(auto& c : mComponents) c->BeingHigh();
			mSimTime -= 1.0f / 1843200.0f;
		}
	}
	void Input(char s) { mInput += s; }
protected:
	std::string mInput;
	uint32_t mLastTicks;
	float mSimTime;
	uint8_t mBusLines;
	uint8_t mFlagLines;
	uint16_t mCtrlLines;
	std::vector<std::shared_ptr<Component>> mComponents;
};

int main()
{
	SetConsoleMode(GetStdHandle(STD_OUTPUT_HANDLE), 0b111);		// enable ANSI control sequences in WINDOWS console
	Computer cpu;
	bool running = true;
	while (running)
	{
		while (kbhit())
		{
			static char lastch = 0;
			char ch = getch();												// read-in of a character code
			switch(lastch)
			{
				case -32:
					switch(ch)
					{
						case 79: running = false; break;		// END
						case 71: cpu.Reset(); break;				// POS1 = Reset
						default: break;
					}
					break;
				default:
					switch(ch)														// expecting "single key"
					{
						case -32: break;										// move to special key mode
						case 13: cpu.Input('\n'); break;
						default: cpu.Input(ch); break;
					}
					break;
			}
			lastch = ch;
		}		
		cpu.Update();
		Sleep(1);
	}
	return 0;
}

/*
------------------------------------------------------------------------------
This software is available under 2 licenses -- choose whichever you prefer.
------------------------------------------------------------------------------
ALTERNATIVE A - MIT License
Copyright (c) 2020 Carsten Herting
Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
------------------------------------------------------------------------------
ALTERNATIVE B - Public Domain (www.unlicense.org)
This is free and unencumbered software released into the public domain.
Anyone is free to copy, modify, publish, use, compile, sell, or distribute this
software, either in source code form or as a compiled binary, for any purpose,
commercial or non-commercial, and by any means.
In jurisdictions that recognize copyright laws, the author or authors of this
software dedicate any and all copyright interest in the software to the public
domain. We make this dedication for the benefit of the public at large and to
the detriment of our heirs and successors. We intend this dedication to be an
overt act of relinquishment in perpetuity of all present and future rights to
this software under copyright law.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
------------------------------------------------------------------------------
*/
