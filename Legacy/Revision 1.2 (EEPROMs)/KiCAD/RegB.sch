EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 9
Title "B Register"
Date "2020-12-16"
Rev "1.2"
Comp "by Carsten Herting (2020)"
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 4700 3300 0    50   Output ~ 0
R0
Text HLabel 4700 3400 0    50   Output ~ 0
R1
Text HLabel 4700 3500 0    50   Output ~ 0
R2
Text HLabel 4700 3600 0    50   Output ~ 0
R3
Text HLabel 4700 3700 0    50   Output ~ 0
R4
Text HLabel 4700 3800 0    50   Output ~ 0
R5
Text HLabel 4700 3900 0    50   Output ~ 0
R6
Text HLabel 4700 4000 0    50   Output ~ 0
R7
Text HLabel 6500 6350 3    50   BiDi ~ 0
BUS0
Text HLabel 6400 6350 3    50   BiDi ~ 0
BUS1
Text HLabel 6300 6350 3    50   BiDi ~ 0
BUS2
Text HLabel 6200 6350 3    50   BiDi ~ 0
BUS3
Text HLabel 6100 6350 3    50   BiDi ~ 0
BUS4
Text HLabel 6000 6350 3    50   BiDi ~ 0
BUS5
Text HLabel 5900 6350 3    50   BiDi ~ 0
BUS6
Text HLabel 5800 6350 3    50   BiDi ~ 0
BUS7
Text HLabel 2700 1300 0    50   Input ~ 0
~BI
$Comp
L 74xx:74HC245 U?
U 1 1 5F392B66
P 6000 4800
AR Path="/5EC573DA/5F392B66" Ref="U?"  Part="1" 
AR Path="/5EC5A568/5F392B66" Ref="U23"  Part="1" 
F 0 "U23" V 6100 4700 50  0000 L CNN
F 1 "74HC245" V 6000 4700 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6000 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 6000 4800 50  0001 C CNN
	1    6000 4800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F392B6C
P 2300 2450
AR Path="/5EC573DA/5F392B6C" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392B6C" Ref="#PWR083"  Part="1" 
F 0 "#PWR083" H 2300 2200 50  0001 C CNN
F 1 "GND" V 2305 2322 50  0000 R CNN
F 2 "" H 2300 2450 50  0001 C CNN
F 3 "" H 2300 2450 50  0001 C CNN
	1    2300 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F392B72
P 5200 4800
AR Path="/5EC573DA/5F392B72" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392B72" Ref="#PWR089"  Part="1" 
F 0 "#PWR089" H 5200 4550 50  0001 C CNN
F 1 "GND" V 5205 4672 50  0000 R CNN
F 2 "" H 5200 4800 50  0001 C CNN
F 3 "" H 5200 4800 50  0001 C CNN
	1    5200 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F392B78
P 6800 4800
AR Path="/5EC573DA/5F392B78" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392B78" Ref="#PWR095"  Part="1" 
F 0 "#PWR095" H 6800 4650 50  0001 C CNN
F 1 "+5V" V 6815 4928 50  0000 L CNN
F 2 "" H 6800 4800 50  0001 C CNN
F 3 "" H 6800 4800 50  0001 C CNN
	1    6800 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F392B7E
P 4100 2450
AR Path="/5EC573DA/5F392B7E" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392B7E" Ref="#PWR086"  Part="1" 
F 0 "#PWR086" H 4100 2300 50  0001 C CNN
F 1 "+5V" V 4115 2578 50  0000 L CNN
F 2 "" H 4100 2450 50  0001 C CNN
F 3 "" H 4100 2450 50  0001 C CNN
	1    4100 2450
	1    0    0    -1  
$EndComp
Text GLabel 5500 1950 1    50   Input ~ 0
CLOCK
Text GLabel 2800 1950 1    50   Input ~ 0
CLOCK
Wire Wire Line
	2900 1950 3000 1950
Wire Wire Line
	3200 1950 3300 1950
$Comp
L power:GND #PWR?
U 1 1 5F392B88
P 2600 1950
AR Path="/5EC573DA/5F392B88" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392B88" Ref="#PWR084"  Part="1" 
F 0 "#PWR084" H 2600 1700 50  0001 C CNN
F 1 "GND" H 2605 1777 50  0000 C CNN
F 2 "" H 2600 1950 50  0001 C CNN
F 3 "" H 2600 1950 50  0001 C CNN
	1    2600 1950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F392B8E
P 3200 1950
AR Path="/5EC573DA/5F392B8E" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392B8E" Ref="#PWR085"  Part="1" 
F 0 "#PWR085" H 3200 1700 50  0001 C CNN
F 1 "GND" H 3205 1777 50  0000 C CNN
F 2 "" H 3200 1950 50  0001 C CNN
F 3 "" H 3200 1950 50  0001 C CNN
	1    3200 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 1300 5700 1300
$Comp
L power:+5V #PWR?
U 1 1 5F392B9A
P 5600 4300
AR Path="/5EC573DA/5F392B9A" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392B9A" Ref="#PWR091"  Part="1" 
F 0 "#PWR091" H 5600 4150 50  0001 C CNN
F 1 "+5V" H 5700 4400 50  0000 C CNN
F 2 "" H 5600 4300 50  0001 C CNN
F 3 "" H 5600 4300 50  0001 C CNN
	1    5600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4300 5500 4300
Text HLabel 4700 4300 0    50   Input ~ 0
~BO
Wire Wire Line
	6400 4300 6400 3400
Wire Wire Line
	6200 4300 6200 3600
Wire Wire Line
	6100 4300 6100 3700
Wire Wire Line
	6100 2950 3800 2950
Wire Wire Line
	3700 2950 3700 3000
Wire Wire Line
	3700 3000 6000 3000
Wire Wire Line
	6000 3000 6000 3800
Wire Wire Line
	5900 4300 5900 3900
Wire Wire Line
	5900 3050 3600 3050
Wire Wire Line
	3600 3050 3600 2950
Wire Wire Line
	3500 2950 3500 3100
Wire Wire Line
	3500 3100 5800 3100
Wire Wire Line
	5800 3100 5800 4000
Wire Wire Line
	6400 5300 6400 5500
Wire Wire Line
	6300 5300 6300 5600
Wire Wire Line
	6200 5300 6200 5700
Wire Wire Line
	6100 5300 6100 5800
Wire Wire Line
	6000 5300 6000 5900
Wire Wire Line
	5900 5300 5900 6000
Wire Wire Line
	4700 3300 6500 3300
Connection ~ 6500 3300
Wire Wire Line
	6500 3300 6500 4300
Wire Wire Line
	4700 3400 6400 3400
Connection ~ 6400 3400
Wire Wire Line
	4700 3500 6300 3500
Connection ~ 6300 3500
Wire Wire Line
	6300 3500 6300 4300
Wire Wire Line
	4700 3600 6200 3600
Connection ~ 6200 3600
Wire Wire Line
	4700 3700 6100 3700
Connection ~ 6100 3700
Wire Wire Line
	6100 3700 6100 2950
Wire Wire Line
	4700 3800 6000 3800
Connection ~ 6000 3800
Wire Wire Line
	6000 3800 6000 4300
Wire Wire Line
	4700 3900 5900 3900
Connection ~ 5900 3900
Wire Wire Line
	5900 3900 5900 3050
Wire Wire Line
	4700 4000 5800 4000
Connection ~ 5800 4000
Wire Wire Line
	5800 4000 5800 4300
Wire Wire Line
	6500 5400 7150 5400
Connection ~ 6500 5400
Wire Wire Line
	6500 5400 6500 5300
Wire Wire Line
	6400 1400 7200 1400
Wire Wire Line
	7200 1400 7200 5500
Wire Wire Line
	7200 5500 6400 5500
Connection ~ 6400 5500
Wire Wire Line
	6300 5600 7250 5600
Wire Wire Line
	7250 5600 7250 1350
Wire Wire Line
	7250 1350 6300 1350
Connection ~ 6300 5600
Wire Wire Line
	6200 1300 7300 1300
Wire Wire Line
	7300 1300 7300 5700
Wire Wire Line
	7300 5700 6200 5700
Connection ~ 6200 5700
Wire Wire Line
	6100 5800 7350 5800
Wire Wire Line
	7350 5800 7350 1200
Wire Wire Line
	7350 1200 3800 1200
Wire Wire Line
	3800 1200 3800 1950
Connection ~ 6100 5800
Wire Wire Line
	3700 1950 3700 1150
Wire Wire Line
	3700 1150 7400 1150
Wire Wire Line
	7400 1150 7400 5900
Wire Wire Line
	7400 5900 6000 5900
Connection ~ 6000 5900
Wire Wire Line
	5900 6000 7450 6000
Wire Wire Line
	7450 6000 7450 1100
Wire Wire Line
	7450 1100 3600 1100
Wire Wire Line
	3600 1100 3600 1950
Connection ~ 5900 6000
Wire Wire Line
	3500 1950 3500 1050
Wire Wire Line
	3500 1050 7500 1050
Wire Wire Line
	7500 1050 7500 6100
Connection ~ 5800 6100
Wire Wire Line
	5800 6100 5800 5300
Wire Wire Line
	5800 6100 7500 6100
Wire Wire Line
	5800 6100 5800 6350
Wire Wire Line
	5900 6000 5900 6350
Wire Wire Line
	6000 5900 6000 6350
Wire Wire Line
	6100 5800 6100 6350
Wire Wire Line
	6200 5700 6200 6350
Wire Wire Line
	6300 5600 6300 6350
Wire Wire Line
	6400 5500 6400 6350
Wire Wire Line
	6500 5400 6500 6350
Wire Wire Line
	5700 1300 5700 1950
$Comp
L power:GND #PWR?
U 1 1 5F392BF9
P 5000 2450
AR Path="/5EC573DA/5F392BF9" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392BF9" Ref="#PWR088"  Part="1" 
F 0 "#PWR088" H 5000 2200 50  0001 C CNN
F 1 "GND" V 5005 2322 50  0000 R CNN
F 2 "" H 5000 2450 50  0001 C CNN
F 3 "" H 5000 2450 50  0001 C CNN
	1    5000 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3600 6200 2950
Wire Wire Line
	6300 2950 6300 3500
Wire Wire Line
	6400 3400 6400 2950
Wire Wire Line
	6500 2950 6500 3300
$Comp
L power:GND #PWR?
U 1 1 5F392C04
P 5900 1950
AR Path="/5EC573DA/5F392C04" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392C04" Ref="#PWR092"  Part="1" 
F 0 "#PWR092" H 5900 1700 50  0001 C CNN
F 1 "GND" H 5905 1777 50  0000 C CNN
F 2 "" H 5900 1950 50  0001 C CNN
F 3 "" H 5900 1950 50  0001 C CNN
	1    5900 1950
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F392C0A
P 6800 2450
AR Path="/5EC573DA/5F392C0A" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392C0A" Ref="#PWR093"  Part="1" 
F 0 "#PWR093" H 6800 2300 50  0001 C CNN
F 1 "+5V" V 6815 2578 50  0000 L CNN
F 2 "" H 6800 2450 50  0001 C CNN
F 3 "" H 6800 2450 50  0001 C CNN
	1    6800 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F392C10
P 5300 1950
AR Path="/5EC573DA/5F392C10" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F392C10" Ref="#PWR090"  Part="1" 
F 0 "#PWR090" H 5300 1700 50  0001 C CNN
F 1 "GND" H 5305 1777 50  0000 C CNN
F 2 "" H 5300 1950 50  0001 C CNN
F 3 "" H 5300 1950 50  0001 C CNN
	1    5300 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	6400 1950 6400 1400
Wire Wire Line
	6300 1350 6300 1950
Wire Wire Line
	6200 1950 6200 1300
Wire Wire Line
	5600 1950 5700 1950
Wire Wire Line
	5900 1950 6000 1950
Wire Wire Line
	6500 1950 6500 1450
Wire Wire Line
	6500 1450 7150 1450
Wire Wire Line
	7150 1450 7150 5400
$Comp
L 8-Bit~CPU~32k:74HC173 U10
U 1 1 60C71C05
P 3200 2450
F 0 "U10" V 3350 2250 50  0000 L CNN
F 1 "74HC173" V 3200 2250 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 3200 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 3200 2450 50  0001 C CNN
	1    3200 2450
	0    1    1    0   
$EndComp
Connection ~ 3200 1950
Connection ~ 3000 1950
$Comp
L 8-Bit~CPU~32k:74HC173 U17
U 1 1 60C72ED2
P 5900 2450
F 0 "U17" V 6000 2350 50  0000 L CNN
F 1 "74HC173" V 5900 2300 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 5900 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 5900 2450 50  0001 C CNN
	1    5900 2450
	0    1    1    0   
$EndComp
Connection ~ 5900 1950
Connection ~ 5700 1950
Wire Wire Line
	2700 1300 3000 1300
Connection ~ 3000 1300
Wire Wire Line
	3000 1300 3000 1950
$Comp
L Device:C_Small C?
U 1 1 5F573FE4
P 6800 4900
AR Path="/5F645851/5F573FE4" Ref="C?"  Part="1" 
AR Path="/5EC5A568/5F573FE4" Ref="C21"  Part="1" 
F 0 "C21" H 6892 4946 50  0000 L CNN
F 1 "100nF" H 6892 4855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6800 4900 50  0001 C CNN
F 3 "~" H 6800 4900 50  0001 C CNN
	1    6800 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F573FEA
P 6800 5000
AR Path="/5F645851/5F573FEA" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F573FEA" Ref="#PWR096"  Part="1" 
F 0 "#PWR096" H 6800 4750 50  0001 C CNN
F 1 "GND" H 6805 4827 50  0000 C CNN
F 2 "" H 6800 5000 50  0001 C CNN
F 3 "" H 6800 5000 50  0001 C CNN
	1    6800 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F576AAA
P 6800 2550
AR Path="/5F645851/5F576AAA" Ref="C?"  Part="1" 
AR Path="/5EC5A568/5F576AAA" Ref="C20"  Part="1" 
F 0 "C20" H 6892 2596 50  0000 L CNN
F 1 "100nF" H 6892 2505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6800 2550 50  0001 C CNN
F 3 "~" H 6800 2550 50  0001 C CNN
	1    6800 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F576AB0
P 6800 2650
AR Path="/5F645851/5F576AB0" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F576AB0" Ref="#PWR094"  Part="1" 
F 0 "#PWR094" H 6800 2400 50  0001 C CNN
F 1 "GND" H 6805 2477 50  0000 C CNN
F 2 "" H 6800 2650 50  0001 C CNN
F 3 "" H 6800 2650 50  0001 C CNN
	1    6800 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5792B6
P 4100 2550
AR Path="/5F645851/5F5792B6" Ref="C?"  Part="1" 
AR Path="/5EC5A568/5F5792B6" Ref="C19"  Part="1" 
F 0 "C19" H 4192 2596 50  0000 L CNN
F 1 "100nF" H 4192 2505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4100 2550 50  0001 C CNN
F 3 "~" H 4100 2550 50  0001 C CNN
	1    4100 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5792BC
P 4100 2650
AR Path="/5F645851/5F5792BC" Ref="#PWR?"  Part="1" 
AR Path="/5EC5A568/5F5792BC" Ref="#PWR087"  Part="1" 
F 0 "#PWR087" H 4100 2400 50  0001 C CNN
F 1 "GND" H 4105 2477 50  0000 C CNN
F 2 "" H 4100 2650 50  0001 C CNN
F 3 "" H 4100 2650 50  0001 C CNN
	1    4100 2650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
