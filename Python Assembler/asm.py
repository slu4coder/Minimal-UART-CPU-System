opCodes = { 'NOP':'0',  'BNK':'1',  'OUT':'2',  'CLC':'3',  'SEC':'4',  'LSL':'5',  'ROL':'6',  'LSR':'7',
            'ROR':'8',  'ASR':'9',  'INP':'10', 'NEG':'11', 'INC':'12', 'DEC':'13', 'LDI':'14', 'ADI':'15',
            'SBI':'16', 'CPI':'17', 'ACI':'18', 'SCI':'19', 'JPA':'20', 'LDA':'21', 'STA':'22', 'ADA':'23',
            'SBA':'24', 'CPA':'25', 'ACA':'26', 'SCA':'27', 'JPR':'28', 'LDR':'29', 'STR':'30', 'ADR':'31',
            'SBR':'32', 'CPR':'33', 'ACR':'34', 'SCR':'35', 'CLB':'36', 'NEB':'37', 'INB':'38', 'DEB':'39',
            'ADB':'40', 'SBB':'41', 'ACB':'42', 'SCB':'43', 'CLW':'44', 'NEW':'45', 'INW':'46', 'DEW':'47',
            'ADW':'48', 'SBW':'49', 'ACW':'50', 'SCW':'51', 'LDS':'52', 'STS':'53', 'PHS':'54', 'PLS':'55',
            'JPS':'56', 'RTS':'57', 'BNE':'58', 'BEQ':'59', 'BCC':'60', 'BCS':'61', 'BPL':'62', 'BMI':'63'  }

lines, lineinfo, lineadr, labels = [], [], [], {}
LINEINFO_NONE, LINEINFO_ORG, LINEINFO_BEGIN, LINEINFO_END	= 0x00000, 0x10000, 0x20000, 0x40000

import sys                                          # read in <sourcefile> 2nd command parameter line by line
if len(sys.argv) != 2: print('usage: asm.py <sourcefile>'); sys.exit(1)
f = open(sys.argv[1], 'r')
while True:                                         # read in the source line
    line = f.readline()
    if not line: break
    lines.append(line.strip())                      # store each line without leading/trailing whitespaces
f.close()

for i in range(len(lines)):                         # PASS 1: do PER LINE replacements
    while(lines[i].find('\'') != -1):               # replace '...' occurances with corresponding ASCII code(s)
        k = lines[i].find('\'')
        l = lines[i].find('\'', k+1)
        if k != -1 and l != -1:
            replaced = ''
            for c in lines[i][k+1:l]: replaced += str(ord(c)) + ' '
            lines[i] = lines[i][0:k] + replaced + lines[i][l+1:]
        else: break

    if (lines[i].find(';') != -1): lines[i] = lines[i][0:lines[i].find(';')]    # delete comments
    lines[i] = lines[i].replace(',', ' ')                                       # replace commas with spaces

    lineinfo.append(LINEINFO_NONE)                  # generate a separate lineinfo
    if lines[i].find('#begin') != -1: lineinfo[i] |= LINEINFO_BEGIN; lines[i] = lines[i].replace('#begin', '')
    if lines[i].find('#end') != -1: lineinfo[i] |= LINEINFO_END; lines[i] = lines[i].replace('#end', '')
    k = lines[i].find('#org')
    if (k != -1):        
        s = lines[i][k:].split()                    # split from #org onwards
        lineinfo[i] |= LINEINFO_ORG + int(s[1], 0)  # use element after #org as origin address
        lines[i] = lines[i][0:k].join(s[2:])        # join everything before and after the #org ... statement

    if lines[i].find(':') != -1:
        labels[lines[i][:lines[i].find(':')]] = i   # put label with it's line number into dictionary
        lines[i] = lines[i][lines[i].find(':')+1:]  # cut out the label

    lines[i] = lines[i].split()                     # now split line into list of bytes (omitting whitepaces)

    for j in range(len(lines[i])-1, -1, -1):        # iterate from back to front while inserting stuff
        try: lines[i][j] = opCodes[lines[i][j]]     # try replacing mnemonic with opcode
        except: 
            if lines[i][j].find('0x') == 0 and len(lines[i][j]) > 4:    # replace '0xWORD' with 'LSB MSB'
                val = int(lines[i][j], 16)
                lines[i][j] = str(val & 0xff)
                lines[i].insert(j+1, str((val>>8) & 0xff))

adr = 0                                             # PASS 2: default start address
for i in range(len(lines)):
    for j in range(len(lines[i])-1, -1, -1):        # iterate from back to front while inserting stuff
        e = lines[i][j]                               
        if e[0] == '<' or e[0] == '>' : continue    # only one byte is required for this label
        if e.find('+') != -1: e = e[0:e.find('+')]  # omit +/- expressions after a label
        if e.find('-') != -1: e = e[0:e.find('-')]
        try:
            labels[e]; lines[i].insert(j+1, '0x@@') # is this element a label? => add a placeholder for the MSB
        except: pass
    if lineinfo[i] & LINEINFO_ORG: adr = lineinfo[i] & 0xffff   # react to #org by resetting the address
    lineadr.append(adr);                            # save line start address
    adr += len(lines[i])	  					    # advance address by number of (byte) elements

for l in labels: labels[l] = lineadr[labels[l]]     # update label dictionary from 'line number' to 'address'

for i in range(len(lines)):                         # PASS 3: replace 'reference + placeholder' with 'MSB LSB'
    for j in range(len(lines[i])):
        e = lines[i][j]; pre = ''; off = 0        
        if e[0] == '<' or e[0] == '>': pre = e[0]; e = e[1:]
        if e.find('+') != -1: off += int(e[e.find('+')+1:], 0); e = e[0:e.find('+')]
        if e.find('-') != -1: off -= int(e[e.find('-')+1:], 0); e = e[0:e.find('-')]
        try:
            adr = labels[e] + off
            if pre == '<': lines[i][j] = str(adr & 0xff)
            elif pre == '>': lines[i][j] = str((adr>>8) & 0xff)
            else: lines[i][j] = str(adr & 0xff); lines[i][j+1] = str((adr>>8) & 0xff)
        except: pass
        try: int(lines[i][j], 0)                    # check if ALL elements are numeric
        except: print('ERROR in line ' + str(i+1) + ': Undefined expression \'' + lines[i][j] + '\''); exit(1)

# for i in range(len(lines)):							# print out the result
#    s = ('%04.4x' % lineadr[i]) + ": "
#    for e in lines[i]: s += ('%02.2x' % (int(e, 0) & 0xff)) + ' '
#    print(s)

insert = ''; showout = True                       # print out the result
for i in range(len(lines)):
    if lineinfo[i] & LINEINFO_BEGIN: showout = True
    if lineinfo[i] & LINEINFO_END: showout = False
    if showout:
        if lineinfo[i] & LINEINFO_ORG:
            if insert: print(':' + insert); insert = ''
            print('%04.4x' % (lineinfo[i] & 0xffff))
        for e in lines[i]:
            insert += ('%02.2x' % (int(e, 0) & 0xff)) + ' '
            if len(insert) >= 16*3 - 1: print(':' + insert); insert = ''
if insert: print(':' + insert)

# -------------------------------------------------------------------------------
# Minimal Assembler for the 'MINIMAL CPU System' Revision 1.3 and higher
# Copyright (c) 2021 Carsten Herting (slu4)
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
