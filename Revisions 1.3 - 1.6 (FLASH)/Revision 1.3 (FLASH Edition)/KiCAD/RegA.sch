EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 9
Title "A Register"
Date "2021-03-10"
Rev "1.3.2"
Comp ""
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 3550 3400 0    50   Output ~ 0
R0
Text HLabel 3550 3500 0    50   Output ~ 0
R1
Text HLabel 3550 3600 0    50   Output ~ 0
R2
Text HLabel 3550 3700 0    50   Output ~ 0
R3
Text HLabel 3550 3800 0    50   Output ~ 0
R4
Text HLabel 3550 3900 0    50   Output ~ 0
R5
Text HLabel 3550 4000 0    50   Output ~ 0
R6
Text HLabel 3550 4100 0    50   Output ~ 0
R7
Text HLabel 5350 6450 3    50   BiDi ~ 0
BUS0
Text HLabel 5250 6450 3    50   BiDi ~ 0
BUS1
Text HLabel 5150 6450 3    50   BiDi ~ 0
BUS2
Text HLabel 5050 6450 3    50   BiDi ~ 0
BUS3
Text HLabel 4950 6450 3    50   BiDi ~ 0
BUS4
Text HLabel 4850 6450 3    50   BiDi ~ 0
BUS5
Text HLabel 4750 6450 3    50   BiDi ~ 0
BUS6
Text HLabel 4650 6450 3    50   BiDi ~ 0
BUS7
Text HLabel 1550 1450 0    50   Input ~ 0
~AI
$Comp
L 74xx:74HC245 U4
U 1 1 5F1007BD
P 4850 4900
F 0 "U4" V 4950 4800 50  0000 L CNN
F 1 "74HC245" V 4850 4800 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 4850 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 4850 4900 50  0001 C CNN
	1    4850 4900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5F10A852
P 1150 2550
F 0 "#PWR09" H 1150 2300 50  0001 C CNN
F 1 "GND" V 1155 2422 50  0000 R CNN
F 2 "" H 1150 2550 50  0001 C CNN
F 3 "" H 1150 2550 50  0001 C CNN
	1    1150 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5F10ADBC
P 4050 4900
F 0 "#PWR016" H 4050 4650 50  0001 C CNN
F 1 "GND" V 4055 4772 50  0000 R CNN
F 2 "" H 4050 4900 50  0001 C CNN
F 3 "" H 4050 4900 50  0001 C CNN
	1    4050 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 5F10B22E
P 5650 4900
F 0 "#PWR023" H 5650 4750 50  0001 C CNN
F 1 "+5V" V 5665 5028 50  0000 L CNN
F 2 "" H 5650 4900 50  0001 C CNN
F 3 "" H 5650 4900 50  0001 C CNN
	1    5650 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 5F10BB24
P 2950 2550
F 0 "#PWR013" H 2950 2400 50  0001 C CNN
F 1 "+5V" V 2965 2678 50  0000 L CNN
F 2 "" H 2950 2550 50  0001 C CNN
F 3 "" H 2950 2550 50  0001 C CNN
	1    2950 2550
	1    0    0    -1  
$EndComp
Text GLabel 4350 2050 1    50   Input ~ 0
CLOCK
Text GLabel 1650 2050 1    50   Input ~ 0
CLOCK
Wire Wire Line
	1750 2050 1850 2050
$Comp
L power:GND #PWR010
U 1 1 5F10D96B
P 1450 2050
F 0 "#PWR010" H 1450 1800 50  0001 C CNN
F 1 "GND" V 1455 1877 50  0000 C CNN
F 2 "" H 1450 2050 50  0001 C CNN
F 3 "" H 1450 2050 50  0001 C CNN
	1    1450 2050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5F10E37B
P 2050 2050
F 0 "#PWR011" H 2050 1800 50  0001 C CNN
F 1 "GND" V 2055 1877 50  0000 C CNN
F 2 "" H 2050 2050 50  0001 C CNN
F 3 "" H 2050 2050 50  0001 C CNN
	1    2050 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 1450 4550 1450
$Comp
L power:+5V #PWR018
U 1 1 5F10EE5F
P 4450 4400
F 0 "#PWR018" H 4450 4250 50  0001 C CNN
F 1 "+5V" H 4550 4500 50  0000 C CNN
F 2 "" H 4450 4400 50  0001 C CNN
F 3 "" H 4450 4400 50  0001 C CNN
	1    4450 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4400 5250 3500
Wire Wire Line
	5050 4400 5050 3700
Wire Wire Line
	4950 4400 4950 3800
Wire Wire Line
	4950 3050 2650 3050
Wire Wire Line
	2550 3050 2550 3100
Wire Wire Line
	2550 3100 4850 3100
Wire Wire Line
	4850 3100 4850 3900
Wire Wire Line
	4750 4400 4750 4000
Wire Wire Line
	4750 3150 2450 3150
Wire Wire Line
	2450 3150 2450 3050
Wire Wire Line
	2350 3050 2350 3200
Wire Wire Line
	2350 3200 4650 3200
Wire Wire Line
	4650 3200 4650 4100
Wire Wire Line
	5250 5400 5250 5600
Wire Wire Line
	5150 5400 5150 5700
Wire Wire Line
	5050 5400 5050 5800
Wire Wire Line
	4950 5400 4950 5900
Wire Wire Line
	4850 5400 4850 6000
Wire Wire Line
	4750 5400 4750 6100
Wire Wire Line
	3550 3400 5350 3400
Connection ~ 5350 3400
Wire Wire Line
	5350 3400 5350 4400
Wire Wire Line
	3550 3500 5250 3500
Connection ~ 5250 3500
Wire Wire Line
	3550 3600 5150 3600
Connection ~ 5150 3600
Wire Wire Line
	5150 3600 5150 4400
Wire Wire Line
	3550 3700 5050 3700
Connection ~ 5050 3700
Wire Wire Line
	3550 3800 4950 3800
Connection ~ 4950 3800
Wire Wire Line
	4950 3800 4950 3050
Wire Wire Line
	3550 3900 4850 3900
Connection ~ 4850 3900
Wire Wire Line
	4850 3900 4850 4400
Wire Wire Line
	3550 4000 4750 4000
Connection ~ 4750 4000
Wire Wire Line
	4750 4000 4750 3150
Wire Wire Line
	3550 4100 4650 4100
Connection ~ 4650 4100
Wire Wire Line
	4650 4100 4650 4400
Wire Wire Line
	5350 5500 6000 5500
Connection ~ 5350 5500
Wire Wire Line
	5350 5500 5350 5400
Wire Wire Line
	5250 2000 6050 2000
Wire Wire Line
	6050 2000 6050 5600
Wire Wire Line
	6050 5600 5250 5600
Connection ~ 5250 5600
Wire Wire Line
	5150 5700 6100 5700
Wire Wire Line
	6100 5700 6100 1950
Wire Wire Line
	6100 1950 5150 1950
Connection ~ 5150 5700
Wire Wire Line
	5050 1900 6150 1900
Wire Wire Line
	6150 1900 6150 5800
Wire Wire Line
	6150 5800 5050 5800
Connection ~ 5050 5800
Wire Wire Line
	4950 5900 6200 5900
Wire Wire Line
	6200 5900 6200 1700
Wire Wire Line
	6200 1700 2650 1700
Wire Wire Line
	2650 1700 2650 2050
Connection ~ 4950 5900
Wire Wire Line
	2550 2050 2550 1650
Wire Wire Line
	2550 1650 6250 1650
Wire Wire Line
	6250 1650 6250 6000
Wire Wire Line
	6250 6000 4850 6000
Connection ~ 4850 6000
Wire Wire Line
	4750 6100 6300 6100
Wire Wire Line
	6300 6100 6300 1600
Wire Wire Line
	6300 1600 2450 1600
Wire Wire Line
	2450 1600 2450 2050
Connection ~ 4750 6100
Wire Wire Line
	2350 2050 2350 1550
Wire Wire Line
	2350 1550 6350 1550
Wire Wire Line
	6350 1550 6350 6200
Connection ~ 4650 6200
Wire Wire Line
	4650 6200 4650 5400
Wire Wire Line
	4650 6200 6350 6200
Wire Wire Line
	4650 6200 4650 6450
Wire Wire Line
	4750 6100 4750 6450
Wire Wire Line
	4850 6000 4850 6450
Wire Wire Line
	4950 5900 4950 6450
Wire Wire Line
	5050 5800 5050 6450
Wire Wire Line
	5150 5700 5150 6450
Wire Wire Line
	5250 5600 5250 6450
Wire Wire Line
	5350 5500 5350 6450
Wire Wire Line
	4550 1450 4550 2050
$Comp
L power:GND #PWR015
U 1 1 5F10A09C
P 3850 2550
F 0 "#PWR015" H 3850 2300 50  0001 C CNN
F 1 "GND" V 3855 2422 50  0000 R CNN
F 2 "" H 3850 2550 50  0001 C CNN
F 3 "" H 3850 2550 50  0001 C CNN
	1    3850 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3700 5050 3050
Wire Wire Line
	5150 3050 5150 3600
Wire Wire Line
	5250 3500 5250 3050
Wire Wire Line
	5350 3050 5350 3400
$Comp
L power:GND #PWR019
U 1 1 5F10E127
P 4750 2050
F 0 "#PWR019" H 4750 1800 50  0001 C CNN
F 1 "GND" V 4755 1877 50  0000 C CNN
F 2 "" H 4750 2050 50  0001 C CNN
F 3 "" H 4750 2050 50  0001 C CNN
	1    4750 2050
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 5F10C003
P 5650 2550
F 0 "#PWR021" H 5650 2400 50  0001 C CNN
F 1 "+5V" V 5665 2678 50  0000 L CNN
F 2 "" H 5650 2550 50  0001 C CNN
F 3 "" H 5650 2550 50  0001 C CNN
	1    5650 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5F10DE6A
P 4150 2050
F 0 "#PWR017" H 4150 1800 50  0001 C CNN
F 1 "GND" V 4155 1877 50  0000 C CNN
F 2 "" H 4150 2050 50  0001 C CNN
F 3 "" H 4150 2050 50  0001 C CNN
	1    4150 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	5250 2050 5250 2000
Wire Wire Line
	5150 1950 5150 2050
Wire Wire Line
	5050 2050 5050 1900
Wire Wire Line
	4450 2050 4550 2050
Wire Wire Line
	5350 2050 6000 2050
Wire Wire Line
	6000 2050 6000 5500
$Comp
L 8-Bit~CPU~32k:74HC173 U2
U 1 1 60C6C699
P 2050 2550
F 0 "U2" V 2200 2400 50  0000 L CNN
F 1 "74HC173" V 2100 2400 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 2050 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 2050 2550 50  0001 C CNN
	1    2050 2550
	0    1    1    0   
$EndComp
Connection ~ 1850 2050
$Comp
L 8-Bit~CPU~32k:74HC173 U3
U 1 1 60C6DA44
P 4750 2550
F 0 "U3" V 4850 2350 50  0000 L CNN
F 1 "74HC173" V 4750 2350 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 4750 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 4750 2550 50  0001 C CNN
	1    4750 2550
	0    1    1    0   
$EndComp
Connection ~ 4550 2050
Wire Wire Line
	1550 1450 1850 1450
Connection ~ 1850 1450
Wire Wire Line
	1850 1450 1850 2050
$Comp
L power:GND #PWR020
U 1 1 603BD41A
P 4850 2050
F 0 "#PWR020" H 4850 1800 50  0001 C CNN
F 1 "GND" V 4855 1877 50  0000 C CNN
F 2 "" H 4850 2050 50  0001 C CNN
F 3 "" H 4850 2050 50  0001 C CNN
	1    4850 2050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 603BD6E1
P 2150 2050
F 0 "#PWR012" H 2150 1800 50  0001 C CNN
F 1 "GND" V 2155 1877 50  0000 C CNN
F 2 "" H 2150 2050 50  0001 C CNN
F 3 "" H 2150 2050 50  0001 C CNN
	1    2150 2050
	-1   0    0    1   
$EndComp
Text HLabel 3550 4400 0    50   Input ~ 0
~AO
Wire Wire Line
	3550 4400 4350 4400
$EndSCHEMATC
