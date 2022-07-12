EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 10
Title "A Register"
Date "2021-04-16"
Rev "1.5"
Comp ""
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 5550 3350 0    50   Output ~ 0
R0
Text HLabel 5550 3450 0    50   Output ~ 0
R1
Text HLabel 5550 3550 0    50   Output ~ 0
R2
Text HLabel 5550 3650 0    50   Output ~ 0
R3
Text HLabel 5550 3750 0    50   Output ~ 0
R4
Text HLabel 5550 3850 0    50   Output ~ 0
R5
Text HLabel 5550 3950 0    50   Output ~ 0
R6
Text HLabel 5550 4050 0    50   Output ~ 0
R7
Text HLabel 7350 5350 3    50   BiDi ~ 0
BUS0
Text HLabel 7250 5350 3    50   BiDi ~ 0
BUS1
Text HLabel 7150 5350 3    50   BiDi ~ 0
BUS2
Text HLabel 7050 5350 3    50   BiDi ~ 0
BUS3
Text HLabel 6950 5350 3    50   BiDi ~ 0
BUS4
Text HLabel 6850 5350 3    50   BiDi ~ 0
BUS5
Text HLabel 6750 5350 3    50   BiDi ~ 0
BUS6
Text HLabel 6650 5350 3    50   BiDi ~ 0
BUS7
Text HLabel 3550 1550 0    50   Input ~ 0
~AI
$Comp
L 74xx:74HC245 U5
U 1 1 5F1007BD
P 6850 4850
F 0 "U5" V 6950 4750 50  0000 L CNN
F 1 "74HC245" V 6850 4750 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6850 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 6850 4850 50  0001 C CNN
	1    6850 4850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5F10A852
P 3150 2500
F 0 "#PWR016" H 3150 2250 50  0001 C CNN
F 1 "GND" V 3155 2372 50  0000 R CNN
F 2 "" H 3150 2500 50  0001 C CNN
F 3 "" H 3150 2500 50  0001 C CNN
	1    3150 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5F10ADBC
P 6050 4850
F 0 "#PWR022" H 6050 4600 50  0001 C CNN
F 1 "GND" V 6055 4722 50  0000 R CNN
F 2 "" H 6050 4850 50  0001 C CNN
F 3 "" H 6050 4850 50  0001 C CNN
	1    6050 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR028
U 1 1 5F10B22E
P 7650 4850
F 0 "#PWR028" H 7650 4700 50  0001 C CNN
F 1 "+5V" V 7665 4978 50  0000 L CNN
F 2 "" H 7650 4850 50  0001 C CNN
F 3 "" H 7650 4850 50  0001 C CNN
	1    7650 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR020
U 1 1 5F10BB24
P 4950 2500
F 0 "#PWR020" H 4950 2350 50  0001 C CNN
F 1 "+5V" V 4965 2628 50  0000 L CNN
F 2 "" H 4950 2500 50  0001 C CNN
F 3 "" H 4950 2500 50  0001 C CNN
	1    4950 2500
	1    0    0    -1  
$EndComp
Text GLabel 6350 2000 1    50   Input ~ 0
CLOCK
Text GLabel 3650 2000 1    50   Input ~ 0
CLOCK
Wire Wire Line
	3750 2000 3850 2000
$Comp
L power:GND #PWR017
U 1 1 5F10D96B
P 3450 2000
F 0 "#PWR017" H 3450 1750 50  0001 C CNN
F 1 "GND" V 3455 1827 50  0000 C CNN
F 2 "" H 3450 2000 50  0001 C CNN
F 3 "" H 3450 2000 50  0001 C CNN
	1    3450 2000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5F10E37B
P 4050 2000
F 0 "#PWR018" H 4050 1750 50  0001 C CNN
F 1 "GND" V 4055 1827 50  0000 C CNN
F 2 "" H 4050 2000 50  0001 C CNN
F 3 "" H 4050 2000 50  0001 C CNN
	1    4050 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	3850 1550 6550 1550
$Comp
L power:+5V #PWR024
U 1 1 5F10EE5F
P 6450 4350
F 0 "#PWR024" H 6450 4200 50  0001 C CNN
F 1 "+5V" H 6550 4450 50  0000 C CNN
F 2 "" H 6450 4350 50  0001 C CNN
F 3 "" H 6450 4350 50  0001 C CNN
	1    6450 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 4350 7250 3450
Wire Wire Line
	7050 4350 7050 3650
Wire Wire Line
	6950 4350 6950 3750
Wire Wire Line
	6950 3000 4650 3000
Wire Wire Line
	4550 3000 4550 3050
Wire Wire Line
	4550 3050 6850 3050
Wire Wire Line
	6850 3050 6850 3850
Wire Wire Line
	6750 4350 6750 3950
Wire Wire Line
	6750 3100 4450 3100
Wire Wire Line
	4450 3100 4450 3000
Wire Wire Line
	4350 3000 4350 3150
Wire Wire Line
	4350 3150 6650 3150
Wire Wire Line
	6650 3150 6650 4050
Wire Wire Line
	5550 3350 7350 3350
Connection ~ 7350 3350
Wire Wire Line
	7350 3350 7350 4350
Wire Wire Line
	5550 3450 7250 3450
Connection ~ 7250 3450
Wire Wire Line
	5550 3550 7150 3550
Connection ~ 7150 3550
Wire Wire Line
	7150 3550 7150 4350
Wire Wire Line
	5550 3650 7050 3650
Connection ~ 7050 3650
Wire Wire Line
	5550 3750 6950 3750
Connection ~ 6950 3750
Wire Wire Line
	6950 3750 6950 3000
Wire Wire Line
	5550 3850 6850 3850
Connection ~ 6850 3850
Wire Wire Line
	6850 3850 6850 4350
Wire Wire Line
	5550 3950 6750 3950
Connection ~ 6750 3950
Wire Wire Line
	6750 3950 6750 3100
Wire Wire Line
	5550 4050 6650 4050
Connection ~ 6650 4050
Wire Wire Line
	6650 4050 6650 4350
Wire Wire Line
	6550 1550 6550 2000
$Comp
L power:GND #PWR021
U 1 1 5F10A09C
P 5850 2500
F 0 "#PWR021" H 5850 2250 50  0001 C CNN
F 1 "GND" V 5855 2372 50  0000 R CNN
F 2 "" H 5850 2500 50  0001 C CNN
F 3 "" H 5850 2500 50  0001 C CNN
	1    5850 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3650 7050 3000
Wire Wire Line
	7150 3000 7150 3550
Wire Wire Line
	7250 3450 7250 3000
Wire Wire Line
	7350 3000 7350 3350
$Comp
L power:GND #PWR025
U 1 1 5F10E127
P 6750 2000
F 0 "#PWR025" H 6750 1750 50  0001 C CNN
F 1 "GND" V 6755 1827 50  0000 C CNN
F 2 "" H 6750 2000 50  0001 C CNN
F 3 "" H 6750 2000 50  0001 C CNN
	1    6750 2000
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR027
U 1 1 5F10C003
P 7650 2500
F 0 "#PWR027" H 7650 2350 50  0001 C CNN
F 1 "+5V" V 7665 2628 50  0000 L CNN
F 2 "" H 7650 2500 50  0001 C CNN
F 3 "" H 7650 2500 50  0001 C CNN
	1    7650 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5F10DE6A
P 6150 2000
F 0 "#PWR023" H 6150 1750 50  0001 C CNN
F 1 "GND" V 6155 1827 50  0000 C CNN
F 2 "" H 6150 2000 50  0001 C CNN
F 3 "" H 6150 2000 50  0001 C CNN
	1    6150 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	6450 2000 6550 2000
$Comp
L 8-Bit~CPU~32k:74HC173 U3
U 1 1 60C6C699
P 4050 2500
F 0 "U3" V 4200 2350 50  0000 L CNN
F 1 "74HC173" V 4100 2350 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 4050 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 4050 2500 50  0001 C CNN
	1    4050 2500
	0    1    1    0   
$EndComp
Connection ~ 3850 2000
$Comp
L 8-Bit~CPU~32k:74HC173 U4
U 1 1 60C6DA44
P 6750 2500
F 0 "U4" V 6850 2300 50  0000 L CNN
F 1 "74HC173" V 6750 2300 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6750 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 6750 2500 50  0001 C CNN
	1    6750 2500
	0    1    1    0   
$EndComp
Connection ~ 6550 2000
Wire Wire Line
	3550 1550 3850 1550
Connection ~ 3850 1550
Wire Wire Line
	3850 1550 3850 2000
$Comp
L power:GND #PWR026
U 1 1 603BD41A
P 6850 2000
F 0 "#PWR026" H 6850 1750 50  0001 C CNN
F 1 "GND" V 6855 1827 50  0000 C CNN
F 2 "" H 6850 2000 50  0001 C CNN
F 3 "" H 6850 2000 50  0001 C CNN
	1    6850 2000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR019
U 1 1 603BD6E1
P 4150 2000
F 0 "#PWR019" H 4150 1750 50  0001 C CNN
F 1 "GND" V 4155 1827 50  0000 C CNN
F 2 "" H 4150 2000 50  0001 C CNN
F 3 "" H 4150 2000 50  0001 C CNN
	1    4150 2000
	-1   0    0    1   
$EndComp
Text HLabel 5550 4350 0    50   Input ~ 0
~AO
Wire Wire Line
	5550 4350 6350 4350
Text HLabel 7350 2000 1    50   BiDi ~ 0
BUS0
Text HLabel 7250 2000 1    50   BiDi ~ 0
BUS1
Text HLabel 7150 2000 1    50   BiDi ~ 0
BUS2
Text HLabel 7050 2000 1    50   BiDi ~ 0
BUS3
Text HLabel 4650 2000 1    50   BiDi ~ 0
BUS4
Text HLabel 4550 2000 1    50   BiDi ~ 0
BUS5
Text HLabel 4450 2000 1    50   BiDi ~ 0
BUS6
Text HLabel 4350 2000 1    50   BiDi ~ 0
BUS7
$EndSCHEMATC
