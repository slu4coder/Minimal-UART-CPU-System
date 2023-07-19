# MIN Programming Language
# Copyright 2022 Carsten Herting (slu4) - last update 01.06.2022
# See end of file for licensing information.

def IsDigit(c): return (c >= "0" and c <= "9")							# simple recognizer functions
def IsAlpha(c): return ((c >= "a" and c <= "z") or (c >= "A" and c <= "Z"))
def IsAlNum(c): return (IsDigit(c) or IsAlpha(c) or c == "_")
# ----------------------------------------------------------------------------------------------------------------
def Look():																									# returns the character at the current position
	if (k:= file[g.pc]) == "#":																# and ignores line comments
		while (k := file[g.pc]) != "\n" and k != "\0": g.pc += 1
	return k

def Take():																									# takes the current character, moves forward...
	if (c:= Look()) == "\n": g.m_ind = 0; g.cnt = True				# ... and measures line indentation
	elif g.cnt: g.cnt = 1*(c == " ") + 2*(c == "\t"); g.m_ind += g.cnt
	g.pc += 1; return c

def TakeThis(s):																						# takes only a specific string
	if s == file[g.pc:g.pc + len(s)]: g.pc += len(s); return True

def TakeAlNum():																						# takes an alpha-numeric string (identifier)
	alnum = ""
	if IsAlpha(Look()):
		while IsAlNum(Look()): alnum += Take()
	return alnum

def TakeOrd():																							# read in the ASCII code of character	
	if (s := Take()) == "\\" and (s := s + file[g.pc]) in special: g.pc += 1; return special[s]
	ErrorIf(s == "\0", "unexpected endmarker");	return ord(s)

def Next():																									# moves to next non-whitespace character
	while (c:= Look()) == " " or c == "\t" or c == "\r" or c == ":" or c == ";": Take()
	return c

def Grab(c):																								# moves to next and takes <c>
	if Next() == c: Take(); return True

def Assert(c): ErrorIf(not Grab(c), "character '" + c + "' missing")	# asserts next character to be <c>
	
def TakeUntil(c):																						# takes until (including!) c or '\0'
	while Look() != "\0" and Take() != c: pass

def SkipToIndent(indent):																		# spools over block without processing it's content
	TakeUntil("\n")																						# consume rest of current line first
	while Look() != "\0":
		if Next() != "\n" and g.m_ind <= indent: break					# break on non-empty target indent (or less)
		TakeUntil("\n")																					# otherwise consume the line
# ----------------------------------------------------------------------------------------------------------------
def BooleanFactor():
	Next(); inv = (TakeThis("not") == True); e = Expr(); Next()
	if e[TYP][-1:] == "a":																		# expression is array!
		if TakeThis("=="): b = (e == ArrayExpr())
		elif TakeThis("!="): b = (e != ArrayExpr())
		else: b = (e[VAL] != [])																# compare to empty array
	elif TakeThis("=="): b = (e[VAL] == MathExpr())						# any mathexpression is a boolean factor
	elif TakeThis("!="): b = (e[VAL] != MathExpr())
	elif TakeThis("<="): b = (e[VAL] <= MathExpr())
	elif TakeThis("<"): b = (e[VAL] < MathExpr())
	elif TakeThis(">="): b = (e[VAL] >= MathExpr())
	elif TakeThis(">"): b = (e[VAL] > MathExpr())
	else: b = (e[VAL] != 0)																		# compare to 0
	return b != inv																						# != is XOR

def BooleanTerm():
	b = BooleanFactor(); Next()
	while TakeThis("and"): b = b & BooleanFactor(); Next()	  # logical and corresponds to multiplication
	return b

def BooleanExpr():
	b = BooleanTerm(); Next()
	while TakeThis("or"): b = b | BooleanTerm(); Next()			  # logical or corresponds to addition
	return b
# ----------------------------------------------------------------------------------------------------------------
def MathFactor():
	if Next() == "(": Take(); m = MathExpr(); Assert(")")
	elif IsDigit(Look()) and not (m := 0):
		while IsDigit(Look()): m = 10*m + ord(Take()) - ord("0")
	elif Look() == "\'": Take(); m = TakeOrd(); Assert("\'")
	elif TakeThis("key"):
		Assert("("); Assert(")"); m = 255
		if msvcrt.kbhit(): m = ord(msvcrt.getch())
	elif TakeThis("int"):
		Assert("("); e = ArrayExpr(); Assert(")"); m = 0; ErrorIf(e[TYP] != "ca", "expecting char array")
		for c in e[VAL]: m = m + (9*m + c-48) * (c-48 in range(10))
	elif TakeThis("len"): Assert("("); e = ArrayExpr(); Assert(")"); ErrorIf(e[TYP][-1:] != "a", "expecting array"); m = len(e[VAL])
	elif TakeThis("rnd"): Assert("("); Assert(")"); m = random.randrange(0,256)
	elif e := ("?", 0):
		if (key := TakeAlNum()) in call: DoCall(key); e = g.ret; g.ret = ("?", 0)
		elif (vkey := MakeId(key)): e = (var[vkey][TYP], data[var[vkey][VAL]])
		ErrorIf(e[TYP] == "?", "unknown identifier in math factor")
		if e[TYP][-1:] != "a" or (e := Array(True, e))[TYP][-1:] != "a": m = e[VAL]		# math var or array element access allowed
		else: Error("expecting basetype in math factor")
	return m

def MathTerm(use=False, m=0):
	if not use: m = MathFactor()
	while Next() == "*" or Look() == "/":
		if Take() == "*": m = m * MathFactor()									# multiplication
		else: m = int(m / MathFactor())													# make sure division yields an integer
	return m

def MathExpr(use=False, m=0):																# user specifies pre-scanned FACTOR
	if use: m = MathTerm(use, m)
	elif Next() == "-": Take(); m = -MathTerm()								# leading minus?
	else: Grab("+"); m = MathTerm()														# either no or leading sign or leading plus
	while Next() == "+" or Look() == "-":	
		if Take() == "+": m = m + MathTerm()										# addition						
		else: m = m - MathTerm()																# subtraction
	return m
# ----------------------------------------------------------------------------------------------------------------
def Array(use=False, a=0):																	# eltype = ELEMENT TYPE, output-type is eltype + "a"
	if use: pass																							# in case a pre-scanned value is supplied, use it!
	elif Grab("[") and (a := ("ia", [])):											# literal array [ ... ] definition?
		while not Grab("]"): Grab(","); a[VAL].append(MathExpr())
	elif TakeThis("\"") and (a := ("ca", [])):								# read a char array
		while not TakeThis("\""): a[VAL].append(TakeOrd())			# convert to numbers
	elif TakeThis("str"):
		a = ("ca", []); Assert("("); numstr = str(MathExpr()); Assert(")")
		for c in numstr: a[VAL].append(ord(c))
	elif TakeThis("input"):
		a = ("ca", []); Assert("("); Assert(")")
		for c in input(): a[VAL].append(ord(c))
	elif (key := TakeAlNum()) in call: DoCall(key); a = g.ret; g.ret = ("?", 0)# take and invalidate return value
	elif (vkey := MakeId(key)) and var[vkey][TYP][-1:] == "a": a = (var[vkey][TYP], data[var[vkey][VAL]])
	else: Error("expecting array type")
	while Grab("["):																					# this is performed with pre-scanned values
		i0 = MathExpr()
		if Grab("]"): ErrorIf(a[TYP][-1:] != "a", "element access without array"); ErrorIf(i0 not in range(len(a[VAL])), "bad element index"); a = ("i", a[VAL][i0])	# ELEMENT OPERATOR
		else: Assert("."); Assert("."); i1 = MathExpr(); Assert(']'); a = (a[TYP], a[VAL][i0:i1])	# SLICING OPERATOR
	return a

def ArrayExpr(use=False, a=0):															# parameter = ELEMENT data type
	a = Array(use, a)
	while a[TYP][-1:] == "a" and Grab("+"): b = Array(); ErrorIf(b[TYP] != a[TYP], "type mismatch in array expression"); a = (a[TYP], a[VAL] + b[VAL])
	return a
# ----------------------------------------------------------------------------------------------------------------
def Expr():
	if Next() == "[": return ArrayExpr()
	pc = g.pc; key = TakeAlNum(); vkey = MakeId(key)
	if Look() == "\"" or key == "input" or key == "str": g.pc = pc; return ArrayExpr()
	if key in call: DoCall(key); e = g.ret; g.ret = ("?", 0)	# CALL
	elif vkey: e = (var[vkey][TYP], data[var[vkey][VAL]])			# VARIABLE (both math and array)
	else: g.pc = pc; return ("i", MathExpr())									# handle math symbols + - ( ) 0123456789
	if e[TYP][-1:] == "a" and (e := Array(True, e))[TYP][-1:] == "a": return ArrayExpr(True, e)	# handle array but not element access
	else: return ("i", MathExpr(True, e[VAL]))								# math variable
# ----------------------------------------------------------------------------------------------------------------
def DoCall(key):																						# key must be a valid CALL
	Assert("("); datalen = len(data); varlen = len(var); arg = g.pc; g.pc = par = call[key]; isref = False	
	while not Grab(")"):																			# parse (params) args *before* increasing the sublevel!
		if Look() == "&": Take(); isref = True									# PARSE A PARAMETER reference variable?
		Next(); loc = TakeAlNum(); ErrorIf(loc == "", "invalid parameter")	# read in parameter name
		Grab(","); par = g.pc; g.pc = arg; loc += "@" + str(g.sub + 1)	# PARSE AN ARGUMENT
		if isref:
			Next(); akey = MakeId(TakeAlNum()); ErrorIf(not akey, "invalid reference")
			var[loc] = var[akey]; isref = False
		else:																										# expect an expression of a certain type
			e = Expr(); var[loc] = (e[TYP], len(data))
			if e[TYP][-1:] == "a": data.append(e[VAL][:])					# ENFORCE COPY argument expression into local variable
			else: data.append(e[VAL])															# primitive types are copied anyway
		Grab(","); arg = g.pc; g.pc = par
	oldloop = g.loop; oldtind = g.t_ind; g.loop = 0; g.sub += 1; g.t_ind = 0; Block(); g.loop = oldloop
	g.t_ind = oldtind; g.sub -= 1; g.pc = arg; g.halt = False; Assert(")"); CleanStack(varlen, datalen)	# return to pos after arguments and eat ")"

def DoReturn():
	ErrorIf(g.sub == 0, "unexpected return")
	if Next() != "\n": g.ret = Expr()													# does the sub return anything?
	g.halt = True; SkipToIndent(0)														# switch off until end of block (call will clear)

def DoPrint():
	while True:																								# process comma-separated arguments
		if (e := Expr())[TYP] == "ca":													# print char[] type as text
			for b in e[VAL]: print(chr(b & 0x7f), end="", flush=True)
		else: print(e[VAL], end="", flush=True)
		if not Grab(","): return

def DoWhile():
	while_pc = g.pc; oldout = g.out_ind; g.out_ind = g.t_ind; g.loop +=1		# store bailout indentation, set newone
	while BooleanExpr():		
		Block()																									# a break & skip may occur here...
		if g.halt: break																				# ... did that happen?
		g.pc = while_pc																					# ... no, go back
	else:	SkipToIndent(g.out_ind)															# regular end of while => skip
	g.loop -= 1; g.out_ind = oldout; g.halt = False						# restore bailout and clear a possible halt

def DoBreak(): ErrorIf(g.loop == 0, "unexpected break"); g.halt = True; SkipToIndent(g.out_ind)	# switch off enclosing loop (while will clear)

def DoIf():
	if b := BooleanExpr(): Block()
	else: SkipToIndent(g.t_ind)
	while Grab("\n"): pass
	while g.m_ind == g.t_ind and TakeThis("elif"):
		if b: SkipToIndent(g.t_ind)
		elif b := BooleanExpr(): Block()
		else: SkipToIndent(g.t_ind)
		while Grab("\n"): pass	
	if g.m_ind == g.t_ind and TakeThis("else"):
		if not b: Block()
		else: SkipToIndent(g.t_ind)

def DoDef():																								# only call if indentation = 0!
	ErrorIf(g.m_ind > 0, "unexpected def"); Next(); key = TakeAlNum(); Assert("(")
	ErrorIf(key == "" or key in call, "invalid subroutine identifier")
	call[key] = g.pc; TakeUntil(")"); SkipToIndent(0)

def DoAssign(key):
	vkey = MakeId(key); iselem = False
	if Grab("["): iselem = True; el = MathExpr(); Assert("]")	# parse element access
	if not vkey and key and not iselem:												# DECLARATION
		vkey = key + ("@" + str(g.sub)) * (g.t_ind != 0)					# extend key if variable is local (inside loop or def)
		var[vkey] = ("", len(data)); data.append(0)							# create new dict entry
	ErrorIf(not vkey, "invalid variable identifier"); Assert("=") 	# a declaration allows for any type
	if iselem: ErrorIf(el not in range(len(data[var[vkey][VAL]])), "invalid index"); data[var[vkey][VAL]][el] = MathExpr()
	else:
		e = Expr(); ErrorIf(var[vkey][TYP] and e[TYP] != var[vkey][TYP], "assignment type mismatch")	# possibly still empty type after declaration
		if not var[vkey][TYP]: var[vkey] = (e[TYP], var[vkey][VAL])	# expression typ in leeren var typ übernehmen
		if e[TYP][-1:] == "a": data[var[vkey][VAL]] = e[VAL][:]	# update the data of the variable BY COPY
		else: data[var[vkey][VAL]] = e[VAL]
# ----------------------------------------------------------------------------------------------------------------
def Block():
	if Next() == "\n":
		varlen = len(var); datalen = len(data); g.t_ind += 2; ErrorIf(not Statement(), "unexpected end of block")
		while(Look() != "\0" and Statement()): pass
		g.t_ind -= 2; CleanStack(varlen, datalen)
	else: varlen = len(var); datalen = len(data); Simple_Stmts(); CleanStack(varlen, datalen)
	
def Statement():																						# look ahead and decide what statement type is coming
	while Grab("\n"): pass
	if g.m_ind != g.t_ind: return False
	pc = g.pc; key = TakeAlNum(); g.pc = pc
	if key == "if" or  key == "while" or key == "def": Compound_Stmt(); return True
	else: Simple_Stmts(); return True

def Simple_Stmts():
	while not g.halt and Next() != "\n" and Look() != "\0": Simple_Stmt()		# any halt halts further simple statements!

def Simple_Stmt():
	if (key := TakeAlNum()) == "print": DoPrint()
	elif key == "break": DoBreak()
	elif key == "return": DoReturn()
	elif key in call: DoCall(key)															# call w/o assignment
	else: DoAssign(key)																				# must be an assignment / declaration

def Compound_Stmt():
	if (key := TakeAlNum()) == "if": DoIf()
	elif key == "while": DoWhile()
	else: DoDef()																							# key can only be a function
# ----------------------------------------------------------------------------------------------------------------
def MakeId(key):																						# returns an existing indentifier or NONE
	if key in var or (key := key + "@" + str(g.sub)) in var: return key

def CleanStack(vlen, dlen):
	while len(var) > vlen: var.popitem()											# delete local parameter variables
	while len(data) > dlen: data.pop()												# delete local data

def ErrorIf(bool, error):
	if bool: Error(error)

def Error(text):																						# prints information about the error and halts
	ln = str(file[:g.pc].count("\n") + 1)											# line number
	s = file[:g.pc].rfind("\n") + 1; e = file.find("\n", g.pc); line = file[s:g.pc] + "?" + file[g.pc:e]
	print(var)
	print("\nERROR " + text + " in line " + ln + ": '" + line + "'"); exit(1)

# STATE: file index, halt flag, sub and loop level, return value, measured, target, breakout indent
class g: pc = 0; halt = False; sub = 0; loop = 0; ret = ("?", 0); m_ind = 0; t_ind = 0; out_ind = 0; cnt = True
call = {}; var = {}; data = []; TYP = 0; VAL = 1						# DICTIONARY { key: (<typ>, <val>) } and DATA storage
special = { "\\#": 35, "\\\"": 34, "\\\'": 39, "\\n": 10, "\\r": 13, "\\t": 9, "\\e": 27, "\\0": 0 }		# special sequences

import sys, random; import msvcrt, os; os.system("")
if len(sys.argv) < 2: print("USAGE: min.py <filename>"); exit(1)
try: f = open(sys.argv[1], "r")
except: print("ERROR: Cannot find \'" + sys.argv[1] + "\'."); exit(1)
file = f.read() + "\0"; f.close()														# append a null termination
while Look() != '\0': ErrorIf(not Statement(), "unexpected indent")

# LICENSING INFORMATION
# This file is part of MIN. MIN is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software Foundation, either
# version 3 of the License, or (at your option) any later version.
# MIN is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
# License for more details. You should have received a copy of the GNU General Public License along
# with this program. If not, see https://www.gnu.org/licenses/.