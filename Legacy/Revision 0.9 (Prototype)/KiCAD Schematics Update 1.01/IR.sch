EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 10
Title "Control Logic"
Date "2020-12-09"
Rev "1.02"
Comp "Carsten (Slu4) Herting (c) 2020"
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 6600 1500 1    50   BiDi ~ 0
BUS0
Text HLabel 6500 1500 1    50   BiDi ~ 0
BUS1
Text HLabel 6400 1500 1    50   BiDi ~ 0
BUS2
Text HLabel 6300 1500 1    50   BiDi ~ 0
BUS3
Text HLabel 4400 1500 1    50   BiDi ~ 0
BUS4
Text HLabel 4300 1500 1    50   BiDi ~ 0
BUS5
Text HLabel 5000 3350 1    50   Output ~ 0
~CO
Text HLabel 4900 3350 1    50   Output ~ 0
~CI
Text HLabel 7650 3350 1    50   Output ~ 0
HI
Text HLabel 8050 3350 1    50   Output ~ 0
~AI
Text HLabel 7950 5600 3    50   Output ~ 0
~AO
Text HLabel 7850 5600 3    50   Output ~ 0
~BI
Text HLabel 7750 5600 3    50   Output ~ 0
~BO
Text HLabel 7750 3350 1    50   Output ~ 0
~MI
Text HLabel 5000 5600 3    50   Output ~ 0
~EO
Text HLabel 5100 5600 3    50   Output ~ 0
ES
Text HLabel 5200 5600 3    50   Output ~ 0
EC
Text HLabel 7850 3350 1    50   Output ~ 0
~RI
Text HLabel 7950 3350 1    50   Output ~ 0
~RO
Text HLabel 5100 3350 1    50   Output ~ 0
CEME
Text HLabel 7350 3350 1    50   Input ~ 0
~OE
Text GLabel 9000 1050 1    50   Output ~ 0
CLOCK
Text HLabel 2200 1600 1    50   Input ~ 0
FLAG_C
Text HLabel 2100 1600 1    50   Input ~ 0
FLAG_N
Text HLabel 2300 1600 1    50   Input ~ 0
FLAG_Z
$Comp
L 74xx:74HC04 U1
U 3 1 5F961DFC
P 9000 1350
F 0 "U1" V 8950 1050 50  0000 L CNN
F 1 "74HC04" V 9050 1000 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9000 1350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 9000 1350 50  0001 C CNN
	3    9000 1350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F96FA36
P 2900 2200
AR Path="/5EC573DA/5F96FA36" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA36" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 2900 1950 50  0001 C CNN
F 1 "GND" V 2905 2072 50  0000 R CNN
F 2 "" H 2900 2200 50  0001 C CNN
F 3 "" H 2900 2200 50  0001 C CNN
	1    2900 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F96FA3C
P 4700 2150
AR Path="/5EC573DA/5F96FA3C" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA3C" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 4700 2000 50  0001 C CNN
F 1 "+5V" V 4715 2278 50  0000 L CNN
F 2 "" H 4700 2150 50  0001 C CNN
F 3 "" H 4700 2150 50  0001 C CNN
	1    4700 2150
	1    0    0    -1  
$EndComp
Text GLabel 5600 1650 1    50   Input ~ 0
CLOCK
Text GLabel 3400 1650 1    50   Input ~ 0
CLOCK
Wire Wire Line
	3500 1650 3600 1650
$Comp
L power:GND #PWR?
U 1 1 5F96FA46
P 3200 1650
AR Path="/5EC573DA/5F96FA46" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA46" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 3200 1400 50  0001 C CNN
F 1 "GND" H 3205 1477 50  0000 C CNN
F 2 "" H 3200 1650 50  0001 C CNN
F 3 "" H 3200 1650 50  0001 C CNN
	1    3200 1650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F96FA4C
P 3800 1600
AR Path="/5EC573DA/5F96FA4C" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA4C" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 3800 1350 50  0001 C CNN
F 1 "GND" H 3805 1427 50  0000 C CNN
F 2 "" H 3800 1600 50  0001 C CNN
F 3 "" H 3800 1600 50  0001 C CNN
	1    3800 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 1650 3600 1150
Wire Wire Line
	5800 1150 5800 1650
$Comp
L power:GND #PWR?
U 1 1 5F96FA8F
P 5100 2150
AR Path="/5EC573DA/5F96FA8F" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA8F" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 5100 1900 50  0001 C CNN
F 1 "GND" V 5105 2022 50  0000 R CNN
F 2 "" H 5100 2150 50  0001 C CNN
F 3 "" H 5100 2150 50  0001 C CNN
	1    5100 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F96FA9A
P 6000 1650
AR Path="/5EC573DA/5F96FA9A" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA9A" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 6000 1400 50  0001 C CNN
F 1 "GND" H 6005 1477 50  0000 C CNN
F 2 "" H 6000 1650 50  0001 C CNN
F 3 "" H 6000 1650 50  0001 C CNN
	1    6000 1650
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F96FAA0
P 6900 2150
AR Path="/5EC573DA/5F96FAA0" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FAA0" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 6900 2000 50  0001 C CNN
F 1 "+5V" V 6915 2278 50  0000 L CNN
F 2 "" H 6900 2150 50  0001 C CNN
F 3 "" H 6900 2150 50  0001 C CNN
	1    6900 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F96FAA6
P 5400 1650
AR Path="/5EC573DA/5F96FAA6" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FAA6" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 5400 1400 50  0001 C CNN
F 1 "GND" H 5405 1477 50  0000 C CNN
F 2 "" H 5400 1650 50  0001 C CNN
F 3 "" H 5400 1650 50  0001 C CNN
	1    5400 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 1650 5800 1650
Wire Wire Line
	6000 1650 6100 1650
$Comp
L power:GND #PWR?
U 1 1 5F9762E3
P 800 2150
AR Path="/5EC573DA/5F9762E3" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F9762E3" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 800 1900 50  0001 C CNN
F 1 "GND" V 805 2022 50  0000 R CNN
F 2 "" H 800 2150 50  0001 C CNN
F 3 "" H 800 2150 50  0001 C CNN
	1    800  2150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F97666F
P 2600 2150
AR Path="/5EC573DA/5F97666F" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F97666F" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 2600 2000 50  0001 C CNN
F 1 "+5V" V 2615 2278 50  0000 L CNN
F 2 "" H 2600 2150 50  0001 C CNN
F 3 "" H 2600 2150 50  0001 C CNN
	1    2600 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F996FBD
P 1700 1650
AR Path="/5EC573DA/5F996FBD" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F996FBD" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 1700 1400 50  0001 C CNN
F 1 "GND" V 1705 1522 50  0000 R CNN
F 2 "" H 1700 1650 50  0001 C CNN
F 3 "" H 1700 1650 50  0001 C CNN
	1    1700 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 1600 2300 1650
Wire Wire Line
	2100 1600 2100 1650
Wire Wire Line
	1400 1650 1500 1650
Text GLabel 1300 1650 1    50   Input ~ 0
CLOCK
NoConn ~ 2000 2650
NoConn ~ 4100 2650
NoConn ~ 4200 2650
Wire Wire Line
	7250 4950 7250 6100
Wire Wire Line
	6600 6100 6600 2650
Wire Wire Line
	7150 4950 7150 6150
Wire Wire Line
	6500 6150 6500 2650
Wire Wire Line
	6400 2650 6400 6200
Wire Wire Line
	6950 4950 6950 6250
Wire Wire Line
	6300 6250 6300 2650
Wire Wire Line
	7250 3950 7250 2950
Wire Wire Line
	7050 3950 7050 3050
Wire Wire Line
	9800 2650 9800 5900
Wire Wire Line
	9800 5900 7650 5900
Wire Wire Line
	9700 2650 9700 5950
Wire Wire Line
	9600 2650 9600 6000
Wire Wire Line
	9600 6000 7450 6000
Wire Wire Line
	9500 2650 9500 6050
Wire Wire Line
	9500 6050 7350 6050
Wire Wire Line
	4400 1650 4400 1500
Wire Wire Line
	4300 1650 4300 1500
Wire Wire Line
	6600 1650 6600 1500
Wire Wire Line
	6500 1650 6500 1500
Wire Wire Line
	6400 1650 6400 1500
Wire Wire Line
	6300 1650 6300 1500
Wire Wire Line
	4900 5900 7650 5900
Connection ~ 7650 5900
Wire Wire Line
	7650 5900 7650 4950
Wire Wire Line
	7550 5950 4800 5950
Connection ~ 7550 5950
Wire Wire Line
	7550 5950 7550 4950
Wire Wire Line
	4700 6000 7450 6000
Connection ~ 7450 6000
Wire Wire Line
	7450 6000 7450 4950
Wire Wire Line
	7350 6050 4600 6050
Connection ~ 7350 6050
Wire Wire Line
	7350 6050 7350 4950
Wire Wire Line
	7150 6150 6500 6150
Wire Wire Line
	7050 6200 7050 4950
Wire Wire Line
	6950 6250 6300 6250
Wire Wire Line
	6850 6300 6850 4950
Wire Wire Line
	4300 3050 7050 3050
Wire Wire Line
	7150 3000 4400 3000
Wire Wire Line
	7150 3000 7150 3950
Wire Wire Line
	4700 2900 7450 2900
Wire Wire Line
	7450 2900 7450 3950
Wire Wire Line
	7250 2950 4500 2950
Wire Wire Line
	7350 3950 7350 3550
$Comp
L power:+5V #PWR?
U 1 1 5FA1E152
P 6750 3950
AR Path="/5EC573DA/5FA1E152" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA1E152" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 6750 3800 50  0001 C CNN
F 1 "+5V" V 6765 4078 50  0000 L CNN
F 2 "" H 6750 3950 50  0001 C CNN
F 3 "" H 6750 3950 50  0001 C CNN
	1    6750 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3950 6850 3950
$Comp
L power:GND #PWR?
U 1 1 5FA36417
P 8050 4950
AR Path="/5EC573DA/5FA36417" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA36417" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 8050 4700 50  0001 C CNN
F 1 "GND" V 8055 4822 50  0000 R CNN
F 2 "" H 8050 4950 50  0001 C CNN
F 3 "" H 8050 4950 50  0001 C CNN
	1    8050 4950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA36B57
P 8500 2200
AR Path="/5EC573DA/5FA36B57" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA36B57" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 8500 1950 50  0001 C CNN
F 1 "GND" V 8505 2072 50  0000 R CNN
F 2 "" H 8500 2200 50  0001 C CNN
F 3 "" H 8500 2200 50  0001 C CNN
	1    8500 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FA37491
P 10100 2150
AR Path="/5EC573DA/5FA37491" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA37491" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 10100 2000 50  0001 C CNN
F 1 "+5V" V 10115 2278 50  0000 L CNN
F 2 "" H 10100 2150 50  0001 C CNN
F 3 "" H 10100 2150 50  0001 C CNN
	1    10100 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA4F6A6
P 9800 1600
AR Path="/5EC573DA/5FA4F6A6" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA4F6A6" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 9800 1350 50  0001 C CNN
F 1 "GND" V 9805 1472 50  0000 R CNN
F 2 "" H 9800 1600 50  0001 C CNN
F 3 "" H 9800 1600 50  0001 C CNN
	1    9800 1600
	-1   0    0    1   
$EndComp
NoConn ~ 9300 2650
$Comp
L power:+5V #PWR?
U 1 1 5FA53785
P 9300 1650
AR Path="/5EC573DA/5FA53785" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA53785" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 9300 1500 50  0001 C CNN
F 1 "+5V" V 9315 1778 50  0000 L CNN
F 2 "" H 9300 1650 50  0001 C CNN
F 3 "" H 9300 1650 50  0001 C CNN
	1    9300 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5950 9700 5950
Connection ~ 6600 6100
Wire Wire Line
	6600 6100 7250 6100
Connection ~ 6500 6150
Connection ~ 6400 6200
Wire Wire Line
	6400 6200 7050 6200
Connection ~ 6300 6250
Wire Wire Line
	4500 2950 2200 2950
Connection ~ 4500 2950
Wire Wire Line
	4700 2900 2300 2900
Connection ~ 4700 2900
Wire Wire Line
	4500 6100 6600 6100
Wire Wire Line
	6500 6150 4400 6150
Wire Wire Line
	4300 6200 6400 6200
Wire Wire Line
	6300 6250 4200 6250
Wire Wire Line
	4100 6300 6850 6300
Wire Wire Line
	4400 6150 4400 4950
Wire Wire Line
	4300 4950 4300 6200
Wire Wire Line
	4200 6250 4200 4950
$Comp
L power:+5V #PWR?
U 1 1 5FA1DAD5
P 4000 3950
AR Path="/5EC573DA/5FA1DAD5" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA1DAD5" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 4000 3800 50  0001 C CNN
F 1 "+5V" V 4015 4078 50  0000 L CNN
F 2 "" H 4000 3950 50  0001 C CNN
F 3 "" H 4000 3950 50  0001 C CNN
	1    4000 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3950 4300 3050
Wire Wire Line
	4400 3000 4400 3950
Wire Wire Line
	4500 2950 4500 3950
Wire Wire Line
	4700 3950 4700 2900
Wire Wire Line
	4100 4950 4100 6300
Wire Wire Line
	4900 4950 4900 5900
Wire Wire Line
	4800 4950 4800 5950
Wire Wire Line
	4700 4950 4700 6000
Wire Wire Line
	4600 4950 4600 6050
Wire Wire Line
	4500 4950 4500 6100
Wire Wire Line
	2300 2650 2300 2900
Wire Wire Line
	2200 2650 2200 2950
Wire Wire Line
	4300 2650 4400 2750
Wire Wire Line
	4400 2750 4400 3000
Connection ~ 4400 3000
Wire Wire Line
	4400 2650 4300 2750
Wire Wire Line
	4300 2750 4300 3050
Connection ~ 4300 3050
Wire Wire Line
	4000 3950 4100 3950
$Comp
L power:GND #PWR?
U 1 1 5FB90580
P 5300 4950
AR Path="/5EC573DA/5FB90580" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FB90580" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 5300 4700 50  0001 C CNN
F 1 "GND" V 5305 4822 50  0000 R CNN
F 2 "" H 5300 4950 50  0001 C CNN
F 3 "" H 5300 4950 50  0001 C CNN
	1    5300 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 3950 5300 3850
Wire Wire Line
	5000 4950 5000 5150
Wire Wire Line
	4600 3550 7350 3550
Wire Wire Line
	4600 3550 4600 3950
Connection ~ 5000 5150
Wire Wire Line
	5000 5150 5000 5600
$Comp
L Device:R R21
U 1 1 5FC780EA
P 5550 3850
F 0 "R21" V 5600 3700 50  0000 C CNN
F 1 "10k" V 5550 3850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5480 3850 50  0001 C CNN
F 3 "~" H 5550 3850 50  0001 C CNN
	1    5550 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R20
U 1 1 5FC780F0
P 5550 3750
F 0 "R20" V 5600 3600 50  0000 C CNN
F 1 "10k" V 5550 3750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5480 3750 50  0001 C CNN
F 3 "~" H 5550 3750 50  0001 C CNN
	1    5550 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 3850 5300 3850
Wire Wire Line
	5400 3750 5200 3750
Connection ~ 5200 3750
Wire Wire Line
	5200 3750 5200 3950
Wire Wire Line
	4100 6300 2100 6300
Connection ~ 4100 6300
Text Label 5300 2800 0    50   ~ 0
~IC
Connection ~ 5300 3850
Wire Wire Line
	2200 1650 2200 1600
Wire Wire Line
	2100 2650 2100 6300
NoConn ~ 4000 4950
NoConn ~ 6750 4950
$Comp
L power:GND #PWR?
U 1 1 5F030AD8
P 1100 1650
AR Path="/5EC573DA/5F030AD8" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F030AD8" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 1100 1400 50  0001 C CNN
F 1 "GND" H 1105 1477 50  0000 C CNN
F 2 "" H 1100 1650 50  0001 C CNN
F 3 "" H 1100 1650 50  0001 C CNN
	1    1100 1650
	-1   0    0    1   
$EndComp
Text Label 3600 1150 0    50   ~ 0
~II
Text Label 5200 2700 0    50   ~ 0
~II
$Comp
L power:GND #PWR048
U 1 1 5F0344C4
P 7550 3950
F 0 "#PWR048" H 7550 3700 50  0001 C CNN
F 1 "GND" H 7555 3777 50  0000 C CNN
F 2 "" H 7550 3950 50  0001 C CNN
F 3 "" H 7550 3950 50  0001 C CNN
	1    7550 3950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5F03518A
P 4800 3950
F 0 "#PWR039" H 4800 3700 50  0001 C CNN
F 1 "GND" H 4805 3777 50  0000 C CNN
F 2 "" H 4800 3950 50  0001 C CNN
F 3 "" H 4800 3950 50  0001 C CNN
	1    4800 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	3800 1600 3800 1650
Wire Wire Line
	1700 1650 1800 1650
Wire Wire Line
	3800 1650 3900 1650
$Comp
L 8-Bit~CPU~32k:74HC173 U7
U 1 1 5F10528C
P 1700 2150
F 0 "U7" V 1950 2900 50  0000 L CNN
F 1 "74HC173" V 1700 2050 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 1700 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 1700 2150 50  0001 C CNN
	1    1700 2150
	0    1    1    0   
$EndComp
Connection ~ 1700 1650
Connection ~ 1500 1650
$Comp
L 8-Bit~CPU~32k:74HC173 U8
U 1 1 5F107679
P 3800 2150
F 0 "U8" V 4050 2900 50  0000 L CNN
F 1 "74HC173" V 3800 2000 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 3800 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 3800 2150 50  0001 C CNN
	1    3800 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 1650 4200 1650
Connection ~ 3800 1650
Connection ~ 3600 1650
$Comp
L 8-Bit~CPU~32k:74HC173 U10
U 1 1 5F108392
P 6000 2150
F 0 "U10" V 6250 2900 50  0000 L CNN
F 1 "74HC173" V 6000 2050 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6000 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 6000 2150 50  0001 C CNN
	1    6000 2150
	0    1    1    0   
$EndComp
Connection ~ 6000 1650
Connection ~ 5800 1650
$Comp
L 8-Bit~CPU~32k:74HC161 U12
U 1 1 5F109570
P 9300 2150
F 0 "U12" V 9550 2800 50  0000 L CNN
F 1 "74HC161" V 9300 2050 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 9300 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 9300 2150 50  0001 C CNN
	1    9300 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	9200 1650 9300 1650
Connection ~ 9300 1650
Wire Wire Line
	9100 1650 9200 1650
Connection ~ 9200 1650
Wire Wire Line
	1800 1650 2000 1650
Connection ~ 1800 1650
Wire Wire Line
	3900 1650 4100 1650
Connection ~ 3900 1650
Connection ~ 4100 1650
Wire Wire Line
	9500 1650 9600 1650
Wire Wire Line
	9600 1650 9700 1650
Connection ~ 9600 1650
Wire Wire Line
	9700 1650 9800 1650
Connection ~ 9700 1650
Wire Wire Line
	9800 1650 9800 1600
Connection ~ 9800 1650
Wire Wire Line
	8500 2150 8500 2200
Wire Wire Line
	2900 2150 2900 2200
$Comp
L 8-Bit~CPU~32k:AT28C64B U9
U 1 1 5EFCD843
P 4700 4450
F 0 "U9" V 4350 3750 50  0000 R CNN
F 1 "AT28C64B" V 4700 4650 50  0000 R CNN
F 2 "" H 4700 4450 50  0001 C CNN
F 3 "" H 4700 4450 50  0001 C CNN
	1    4700 4450
	0    -1   -1   0   
$EndComp
Connection ~ 4000 3950
$Comp
L 8-Bit~CPU~32k:AT28C64B U11
U 1 1 5EFCFC1B
P 7450 4450
F 0 "U11" V 7150 3750 50  0000 R CNN
F 1 "AT28C64B" V 7450 4600 50  0000 R CNN
F 2 "" H 7450 4450 50  0001 C CNN
F 3 "" H 7450 4450 50  0001 C CNN
	1    7450 4450
	0    -1   -1   0   
$EndComp
Connection ~ 6750 3950
Text Label 8700 1650 0    50   ~ 0
~IC
Wire Wire Line
	650  5150 5000 5150
Wire Wire Line
	7350 2800 7350 1650
Wire Wire Line
	5300 3850 5300 2800
Wire Wire Line
	5300 2800 7350 2800
Wire Wire Line
	5200 4950 5200 5600
Wire Wire Line
	5100 4950 5100 5600
Wire Wire Line
	4900 3350 4900 3950
Wire Wire Line
	5000 3350 5000 3950
Wire Wire Line
	5100 3350 5100 3950
Wire Wire Line
	7950 4950 7950 5600
Wire Wire Line
	7850 4950 7850 5600
Wire Wire Line
	7750 4950 7750 5600
Wire Wire Line
	8050 3350 8050 3950
Wire Wire Line
	7950 3350 7950 3950
Wire Wire Line
	7850 3350 7850 3950
Wire Wire Line
	7750 3350 7750 3950
Wire Wire Line
	1500 1150 650  1150
Wire Wire Line
	1500 1150 1500 1650
Text Label 1500 1150 0    50   ~ 0
~FI
Wire Wire Line
	650  1150 650  5150
Wire Wire Line
	7650 3350 7650 3950
$Comp
L power:GND #PWR044
U 1 1 5F3F37F8
P 5700 3850
F 0 "#PWR044" H 5700 3600 50  0001 C CNN
F 1 "GND" V 5705 3722 50  0000 R CNN
F 2 "" H 5700 3850 50  0001 C CNN
F 3 "" H 5700 3850 50  0001 C CNN
	1    5700 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7350 1650 8800 1650
Wire Wire Line
	5200 2700 7250 2700
Wire Wire Line
	7250 2700 7250 1150
Wire Wire Line
	7250 1150 5800 1150
Wire Wire Line
	5200 2700 5200 3750
Connection ~ 5800 1150
Wire Wire Line
	3600 1150 5800 1150
Text Label 5800 1150 0    50   ~ 0
~II
$Comp
L power:+5V #PWR043
U 1 1 5F50EA19
P 5700 3750
F 0 "#PWR043" H 5700 3600 50  0001 C CNN
F 1 "+5V" V 5715 3878 50  0000 L CNN
F 2 "" H 5700 3750 50  0001 C CNN
F 3 "" H 5700 3750 50  0001 C CNN
	1    5700 3750
	0    1    1    0   
$EndComp
Text Label 5000 5150 0    50   ~ 0
~FI
Wire Wire Line
	7350 3350 7350 3550
Connection ~ 7350 3550
$EndSCHEMATC
