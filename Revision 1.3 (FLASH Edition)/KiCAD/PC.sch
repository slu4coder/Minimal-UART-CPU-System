EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 9
Title "Program Counter"
Date "2021-03-10"
Rev "1.3.2"
Comp ""
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 1400 850  0    50   Input ~ 0
CE
Text HLabel 9800 4950 3    50   BiDi ~ 0
BUS0
Text HLabel 9900 4950 3    50   BiDi ~ 0
BUS1
Text HLabel 10000 4950 3    50   BiDi ~ 0
BUS2
Text HLabel 10100 4950 3    50   BiDi ~ 0
BUS3
Text HLabel 10200 4950 3    50   BiDi ~ 0
BUS4
Text HLabel 10300 4950 3    50   BiDi ~ 0
BUS5
Text HLabel 10400 4950 3    50   BiDi ~ 0
BUS6
Text HLabel 10500 4950 3    50   BiDi ~ 0
BUS7
Text GLabel 8350 1900 1    50   Input ~ 0
CLOCK
$Comp
L 74xx:74HC245 U53
U 1 1 5F907909
P 8650 3800
F 0 "U53" V 8550 3650 50  0000 L CNN
F 1 "74HC245" V 8650 3650 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 8650 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 8650 3800 50  0001 C CNN
	1    8650 3800
	0    1    -1   0   
$EndComp
$Comp
L power:+5V #PWR0199
U 1 1 5F9174F1
P 7150 2400
F 0 "#PWR0199" H 7150 2250 50  0001 C CNN
F 1 "+5V" H 7165 2573 50  0000 C CNN
F 2 "" H 7150 2400 50  0001 C CNN
F 3 "" H 7150 2400 50  0001 C CNN
	1    7150 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0198
U 1 1 5F917B6A
P 5550 2400
F 0 "#PWR0198" H 5550 2150 50  0001 C CNN
F 1 "GND" H 5555 2227 50  0000 C CNN
F 2 "" H 5550 2400 50  0001 C CNN
F 3 "" H 5550 2400 50  0001 C CNN
	1    5550 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0201
U 1 1 5F918649
P 7850 2400
F 0 "#PWR0201" H 7850 2150 50  0001 C CNN
F 1 "GND" H 7855 2227 50  0000 C CNN
F 2 "" H 7850 2400 50  0001 C CNN
F 3 "" H 7850 2400 50  0001 C CNN
	1    7850 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0204
U 1 1 5F91896C
P 9450 2400
F 0 "#PWR0204" H 9450 2250 50  0001 C CNN
F 1 "+5V" H 9465 2573 50  0000 C CNN
F 2 "" H 9450 2400 50  0001 C CNN
F 3 "" H 9450 2400 50  0001 C CNN
	1    9450 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0202
U 1 1 5F91BFCD
P 7850 3800
F 0 "#PWR0202" H 7850 3550 50  0001 C CNN
F 1 "GND" H 7855 3627 50  0000 C CNN
F 2 "" H 7850 3800 50  0001 C CNN
F 3 "" H 7850 3800 50  0001 C CNN
	1    7850 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0206
U 1 1 5F91C5A3
P 9450 3800
F 0 "#PWR0206" H 9450 3650 50  0001 C CNN
F 1 "+5V" H 9465 3973 50  0000 C CNN
F 2 "" H 9450 3800 50  0001 C CNN
F 3 "" H 9450 3800 50  0001 C CNN
	1    9450 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0203
U 1 1 5F91C9DC
P 8250 4300
F 0 "#PWR0203" H 8250 4050 50  0001 C CNN
F 1 "GND" H 8350 4300 50  0000 C CNN
F 2 "" H 8250 4300 50  0001 C CNN
F 3 "" H 8250 4300 50  0001 C CNN
	1    8250 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1900 8550 1900
Wire Wire Line
	6250 1900 6250 850 
Wire Wire Line
	6250 850  8550 850 
Wire Wire Line
	8550 850  8550 1900
Wire Wire Line
	8650 2900 7550 2900
Wire Wire Line
	7550 2900 7550 1850
Wire Wire Line
	7550 1850 6150 1850
Wire Wire Line
	6150 1850 6150 1900
Text GLabel 6050 1900 1    50   Input ~ 0
CLOCK
Wire Wire Line
	6350 1900 6350 1050
Wire Wire Line
	6350 1050 8650 1050
Wire Wire Line
	8650 1050 8650 1900
Wire Wire Line
	9150 4300 9150 4500
Wire Wire Line
	9050 4300 9050 4550
Wire Wire Line
	8850 4300 8850 4650
Wire Wire Line
	8950 4300 8950 4600
Wire Wire Line
	8750 4300 8750 4700
Wire Wire Line
	8650 4300 8650 4750
Wire Wire Line
	8550 4300 8550 4800
Wire Wire Line
	8450 4300 8450 4850
Wire Wire Line
	9900 1450 9050 1450
Wire Wire Line
	9050 1450 9050 1900
Wire Wire Line
	8950 1900 8950 1400
Wire Wire Line
	8950 1400 10000 1400
Wire Wire Line
	10100 1350 8850 1350
Wire Wire Line
	8850 1350 8850 1900
Wire Wire Line
	6850 1900 6850 1300
Wire Wire Line
	6850 1300 10200 1300
Wire Wire Line
	6750 1900 6750 1250
Wire Wire Line
	6750 1250 10300 1250
Wire Wire Line
	6650 1900 6650 1200
Wire Wire Line
	10500 1150 6550 1150
Wire Wire Line
	6550 1150 6550 1900
Wire Wire Line
	9800 1500 9150 1500
Wire Wire Line
	9150 1500 9150 1900
Text GLabel 3650 1900 1    50   Input ~ 0
CLOCK
Wire Wire Line
	4050 3100 2150 3100
Wire Wire Line
	2150 3100 2150 2900
Wire Wire Line
	2050 2900 2050 3150
Wire Wire Line
	2050 3150 3950 3150
Wire Wire Line
	3850 3200 1950 3200
Wire Wire Line
	1950 3200 1950 2900
Wire Wire Line
	1850 2900 1850 3250
Wire Wire Line
	1850 3250 3750 3250
$Comp
L power:+5V #PWR0189
U 1 1 5F952707
P 2450 2400
F 0 "#PWR0189" H 2450 2250 50  0001 C CNN
F 1 "+5V" H 2465 2573 50  0000 C CNN
F 2 "" H 2450 2400 50  0001 C CNN
F 3 "" H 2450 2400 50  0001 C CNN
	1    2450 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0185
U 1 1 5F952711
P 850 2400
F 0 "#PWR0185" H 850 2150 50  0001 C CNN
F 1 "GND" H 855 2227 50  0000 C CNN
F 2 "" H 850 2400 50  0001 C CNN
F 3 "" H 850 2400 50  0001 C CNN
	1    850  2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0194
U 1 1 5F952725
P 4750 2400
F 0 "#PWR0194" H 4750 2250 50  0001 C CNN
F 1 "+5V" H 4765 2573 50  0000 C CNN
F 2 "" H 4750 2400 50  0001 C CNN
F 3 "" H 4750 2400 50  0001 C CNN
	1    4750 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0192
U 1 1 5F95272F
P 3150 3800
F 0 "#PWR0192" H 3150 3550 50  0001 C CNN
F 1 "GND" H 3155 3627 50  0000 C CNN
F 2 "" H 3150 3800 50  0001 C CNN
F 3 "" H 3150 3800 50  0001 C CNN
	1    3150 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0196
U 1 1 5F952739
P 4750 3800
F 0 "#PWR0196" H 4750 3650 50  0001 C CNN
F 1 "+5V" H 4765 3973 50  0000 C CNN
F 2 "" H 4750 3800 50  0001 C CNN
F 3 "" H 4750 3800 50  0001 C CNN
	1    4750 3800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0193
U 1 1 5F952743
P 3550 4300
F 0 "#PWR0193" H 3550 4050 50  0001 C CNN
F 1 "GND" H 3555 4127 50  0000 C CNN
F 2 "" H 3550 4300 50  0001 C CNN
F 3 "" H 3550 4300 50  0001 C CNN
	1    3550 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 850  3850 850 
Wire Wire Line
	3850 850  3850 1900
Wire Wire Line
	3950 2900 2900 2900
Wire Wire Line
	2900 2900 2900 1850
Wire Wire Line
	2900 1850 1450 1850
Wire Wire Line
	1450 1850 1450 1900
Text GLabel 1350 1900 1    50   Input ~ 0
CLOCK
Wire Wire Line
	1650 1900 1650 950 
Wire Wire Line
	1650 950  3950 950 
Wire Wire Line
	3950 950  3950 1900
Wire Wire Line
	4350 1450 4350 1900
Wire Wire Line
	4250 1900 4250 1400
Wire Wire Line
	4150 1350 4150 1900
Wire Wire Line
	2150 1900 2150 1300
Wire Wire Line
	2050 1900 2050 1250
Wire Wire Line
	1950 1900 1950 1200
Wire Wire Line
	1850 1150 1850 1900
Wire Wire Line
	4450 1500 4450 1900
Wire Wire Line
	4450 4300 4450 4500
Wire Wire Line
	4350 4550 4350 4300
Wire Wire Line
	4250 4300 4250 4600
Wire Wire Line
	4150 4650 4150 4300
Wire Wire Line
	4050 4300 4050 4700
Wire Wire Line
	3950 4750 3950 4300
Wire Wire Line
	3850 4300 3850 4800
Wire Wire Line
	3750 4300 3750 4850
Wire Wire Line
	6350 2900 5150 2900
Wire Wire Line
	5150 2900 5150 1850
Wire Wire Line
	5150 1850 3750 1850
Wire Wire Line
	3750 1850 3750 1900
NoConn ~ 1650 2900
Wire Wire Line
	3850 850  6250 850 
Connection ~ 3850 850 
Connection ~ 6250 850 
Wire Wire Line
	1400 850  1550 850 
Connection ~ 1550 850 
Connection ~ 9150 1500
Wire Wire Line
	4450 1500 9150 1500
Wire Wire Line
	4450 4500 9150 4500
Wire Wire Line
	4350 4550 9050 4550
Wire Wire Line
	4250 4600 8950 4600
Wire Wire Line
	4150 4650 8850 4650
Wire Wire Line
	4050 4700 8750 4700
Wire Wire Line
	3950 4750 8650 4750
Wire Wire Line
	3850 4800 8550 4800
Wire Wire Line
	3750 4850 8450 4850
Wire Wire Line
	4350 1450 9050 1450
Connection ~ 9050 1450
Wire Wire Line
	4250 1400 8950 1400
Connection ~ 8950 1400
Wire Wire Line
	4150 1350 8850 1350
Connection ~ 8850 1350
Wire Wire Line
	2150 1300 6850 1300
Connection ~ 6850 1300
Wire Wire Line
	6650 1200 10400 1200
Wire Wire Line
	2050 1250 6750 1250
Connection ~ 6750 1250
Wire Wire Line
	1950 1200 6650 1200
Connection ~ 6650 1200
Wire Wire Line
	1850 1150 6550 1150
Connection ~ 6550 1150
Wire Wire Line
	9150 4500 9800 4500
Connection ~ 9150 4500
Connection ~ 9800 4500
Wire Wire Line
	9800 4500 9800 4950
Wire Wire Line
	9050 4550 9900 4550
Connection ~ 9050 4550
Connection ~ 9900 4550
Wire Wire Line
	9900 4550 9900 4950
Wire Wire Line
	8950 4600 10000 4600
Connection ~ 8950 4600
Connection ~ 10000 4600
Wire Wire Line
	10000 4600 10000 4950
Wire Wire Line
	8850 4650 10100 4650
Connection ~ 8850 4650
Connection ~ 10100 4650
Wire Wire Line
	10100 4650 10100 4950
Wire Wire Line
	8750 4700 10200 4700
Connection ~ 8750 4700
Connection ~ 10200 4700
Wire Wire Line
	10200 4700 10200 4950
Wire Wire Line
	8650 4750 10300 4750
Connection ~ 8650 4750
Connection ~ 10300 4750
Wire Wire Line
	10300 4750 10300 4950
Wire Wire Line
	8550 4800 10400 4800
Connection ~ 8550 4800
Connection ~ 10400 4800
Wire Wire Line
	10400 4800 10400 4950
Wire Wire Line
	8450 4850 10500 4850
Connection ~ 8450 4850
Connection ~ 10500 4850
Wire Wire Line
	10500 4850 10500 4950
Wire Wire Line
	3100 4950 8150 4950
Wire Wire Line
	9800 1500 9800 4500
Wire Wire Line
	9900 1450 9900 4550
Wire Wire Line
	10000 1400 10000 4600
Wire Wire Line
	10100 1350 10100 4650
Wire Wire Line
	10200 1300 10200 4700
Wire Wire Line
	10300 1250 10300 4750
Wire Wire Line
	10400 1200 10400 4800
Wire Wire Line
	10500 1150 10500 4850
Wire Wire Line
	6550 2900 6550 3150
Wire Wire Line
	6550 3150 8450 3150
Wire Wire Line
	6650 3100 6650 2900
Wire Wire Line
	8550 3100 6650 3100
Wire Wire Line
	6750 2900 6750 3050
Wire Wire Line
	6750 3050 8650 3050
Wire Wire Line
	6850 3000 6850 2900
Wire Wire Line
	8750 3000 6850 3000
Wire Wire Line
	3100 4450 3450 4450
$Comp
L 8-Bit~CPU~32k:74HC161 U52
U 1 1 60C8AA8D
P 8650 2400
F 0 "U52" V 8750 2250 50  0000 L CNN
F 1 "74HC161" V 8650 2250 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 8650 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 8650 2400 50  0001 C CNN
	1    8650 2400
	0    1    1    0   
$EndComp
Connection ~ 8550 1900
$Comp
L 8-Bit~CPU~32k:74HC161 U51
U 1 1 60C8C27B
P 6350 2400
F 0 "U51" V 6450 2250 50  0000 L CNN
F 1 "74HC161" V 6350 2250 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6350 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 6350 2400 50  0001 C CNN
	1    6350 2400
	0    1    1    0   
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U49
U 1 1 60C8CE09
P 3950 2400
F 0 "U49" V 4050 2250 50  0000 L CNN
F 1 "74HC161" V 3950 2250 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 3950 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 3950 2400 50  0001 C CNN
	1    3950 2400
	0    1    1    0   
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U46
U 1 1 60C8D87F
P 1650 2400
F 0 "U46" V 1750 2250 50  0000 L CNN
F 1 "74HC161" V 1650 2250 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 1650 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 1650 2400 50  0001 C CNN
	1    1650 2400
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC00 U48
U 1 1 60CD4364
P 2800 4450
F 0 "U48" H 2800 4500 50  0000 C CNN
F 1 "74HC00" H 2800 4400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2800 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2800 4450 50  0001 C CNN
	1    2800 4450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U48
U 2 1 60CD78C7
P 2800 4950
F 0 "U48" H 2800 5000 50  0000 C CNN
F 1 "74HC00" H 2800 4900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2800 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2800 4950 50  0001 C CNN
	2    2800 4950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U48
U 3 1 60CD9715
P 2800 5450
F 0 "U48" H 2800 5500 50  0000 C CNN
F 1 "74HC00" H 2800 5400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2800 5450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2800 5450 50  0001 C CNN
	3    2800 5450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U48
U 4 1 60CDBC9F
P 2800 5950
F 0 "U48" H 2800 6000 50  0000 C CNN
F 1 "74HC00" H 2800 5900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2800 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2800 5950 50  0001 C CNN
	4    2800 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0191
U 1 1 5F0C68C8
P 3150 2400
F 0 "#PWR0191" H 3150 2150 50  0001 C CNN
F 1 "GND" H 3155 2227 50  0000 C CNN
F 2 "" H 3150 2400 50  0001 C CNN
F 3 "" H 3150 2400 50  0001 C CNN
	1    3150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 850  1550 1900
$Comp
L 74xx:74HC245 U50
U 1 1 5F9526C6
P 3950 3800
F 0 "U50" V 3850 3700 50  0000 L CNN
F 1 "74HC245" V 3950 3650 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 3950 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 3950 3800 50  0001 C CNN
	1    3950 3800
	0    1    -1   0   
$EndComp
Wire Wire Line
	3750 3250 3750 3300
Wire Wire Line
	3850 3200 3850 3300
Wire Wire Line
	3950 3150 3950 3300
Wire Wire Line
	4050 3100 4050 3300
Wire Wire Line
	4150 2900 4150 3300
Wire Wire Line
	4250 2900 4250 3300
Wire Wire Line
	4350 2900 4350 3300
Wire Wire Line
	4450 2900 4450 3300
Wire Wire Line
	9150 2900 9150 3300
Wire Wire Line
	9050 2900 9050 3300
Wire Wire Line
	8950 2900 8950 3300
Wire Wire Line
	8850 2900 8850 3300
Wire Wire Line
	8750 3000 8750 3300
Wire Wire Line
	8650 3050 8650 3300
Wire Wire Line
	8550 3100 8550 3300
Wire Wire Line
	8450 3150 8450 3300
$Comp
L power:+5V #PWR0187
U 1 1 5F6B82BA
P 1700 7350
F 0 "#PWR0187" H 1700 7200 50  0001 C CNN
F 1 "+5V" H 1715 7523 50  0000 C CNN
F 2 "" H 1700 7350 50  0001 C CNN
F 3 "" H 1700 7350 50  0001 C CNN
	1    1700 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6B8630
P 700 7350
AR Path="/5F645851/5F6B8630" Ref="#PWR?"  Part="1" 
AR Path="/5EC5738F/5F6B8630" Ref="#PWR0186"  Part="1" 
F 0 "#PWR0186" H 700 7100 50  0001 C CNN
F 1 "GND" H 705 7177 50  0000 C CNN
F 2 "" H 700 7350 50  0001 C CNN
F 3 "" H 700 7350 50  0001 C CNN
	1    700  7350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U48
U 5 1 5FBE46F7
P 1200 7350
F 0 "U48" V 1300 7350 50  0000 C CNN
F 1 "74HC00" V 1100 7350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1200 7350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1200 7350 50  0001 C CNN
	5    1200 7350
	0    1    1    0   
$EndComp
Text Notes 3100 4450 0    50   ~ 0
~COH
Text Notes 3100 4950 0    50   ~ 0
~COL
Text Notes 3100 5450 0    50   ~ 0
~CIL
Text Notes 3100 5950 0    50   ~ 0
~CIH
Wire Wire Line
	3450 4450 3450 4300
Wire Wire Line
	8150 4950 8150 4300
Wire Wire Line
	8650 1050 10650 1050
Wire Wire Line
	10650 1050 10650 5450
Connection ~ 8650 1050
Wire Wire Line
	3100 5450 10650 5450
Wire Wire Line
	3100 5950 10750 5950
Wire Wire Line
	10750 5950 10750 950 
Wire Wire Line
	10750 950  3950 950 
Connection ~ 3950 950 
Text GLabel 5850 1900 1    50   Input ~ 0
~RESET
Text GLabel 8150 1900 1    50   Input ~ 0
~RESET
Text GLabel 3450 1900 1    50   Input ~ 0
~RESET
Text GLabel 1150 1900 1    50   Input ~ 0
~RESET
Connection ~ 2500 4700
Wire Wire Line
	2500 4700 2500 4850
Wire Wire Line
	2500 4550 2500 4700
Wire Wire Line
	2400 4700 2500 4700
Text HLabel 2400 4700 0    50   Input ~ 0
CO
Connection ~ 2500 5200
Wire Wire Line
	2500 5200 2500 5050
Wire Wire Line
	2500 5350 2500 5200
Wire Wire Line
	2400 5200 2500 5200
Text HLabel 2400 5200 0    50   Input ~ 0
~HI
Connection ~ 2500 5700
Wire Wire Line
	2500 5700 2500 5850
Wire Wire Line
	2500 5550 2500 5700
Wire Wire Line
	2400 5700 2500 5700
Text HLabel 2400 5700 0    50   Input ~ 0
CI
Text HLabel 2000 4350 0    50   Input ~ 0
HI
Wire Wire Line
	2100 6050 2500 6050
Wire Wire Line
	2100 4350 2500 4350
Wire Wire Line
	2000 4350 2100 4350
Connection ~ 2100 4350
Wire Wire Line
	2100 4350 2100 6050
$EndSCHEMATC
