EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 9
Title "Arithmetic and Logic Unit"
Date "2020-12-16"
Rev "1.2"
Comp "by Carsten Herting (2020)"
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 5800 6750 3    50   Output ~ 0
BUS0
Text HLabel 5700 6750 3    50   Output ~ 0
BUS1
Text HLabel 5600 6750 3    50   Output ~ 0
BUS2
Text HLabel 5500 6750 3    50   Output ~ 0
BUS3
Text HLabel 5400 6750 3    50   Output ~ 0
BUS4
Text HLabel 5300 6750 3    50   Output ~ 0
BUS5
Text HLabel 5200 6750 3    50   Output ~ 0
BUS6
Text HLabel 5100 6750 3    50   Output ~ 0
BUS7
Text HLabel 5600 3050 1    50   Input ~ 0
A0
Text HLabel 5500 3050 1    50   Input ~ 0
A1
Text HLabel 5400 3050 1    50   Input ~ 0
A2
Text HLabel 5300 3050 1    50   Input ~ 0
A3
Text HLabel 3500 3050 1    50   Input ~ 0
A4
Text HLabel 3400 3050 1    50   Input ~ 0
A5
Text HLabel 3300 3050 1    50   Input ~ 0
A6
Text HLabel 3200 3050 1    50   Input ~ 0
A7
Text HLabel 6050 1950 2    50   Input ~ 0
B0
Text HLabel 6050 1600 2    50   Input ~ 0
B1
Text HLabel 6050 1250 2    50   Input ~ 0
B2
Text HLabel 6050 900  2    50   Input ~ 0
B3
Text HLabel 3850 1900 2    50   Input ~ 0
B4
Text HLabel 3850 1550 2    50   Input ~ 0
B5
Text HLabel 3850 1200 2    50   Input ~ 0
B6
Text HLabel 3850 850  2    50   Input ~ 0
B7
Text HLabel 4800 6850 3    50   Input ~ 0
~EO
Text HLabel 6650 2150 2    50   Input ~ 0
ES
Text HLabel 5800 3050 1    50   Input ~ 0
EC
Text HLabel 9400 4850 2    50   Output ~ 0
FLAG_Z
Text HLabel 3400 4550 3    50   Output ~ 0
FLAG_N
$Comp
L 74xx:74HC245 U15
U 1 1 5F7F7837
P 5300 6200
F 0 "U15" V 5300 5900 50  0000 L CNN
F 1 "74HC245" V 5300 6100 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 5300 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 5300 6200 50  0001 C CNN
	1    5300 6200
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR069
U 1 1 5F7FBFF7
P 4900 6750
F 0 "#PWR069" H 4900 6500 50  0001 C CNN
F 1 "GND" V 4900 6550 50  0000 C CNN
F 2 "" H 4900 6750 50  0001 C CNN
F 3 "" H 4900 6750 50  0001 C CNN
	1    4900 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR067
U 1 1 5F7FC568
P 4500 3650
F 0 "#PWR067" H 4500 3400 50  0001 C CNN
F 1 "GND" H 4505 3477 50  0000 C CNN
F 2 "" H 4500 3650 50  0001 C CNN
F 3 "" H 4500 3650 50  0001 C CNN
	1    4500 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR064
U 1 1 5F7FCBA0
P 2400 3650
F 0 "#PWR064" H 2400 3400 50  0001 C CNN
F 1 "GND" H 2405 3477 50  0000 C CNN
F 2 "" H 2400 3650 50  0001 C CNN
F 3 "" H 2400 3650 50  0001 C CNN
	1    2400 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR068
U 1 1 5F7FCFBC
P 4500 6200
F 0 "#PWR068" H 4500 5950 50  0001 C CNN
F 1 "GND" H 4505 6027 50  0000 C CNN
F 2 "" H 4500 6200 50  0001 C CNN
F 3 "" H 4500 6200 50  0001 C CNN
	1    4500 6200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR065
U 1 1 5F7FD37A
P 4000 3650
F 0 "#PWR065" H 4000 3500 50  0001 C CNN
F 1 "+5V" H 4015 3823 50  0000 C CNN
F 2 "" H 4000 3650 50  0001 C CNN
F 3 "" H 4000 3650 50  0001 C CNN
	1    4000 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR070
U 1 1 5F7FDC57
P 6100 3650
F 0 "#PWR070" H 6100 3500 50  0001 C CNN
F 1 "+5V" H 6115 3823 50  0000 C CNN
F 2 "" H 6100 3650 50  0001 C CNN
F 3 "" H 6100 3650 50  0001 C CNN
	1    6100 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR072
U 1 1 5F7FE169
P 6100 6200
F 0 "#PWR072" H 6100 6050 50  0001 C CNN
F 1 "+5V" H 6115 6373 50  0000 C CNN
F 2 "" H 6100 6200 50  0001 C CNN
F 3 "" H 6100 6200 50  0001 C CNN
	1    6100 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 5700 5800 4150
Wire Wire Line
	5400 4250 3700 4250
Wire Wire Line
	3700 4250 3700 4150
Wire Wire Line
	3600 4150 3600 4300
Wire Wire Line
	3600 4300 5300 4300
Wire Wire Line
	5200 4350 3500 4350
Wire Wire Line
	3500 4350 3500 4150
Wire Wire Line
	3400 4150 3400 4400
Wire Wire Line
	3400 4400 5100 4400
Wire Wire Line
	5300 4150 4250 4150
Wire Wire Line
	4250 4150 4250 3150
Wire Wire Line
	4250 3150 3700 3150
Wire Wire Line
	5600 3150 5600 3050
Wire Wire Line
	5500 3150 5500 3050
Wire Wire Line
	5400 3050 5400 3150
Wire Wire Line
	5300 3150 5300 3050
Wire Wire Line
	3500 3050 3500 3150
Wire Wire Line
	3400 3150 3400 3050
Wire Wire Line
	3300 3050 3300 3150
Wire Wire Line
	3200 3150 3200 3050
Text HLabel 3200 4550 3    50   Output ~ 0
FLAG_C
Wire Wire Line
	3400 4550 3400 4400
Connection ~ 3400 4400
Wire Wire Line
	3200 4150 3200 4550
Wire Wire Line
	5800 6750 5800 6700
Wire Wire Line
	5700 6700 5700 6750
Wire Wire Line
	5600 6750 5600 6700
Wire Wire Line
	5500 6700 5500 6750
Wire Wire Line
	5400 6750 5400 6700
Wire Wire Line
	5300 6700 5300 6750
Wire Wire Line
	5200 6750 5200 6700
Wire Wire Line
	5100 6700 5100 6750
$Comp
L 74xx:74HC86 U12
U 1 1 5F82176D
P 3550 950
F 0 "U12" H 3550 900 50  0000 C CNN
F 1 "74HC86" H 3600 1000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3550 950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 3550 950 50  0001 C CNN
	1    3550 950 
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC86 U12
U 2 1 5F825276
P 3550 1300
F 0 "U12" H 3550 1250 50  0000 C CNN
F 1 "74HC86" H 3600 1350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3550 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 3550 1300 50  0001 C CNN
	2    3550 1300
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC86 U12
U 3 1 5F8270A9
P 3550 1650
F 0 "U12" H 3550 1600 50  0000 C CNN
F 1 "74HC86" H 3600 1700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3550 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 3550 1650 50  0001 C CNN
	3    3550 1650
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC86 U12
U 4 1 5F828D45
P 3550 2000
F 0 "U12" H 3550 1950 50  0000 C CNN
F 1 "74HC86" H 3550 2050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3550 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 3550 2000 50  0001 C CNN
	4    3550 2000
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC86 U16
U 1 1 5F847955
P 5750 1000
F 0 "U16" H 5750 950 50  0000 C CNN
F 1 "74HC86" H 5750 1050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5750 1000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 5750 1000 50  0001 C CNN
	1    5750 1000
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC86 U16
U 2 1 5F848A59
P 5750 1350
F 0 "U16" H 5750 1300 50  0000 C CNN
F 1 "74HC86" H 5750 1400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5750 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 5750 1350 50  0001 C CNN
	2    5750 1350
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC86 U16
U 3 1 5F849CE8
P 5750 1700
F 0 "U16" H 5750 1650 50  0000 C CNN
F 1 "74HC86" H 5750 1750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5750 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 5750 1700 50  0001 C CNN
	3    5750 1700
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC86 U16
U 4 1 5F84AD01
P 5750 2050
F 0 "U16" H 5750 2000 50  0000 C CNN
F 1 "74HC86" H 5750 2100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5750 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 5750 2050 50  0001 C CNN
	4    5750 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	5450 2050 5100 2050
Wire Wire Line
	5100 2050 5100 3150
Wire Wire Line
	5000 1700 5450 1700
Wire Wire Line
	5450 1350 4900 1350
Wire Wire Line
	4800 1000 5450 1000
Wire Wire Line
	3250 2000 3000 2000
Wire Wire Line
	3250 1650 2900 1650
Wire Wire Line
	3250 1300 2800 1300
Wire Wire Line
	3250 950  2700 950 
Wire Wire Line
	3850 1050 4150 1050
Wire Wire Line
	4150 1050 4150 1400
Wire Wire Line
	4150 1400 3850 1400
Wire Wire Line
	4150 1400 4150 1750
Wire Wire Line
	4150 1750 3850 1750
Connection ~ 4150 1400
Wire Wire Line
	4150 1750 4150 2100
Wire Wire Line
	4150 2100 3850 2100
Connection ~ 4150 1750
Wire Wire Line
	6050 1100 6350 1100
Wire Wire Line
	6350 1100 6350 1450
Wire Wire Line
	6350 1450 6050 1450
Wire Wire Line
	6350 1450 6350 1800
Wire Wire Line
	6350 1800 6050 1800
Connection ~ 6350 1450
Wire Wire Line
	6350 2150 6050 2150
Connection ~ 6350 1800
Wire Wire Line
	4150 1050 4150 650 
Wire Wire Line
	4150 650  6350 650 
Wire Wire Line
	6350 650  6350 1100
Connection ~ 4150 1050
Connection ~ 6350 1100
Wire Wire Line
	6350 2150 6650 2150
Connection ~ 6350 2150
Wire Wire Line
	4800 6850 4800 6700
Wire Wire Line
	5800 3050 5800 3150
$Comp
L 74xx:74HC02 U18
U 1 1 5F894273
P 7350 4250
F 0 "U18" H 7350 4300 50  0000 C CNN
F 1 "74HC02" H 7350 4200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7350 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc02" H 7350 4250 50  0001 C CNN
	1    7350 4250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC02 U18
U 2 1 5F89AC24
P 7350 4650
F 0 "U18" H 7350 4700 50  0000 C CNN
F 1 "74HC02" H 7350 4600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7350 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc02" H 7350 4650 50  0001 C CNN
	2    7350 4650
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC02 U18
U 3 1 5F89D0E7
P 7350 5050
F 0 "U18" H 7350 5100 50  0000 C CNN
F 1 "74HC02" H 7350 5000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7350 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc02" H 7350 5050 50  0001 C CNN
	3    7350 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC02 U18
U 4 1 5F89EEB6
P 7350 5450
F 0 "U18" H 7350 5500 50  0000 C CNN
F 1 "74HC02" H 7350 5400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7350 5450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc02" H 7350 5450 50  0001 C CNN
	4    7350 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 4150 5700 4350
Wire Wire Line
	5600 4150 5600 4550
Wire Wire Line
	5500 4150 5500 4750
Wire Wire Line
	5400 4250 5400 4950
Wire Wire Line
	5300 4300 5300 5150
Wire Wire Line
	5200 4350 5200 5350
Wire Wire Line
	5100 4400 5100 5550
Wire Wire Line
	5800 4150 7050 4150
Wire Wire Line
	5700 4350 7050 4350
Connection ~ 5700 4350
Wire Wire Line
	5700 4350 5700 5700
Wire Wire Line
	5600 4550 7050 4550
Connection ~ 5600 4550
Wire Wire Line
	5600 4550 5600 5700
Wire Wire Line
	7050 4750 5500 4750
Connection ~ 5500 4750
Wire Wire Line
	5500 4750 5500 5700
Wire Wire Line
	7050 4950 5400 4950
Connection ~ 5400 4950
Wire Wire Line
	5400 4950 5400 5700
Wire Wire Line
	7050 5150 5300 5150
Connection ~ 5300 5150
Wire Wire Line
	5300 5150 5300 5700
Wire Wire Line
	7050 5350 5200 5350
Connection ~ 5200 5350
Wire Wire Line
	5200 5350 5200 5700
Wire Wire Line
	7050 5550 5100 5550
Connection ~ 5100 5550
Wire Wire Line
	5100 5550 5100 5700
Wire Wire Line
	7650 4250 7800 4250
Wire Wire Line
	7800 4250 7800 4350
Wire Wire Line
	7800 4350 8000 4350
Wire Wire Line
	8000 4550 7800 4550
Wire Wire Line
	7800 4550 7800 4650
Wire Wire Line
	7800 4650 7650 4650
Wire Wire Line
	7650 5050 7800 5050
Wire Wire Line
	7800 5050 7800 5150
Wire Wire Line
	7800 5150 8000 5150
Wire Wire Line
	7650 5450 7800 5450
Wire Wire Line
	7800 5450 7800 5350
Wire Wire Line
	7800 5350 8000 5350
Wire Wire Line
	8600 4450 8700 4450
Wire Wire Line
	8700 4450 8700 4750
Wire Wire Line
	8700 4750 8800 4750
Wire Wire Line
	8600 5250 8700 5250
Wire Wire Line
	8700 5250 8700 4950
Wire Wire Line
	8700 4950 8800 4950
$Comp
L 8-Bit~CPU~32k:74HC283 U14
U 1 1 60C784DD
P 5300 3650
F 0 "U14" V 5300 3850 50  0000 L CNN
F 1 "74HC283" V 5300 3450 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 5300 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS283" H 5300 3650 50  0001 C CNN
	1    5300 3650
	0    1    1    0   
$EndComp
Connection ~ 5800 4150
$Comp
L 8-Bit~CPU~32k:74HC283 U13
U 1 1 60C7A01A
P 3200 3650
F 0 "U13" V 3200 3850 50  0000 L CNN
F 1 "74HC283" V 3200 3350 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 3200 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS283" H 3200 3650 50  0001 C CNN
	1    3200 3650
	0    1    1    0   
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC08 U19
U 1 1 60CE3DDE
P 8300 4450
F 0 "U19" H 8300 4500 50  0000 C CNN
F 1 "74HC08" H 8300 4400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8300 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8300 4450 50  0001 C CNN
	1    8300 4450
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC08 U19
U 4 1 60CE701A
P 8300 5250
F 0 "U19" H 8300 5300 50  0000 C CNN
F 1 "74HC08" H 8300 5200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8300 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8300 5250 50  0001 C CNN
	4    8300 5250
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC08 U19
U 2 1 60CE9E9D
P 9100 4850
F 0 "U19" H 9100 4900 50  0000 C CNN
F 1 "74HC08" H 9100 4800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9100 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 9100 4850 50  0001 C CNN
	2    9100 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1700 5000 3150
Wire Wire Line
	4900 1350 4900 3150
Wire Wire Line
	4800 1000 4800 3150
Wire Wire Line
	3000 2000 3000 3150
Wire Wire Line
	2900 1650 2900 3150
Wire Wire Line
	2800 1300 2800 3150
Wire Wire Line
	2700 950  2700 3150
Wire Wire Line
	6350 1800 6350 2150
Wire Wire Line
	4900 6750 4900 6700
$Comp
L Device:C_Small C?
U 1 1 5F51B33A
P 6100 3750
AR Path="/5F645851/5F51B33A" Ref="C?"  Part="1" 
AR Path="/5EC57909/5F51B33A" Ref="C14"  Part="1" 
F 0 "C14" H 6192 3796 50  0000 L CNN
F 1 "100nF" H 6192 3705 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6100 3750 50  0001 C CNN
F 3 "~" H 6100 3750 50  0001 C CNN
	1    6100 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F51B340
P 6100 3850
AR Path="/5F645851/5F51B340" Ref="#PWR?"  Part="1" 
AR Path="/5EC57909/5F51B340" Ref="#PWR071"  Part="1" 
F 0 "#PWR071" H 6100 3600 50  0001 C CNN
F 1 "GND" H 6105 3677 50  0000 C CNN
F 2 "" H 6100 3850 50  0001 C CNN
F 3 "" H 6100 3850 50  0001 C CNN
	1    6100 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F51F131
P 4000 3750
AR Path="/5F645851/5F51F131" Ref="C?"  Part="1" 
AR Path="/5EC57909/5F51F131" Ref="C13"  Part="1" 
F 0 "C13" H 4092 3796 50  0000 L CNN
F 1 "100nF" H 4092 3705 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4000 3750 50  0001 C CNN
F 3 "~" H 4000 3750 50  0001 C CNN
	1    4000 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F51F137
P 4000 3850
AR Path="/5F645851/5F51F137" Ref="#PWR?"  Part="1" 
AR Path="/5EC57909/5F51F137" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H 4000 3600 50  0001 C CNN
F 1 "GND" H 4005 3677 50  0000 C CNN
F 2 "" H 4000 3850 50  0001 C CNN
F 3 "" H 4000 3850 50  0001 C CNN
	1    4000 3850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC86 U12
U 5 1 5F5229C8
P 1850 1450
F 0 "U12" V 1483 1450 50  0000 C CNN
F 1 "74HC86" V 1574 1450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1850 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 1850 1450 50  0001 C CNN
	5    1850 1450
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC86 U16
U 5 1 5F523D3A
P 7050 1450
F 0 "U16" V 6683 1450 50  0000 C CNN
F 1 "74HC86" V 6774 1450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7050 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 7050 1450 50  0001 C CNN
	5    7050 1450
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC86 U18
U 5 1 5F524F7D
P 7500 3550
F 0 "U18" V 7133 3550 50  0000 C CNN
F 1 "74HC02" V 7224 3550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7500 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 7500 3550 50  0001 C CNN
	5    7500 3550
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC86 U19
U 5 1 5F525E11
P 9600 4100
F 0 "U19" V 9233 4100 50  0000 C CNN
F 1 "74HC08" V 9324 4100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9600 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC86" H 9600 4100 50  0001 C CNN
	5    9600 4100
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F529095
P 8000 3650
AR Path="/5F645851/5F529095" Ref="C?"  Part="1" 
AR Path="/5EC57909/5F529095" Ref="C17"  Part="1" 
F 0 "C17" H 8092 3696 50  0000 L CNN
F 1 "100nF" H 8092 3605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8000 3650 50  0001 C CNN
F 3 "~" H 8000 3650 50  0001 C CNN
	1    8000 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F52909B
P 8000 3750
AR Path="/5F645851/5F52909B" Ref="#PWR?"  Part="1" 
AR Path="/5EC57909/5F52909B" Ref="#PWR079"  Part="1" 
F 0 "#PWR079" H 8000 3500 50  0001 C CNN
F 1 "GND" H 8005 3577 50  0000 C CNN
F 2 "" H 8000 3750 50  0001 C CNN
F 3 "" H 8000 3750 50  0001 C CNN
	1    8000 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F52D008
P 7550 1550
AR Path="/5F645851/5F52D008" Ref="C?"  Part="1" 
AR Path="/5EC57909/5F52D008" Ref="C16"  Part="1" 
F 0 "C16" H 7642 1596 50  0000 L CNN
F 1 "100nF" H 7642 1505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7550 1550 50  0001 C CNN
F 3 "~" H 7550 1550 50  0001 C CNN
	1    7550 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F52D00E
P 7550 1650
AR Path="/5F645851/5F52D00E" Ref="#PWR?"  Part="1" 
AR Path="/5EC57909/5F52D00E" Ref="#PWR077"  Part="1" 
F 0 "#PWR077" H 7550 1400 50  0001 C CNN
F 1 "GND" H 7555 1477 50  0000 C CNN
F 2 "" H 7550 1650 50  0001 C CNN
F 3 "" H 7550 1650 50  0001 C CNN
	1    7550 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5310F3
P 10100 4200
AR Path="/5F645851/5F5310F3" Ref="C?"  Part="1" 
AR Path="/5EC57909/5F5310F3" Ref="C18"  Part="1" 
F 0 "C18" H 10200 4200 50  0000 L CNN
F 1 "100nF" H 10150 4300 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10100 4200 50  0001 C CNN
F 3 "~" H 10100 4200 50  0001 C CNN
	1    10100 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5310F9
P 10100 4300
AR Path="/5F645851/5F5310F9" Ref="#PWR?"  Part="1" 
AR Path="/5EC57909/5F5310F9" Ref="#PWR082"  Part="1" 
F 0 "#PWR082" H 10100 4050 50  0001 C CNN
F 1 "GND" H 10105 4127 50  0000 C CNN
F 2 "" H 10100 4300 50  0001 C CNN
F 3 "" H 10100 4300 50  0001 C CNN
	1    10100 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F535280
P 2350 1550
AR Path="/5F645851/5F535280" Ref="C?"  Part="1" 
AR Path="/5EC57909/5F535280" Ref="C12"  Part="1" 
F 0 "C12" H 2442 1596 50  0000 L CNN
F 1 "100nF" H 2442 1505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2350 1550 50  0001 C CNN
F 3 "~" H 2350 1550 50  0001 C CNN
	1    2350 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F535286
P 2350 1650
AR Path="/5F645851/5F535286" Ref="#PWR?"  Part="1" 
AR Path="/5EC57909/5F535286" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H 2350 1400 50  0001 C CNN
F 1 "GND" H 2355 1477 50  0000 C CNN
F 2 "" H 2350 1650 50  0001 C CNN
F 3 "" H 2350 1650 50  0001 C CNN
	1    2350 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR061
U 1 1 5F538161
P 1350 1450
F 0 "#PWR061" H 1350 1200 50  0001 C CNN
F 1 "GND" H 1355 1277 50  0000 C CNN
F 2 "" H 1350 1450 50  0001 C CNN
F 3 "" H 1350 1450 50  0001 C CNN
	1    1350 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR074
U 1 1 5F5384E9
P 6550 1450
F 0 "#PWR074" H 6550 1200 50  0001 C CNN
F 1 "GND" H 6555 1277 50  0000 C CNN
F 2 "" H 6550 1450 50  0001 C CNN
F 3 "" H 6550 1450 50  0001 C CNN
	1    6550 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR075
U 1 1 5F5388B6
P 7000 3550
F 0 "#PWR075" H 7000 3300 50  0001 C CNN
F 1 "GND" H 7005 3377 50  0000 C CNN
F 2 "" H 7000 3550 50  0001 C CNN
F 3 "" H 7000 3550 50  0001 C CNN
	1    7000 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR080
U 1 1 5F538BC0
P 9100 4100
F 0 "#PWR080" H 9100 3850 50  0001 C CNN
F 1 "GND" H 9105 3927 50  0000 C CNN
F 2 "" H 9100 4100 50  0001 C CNN
F 3 "" H 9100 4100 50  0001 C CNN
	1    9100 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR078
U 1 1 5F538FD9
P 8000 3550
F 0 "#PWR078" H 8000 3400 50  0001 C CNN
F 1 "+5V" H 8015 3723 50  0000 C CNN
F 2 "" H 8000 3550 50  0001 C CNN
F 3 "" H 8000 3550 50  0001 C CNN
	1    8000 3550
	1    0    0    -1  
$EndComp
Connection ~ 8000 3550
$Comp
L power:+5V #PWR076
U 1 1 5F5394E7
P 7550 1450
F 0 "#PWR076" H 7550 1300 50  0001 C CNN
F 1 "+5V" H 7565 1623 50  0000 C CNN
F 2 "" H 7550 1450 50  0001 C CNN
F 3 "" H 7550 1450 50  0001 C CNN
	1    7550 1450
	1    0    0    -1  
$EndComp
Connection ~ 7550 1450
$Comp
L power:+5V #PWR081
U 1 1 5F53992E
P 10100 4100
F 0 "#PWR081" H 10100 3950 50  0001 C CNN
F 1 "+5V" H 10115 4273 50  0000 C CNN
F 2 "" H 10100 4100 50  0001 C CNN
F 3 "" H 10100 4100 50  0001 C CNN
	1    10100 4100
	1    0    0    -1  
$EndComp
Connection ~ 10100 4100
$Comp
L power:+5V #PWR062
U 1 1 5F539E97
P 2350 1450
F 0 "#PWR062" H 2350 1300 50  0001 C CNN
F 1 "+5V" H 2365 1623 50  0000 C CNN
F 2 "" H 2350 1450 50  0001 C CNN
F 3 "" H 2350 1450 50  0001 C CNN
	1    2350 1450
	1    0    0    -1  
$EndComp
Connection ~ 2350 1450
Text Notes 5950 6400 0    50   Italic 0
C=100nF intentionally\nleft out due to layout.
$EndSCHEMATC
