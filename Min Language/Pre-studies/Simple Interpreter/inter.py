# Python Language Interpreter - Copyright (c) 2022 Carsten Herting (slu4)

def Look():								# returns the current character while skipping over comments
	global pc								# comments are entered by # and exited by \n or \0
	if source[pc] == '#':
		while source[pc] != '\n' and source[pc] != '\0': pc += 1		# scan over comments here
	return source[pc]

def Take():								# takes away and returns the current character
	global pc; c = Look(); pc += 1; return c

def TakeString(word):			# returns whether a certain string could be taken starting at pc
	global pc; copypc = pc
	for c in word:
		if Take() != c: pc = copypc; return False
	return True

def Next():								# returns the next non-whitespace character
	while Look() == ' ' or Look() == '\t' or Look() == '\n' or Look() == '\r': Take()
	return Look()

def TakeNext(c):					# eats white-spaces, returns whether a certain character could be eaten
	if Next() == c: Take(); return True
	else: return False

def IsDigit(c): return (c >= '0' and c <= '9')									# recognizers
def IsAlpha(c): return ((c >= 'a' and c <= 'z') or (c >= 'A' and c <= 'Z'))
def IsAlNum(c): return (IsDigit(c) or IsAlpha(c))
def IsAddOp(c): return (c == '+' or c == '-')
def IsMulOp(c): return (c == '*' or c == '/')

def TakeNextAlNum():
	alnum = ""
	if IsAlpha(Next()):
		while IsAlNum(Look()): alnum += Take()
	return alnum

# --------------------------------------------------------------------------------------------------

def BooleanFactor(act):
	inv = TakeNext('!'); e = Expression(act); b = e[1]; Next()
	if (e[0] == 'i'): 																			# a single mathexpression may also serve as a boolean factor
		if TakeString("=="): b = (b == MathExpression(act))
		elif TakeString("!="): b = (b != MathExpression(act))
		elif TakeString("<="): b = (b <= MathExpression(act))
		elif TakeString("<"): b = (b < MathExpression(act))
		elif TakeString(">="): b = (b >= MathExpression(act))
		elif TakeString(">"): b = (b > MathExpression(act))
	else:
		if TakeString("=="): b = (b == StringExpression(act))
		elif TakeString("!="): b = (b != StringExpression(act))
		else: b = (b != "")
	return act[0] and (b != inv)											# always returns False if inactive

def BooleanTerm(act):
	b = BooleanFactor(act)
	while TakeNext('&'): b = b & BooleanFactor(act)		# logical and corresponds to multiplication		
	return b

def BooleanExpression(act):
	b = BooleanTerm(act)
	while TakeNext('|'): b = b | BooleanTerm(act)			# logical or corresponds to addition
	return b

def MathFactor(act):
	m = 0
	if TakeNext('('):
		m = MathExpression(act)
		if not TakeNext(')'): Error("missing ')'")
	elif IsDigit(Next()):
		while IsDigit(Look()): m = 10 * m + ord(Take()) - ord('0')
	elif TakeString("val("):
		s = String(act)
		if act[0] and s.isdigit(): m = int(s)
		if not TakeNext(')'): Error("missing ')'")
	else:
		ident = TakeNextAlNum()
		if ident not in variable or variable[ident][0] != 'i': Error("unknown variable")
		elif act[0]: m = variable[ident][1]
	return m

def MathTerm(act):
	m = MathFactor(act)
	while IsMulOp(Next()):
		c = Take(); m2 = MathFactor(act)
		if c == '*': m = m * m2													# multiplication
		else: m = m / m2																# division
	return m

def MathExpression(act):
	c = Next()																				# check for an optional leading sign
	if IsAddOp(c): c = Take()
	m = MathTerm(act)
	if c == '-': m = -m
	while IsAddOp(Next()):
		c = Take(); m2 = MathTerm(act)
		if c == '+': m = m + m2													# addition
		else: m = m - m2																# subtraction
	return m

def String(act):
	s = ""
	if TakeNext('\"'):																# is it a literal string?
		while not TakeString("\""):
			if Look() == '\0': Error("unexpected EOF")
			if TakeString("\\n"): s += '\n'
			else: s += Take()
	elif TakeString("str("):													# str(...)
		s = str(MathExpression(act))
		if not TakeNext(')'): Error("missing ')'")
	elif TakeString("input()"):
		if act[0]: s = input()
	else: 
		ident = TakeNextAlNum()
		if ident in variable and variable[ident][0] == 's':	s = variable[ident][1]
		else: Error("not a string")
	return s

def StringExpression(act):
	s = String(act)
	while TakeNext('+'): s += String(act)							# string addition = concatenation
	return s

def Expression(act):
	global pc; copypc = pc; ident = TakeNextAlNum(); pc = copypc			# scan for identifier or "str"	
	if Next() == '\"' or ident == "str" or ident == "input" or (ident in variable and variable[ident][0] == 's'):
		return ('s', StringExpression(act))
	else: return ('i', MathExpression(act))

def DoWhile(act):
	global pc; local = [act[0]]; pc_while = pc				# save PC of the while statement
	while BooleanExpression(local): Block(local); pc = pc_while
	Block([False])																		# scan over inactive block and leave while

def DoIfElse(act):
	b = BooleanExpression(act)
	if act[0] and b: Block(act)												# process if block?
	else: Block([False])
	Next()
	if TakeString("else"):														# process else block?
		if act[0] and not b: Block(act)
		else: Block([False])

def DoGoSub(act):
	global pc
	ident = TakeNextAlNum()
	if ident not in variable or variable[ident][0] != 'p': Error("unknown subroutine")
	ret = pc; pc = variable[ident][1]; Block(act); pc = ret		# execute block as a subroutine

def DoSubDef():
	global pc
	ident = TakeNextAlNum()
	if ident == "": Error ("missing subroutine identifier")
	variable[ident] = ('p', pc); Block([False])

def DoAssign(act):																					# decide what sort of expression follows
	ident = TakeNextAlNum()
	if not TakeNext('=') or ident == "": Error("unknown statement")
	e = Expression(act)
	if act[0] or ident not in variable: variable[ident] = e		# assert initialization even if block is inactive

def DoBreak(act):
	if act[0]: act[0] = False													# switch off execution within enclosing loop (while, ...)

def DoPrint(act):
	while True:																								# process comma-separated arguments
		e = Expression(act)
		if act[0]: print(e[1], end="")
		if not TakeNext(','): return
		
def Statement(act):
	if TakeString("print"): DoPrint(act)
	elif TakeString("if"): DoIfElse(act)
	elif TakeString("while"): DoWhile(act)
	elif TakeString("break"): DoBreak(act) 
	elif TakeString("gosub"): DoGoSub(act)
	elif TakeString("sub"): DoSubDef()
	else: DoAssign(act)							

def Block(act):
	if TakeNext('{'):
		while not TakeNext('}'): Block(act)
	else: Statement(act)

def Program():
	act = [True]
	while Next() != '\0': Block(act)

def Error(text):
	s = source[:pc].rfind("\n") + 1; e = source.find("\n", pc)
	print("\nERROR " + text + " in line " + str(source[:pc].count("\n") + 1) + ": '" + source[s:pc] + "_" + source[pc:e] + "'\n")
	exit(1)

# --------------------------------------------------------------------------------------------------

pc = 0; variable = {}											# program couter, identifier -> (type, value) lookup table

import sys                                          
if len(sys.argv) < 2: print('USAGE: int.py <sourcefile>'); exit(1)
try: f = open(sys.argv[1], 'r')																					# open source file
except: print("ERROR: Can't find source file \'" + sys.argv[1] + "\'."); exit(1)
source = f.read() + '\0'; f.close()																			# append a null termination

Program()

# -------------------------------------------------------------------------------
# Python Language Interpreter - Copyright (c) 2022 Carsten Herting (slu4)
# -------------------------------------------------------------------------------
# MIT LICENSE
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated  documentation files  (the "Software"), to deal in
# the Software without  restriction, including  without  limitation the rights to
# use, copy,  modify, merge, publish, distribute, sublicense,  and/or sell copies
# of the Software, and  to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
# The above copyright notice and  this permission notice shall be included in all
# copies or substantial portions of the Software.
# THE  SOFTWARE  IS PROVIDED "AS IS",  WITHOUT  WARRANTY OF  ANY KIND, EXPRESS OR
# IMPLIED,  INCLUDING  BUT  NOT  LIMITED  TO  THE  WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR  A PARTICULAR  PURPOSE AND  NONINFRINGEMENT. IN NO  EVENT SHALL THE
# AUTHORS  OR  COPYRIGHT  HOLDERS  BE  LIABLE FOR  ANY  CLAIM, DAMAGES  OR  OTHER
# LIABILITY,  WHETHER IN AN ACTION  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN  CONNECTION WITH  THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# -------------------------------------------------------------------------------
