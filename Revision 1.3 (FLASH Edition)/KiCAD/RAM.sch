EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 9
Title "RAM, ROM and MAR"
Date "2021-03-10"
Rev "1.3.2"
Comp ""
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 4950 3850 0    50   Input ~ 0
~RO
Text HLabel 1150 1100 0    50   Input ~ 0
MI
Text HLabel 1150 1850 0    50   Input ~ 0
ME
Text HLabel 1150 1400 0    50   Input ~ 0
HI
Text HLabel 10350 6050 3    50   BiDi ~ 0
BUS3
Text HLabel 10450 6050 3    50   BiDi ~ 0
BUS4
Text HLabel 10550 6050 3    50   BiDi ~ 0
BUS5
Text HLabel 10650 6050 3    50   BiDi ~ 0
BUS6
Text HLabel 10750 6050 3    50   BiDi ~ 0
BUS7
Text GLabel 8550 2200 1    50   Input ~ 0
CLOCK
$Comp
L power:+5V #PWR?
U 1 1 5EFDEA03
P 7350 2700
AR Path="/5EC5738F/5EFDEA03" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA03" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 7350 2550 50  0001 C CNN
F 1 "+5V" H 7365 2873 50  0000 C CNN
F 2 "" H 7350 2700 50  0001 C CNN
F 3 "" H 7350 2700 50  0001 C CNN
	1    7350 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFDEA09
P 5750 2700
AR Path="/5EC5738F/5EFDEA09" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA09" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 5750 2450 50  0001 C CNN
F 1 "GND" H 5755 2527 50  0000 C CNN
F 2 "" H 5750 2700 50  0001 C CNN
F 3 "" H 5750 2700 50  0001 C CNN
	1    5750 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFDEA0F
P 8050 2700
AR Path="/5EC5738F/5EFDEA0F" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA0F" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 8050 2450 50  0001 C CNN
F 1 "GND" H 8055 2527 50  0000 C CNN
F 2 "" H 8050 2700 50  0001 C CNN
F 3 "" H 8050 2700 50  0001 C CNN
	1    8050 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EFDEA15
P 9650 2700
AR Path="/5EC5738F/5EFDEA15" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA15" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 9650 2550 50  0001 C CNN
F 1 "+5V" H 9665 2873 50  0000 C CNN
F 2 "" H 9650 2700 50  0001 C CNN
F 3 "" H 9650 2700 50  0001 C CNN
	1    9650 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2200 8750 2200
Wire Wire Line
	6450 2200 6450 1850
Wire Wire Line
	6450 1850 8750 1850
Wire Wire Line
	8750 1850 8750 2200
Wire Wire Line
	8850 3200 7700 3200
Wire Wire Line
	7700 3200 7700 2100
Wire Wire Line
	7700 2100 6350 2100
Wire Wire Line
	6350 2100 6350 2200
Text GLabel 6250 2200 1    50   Input ~ 0
CLOCK
Wire Wire Line
	6550 2200 6550 900 
Wire Wire Line
	8850 900  8850 2200
Wire Wire Line
	10150 1700 9250 1700
Wire Wire Line
	9250 1700 9250 2200
Wire Wire Line
	9150 2200 9150 1650
Wire Wire Line
	9150 1650 10250 1650
Wire Wire Line
	10350 1600 9050 1600
Wire Wire Line
	9050 1600 9050 2200
Wire Wire Line
	7050 2200 7050 1550
Wire Wire Line
	7050 1550 10450 1550
Wire Wire Line
	6950 2200 6950 1500
Wire Wire Line
	6950 1500 10550 1500
Wire Wire Line
	6850 2200 6850 1450
Wire Wire Line
	6850 1450 10650 1450
Wire Wire Line
	10750 1400 6750 1400
Wire Wire Line
	6750 1400 6750 2200
Wire Wire Line
	10050 1750 9350 1750
Wire Wire Line
	9350 1750 9350 2200
Text GLabel 3850 2200 1    50   Input ~ 0
CLOCK
$Comp
L power:+5V #PWR?
U 1 1 5EFDEA9A
P 2650 2700
AR Path="/5EC5738F/5EFDEA9A" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA9A" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 2650 2550 50  0001 C CNN
F 1 "+5V" H 2665 2873 50  0000 C CNN
F 2 "" H 2650 2700 50  0001 C CNN
F 3 "" H 2650 2700 50  0001 C CNN
	1    2650 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFDEAA0
P 1050 2700
AR Path="/5EC5738F/5EFDEAA0" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEAA0" Ref="#PWR097"  Part="1" 
F 0 "#PWR097" H 1050 2450 50  0001 C CNN
F 1 "GND" H 1055 2527 50  0000 C CNN
F 2 "" H 1050 2700 50  0001 C CNN
F 3 "" H 1050 2700 50  0001 C CNN
	1    1050 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFDEAA6
P 3350 2700
AR Path="/5EC5738F/5EFDEAA6" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEAA6" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 3350 2450 50  0001 C CNN
F 1 "GND" H 3355 2527 50  0000 C CNN
F 2 "" H 3350 2700 50  0001 C CNN
F 3 "" H 3350 2700 50  0001 C CNN
	1    3350 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EFDEAAC
P 4950 2700
AR Path="/5EC5738F/5EFDEAAC" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEAAC" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 4950 2550 50  0001 C CNN
F 1 "+5V" H 4965 2873 50  0000 C CNN
F 2 "" H 4950 2700 50  0001 C CNN
F 3 "" H 4950 2700 50  0001 C CNN
	1    4950 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2200 1750 1850
Wire Wire Line
	1750 1850 4050 1850
Wire Wire Line
	4050 1850 4050 2200
Wire Wire Line
	4150 3200 3000 3200
Wire Wire Line
	3000 3200 3000 2100
Wire Wire Line
	3000 2100 1650 2100
Wire Wire Line
	1650 2100 1650 2200
Wire Wire Line
	1850 2200 1850 1300
Wire Wire Line
	4150 1300 4150 2200
Wire Wire Line
	4550 1700 4550 2200
Wire Wire Line
	4450 2200 4450 1650
Wire Wire Line
	4350 1600 4350 2200
Wire Wire Line
	2350 2200 2350 1550
Wire Wire Line
	2250 2200 2250 1500
Wire Wire Line
	2150 2200 2150 1450
Wire Wire Line
	2050 1400 2050 2200
Wire Wire Line
	4650 1750 4650 2200
Wire Wire Line
	6550 3200 5350 3200
Wire Wire Line
	5350 3200 5350 2100
Wire Wire Line
	5350 2100 3950 2100
Wire Wire Line
	3950 2100 3950 2200
NoConn ~ 1850 3200
Wire Wire Line
	4050 1850 6450 1850
Connection ~ 4050 1850
Connection ~ 6450 1850
Wire Wire Line
	1150 1850 1750 1850
Connection ~ 1750 1850
Text HLabel 1150 800  0    50   Input ~ 0
~HI
Connection ~ 1850 1300
Connection ~ 6550 900 
Text HLabel 10250 6050 3    50   BiDi ~ 0
BUS2
Text HLabel 10150 6050 3    50   BiDi ~ 0
BUS1
Wire Wire Line
	4650 1750 9350 1750
Connection ~ 9350 1750
Wire Wire Line
	4550 1700 9250 1700
Connection ~ 9250 1700
Wire Wire Line
	4450 1650 9150 1650
Connection ~ 9150 1650
Wire Wire Line
	4350 1600 9050 1600
Connection ~ 9050 1600
Wire Wire Line
	2350 1550 7050 1550
Connection ~ 7050 1550
Wire Wire Line
	2250 1500 6950 1500
Connection ~ 6950 1500
Wire Wire Line
	2150 1450 6850 1450
Connection ~ 6850 1450
Wire Wire Line
	2050 1400 6750 1400
Connection ~ 6750 1400
$Comp
L power:GND #PWR?
U 1 1 5F341280
P 9400 5600
AR Path="/5EC5738F/5F341280" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F341280" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 9400 5350 50  0001 C CNN
F 1 "GND" H 9550 5550 50  0000 C CNN
F 2 "" H 9400 5600 50  0001 C CNN
F 3 "" H 9400 5600 50  0001 C CNN
	1    9400 5600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F341CBA
P 8100 4600
AR Path="/5EC5738F/5F341CBA" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F341CBA" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 8100 4450 50  0001 C CNN
F 1 "+5V" V 8100 4800 50  0000 C CNN
F 2 "" H 8100 4600 50  0001 C CNN
F 3 "" H 8100 4600 50  0001 C CNN
	1    8100 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 1600 10350 4150
Wire Wire Line
	10450 1550 10450 4100
Wire Wire Line
	10550 1500 10550 4050
Wire Wire Line
	10650 1450 10650 4000
Wire Wire Line
	10750 1400 10750 3950
Wire Wire Line
	9300 5600 9300 5850
Wire Wire Line
	9300 5850 10250 5850
Wire Wire Line
	9200 5600 9200 5900
Wire Wire Line
	9100 5600 9100 5950
Wire Wire Line
	9400 4600 9400 4150
Wire Wire Line
	9300 4600 9300 4100
Wire Wire Line
	9200 4600 9200 4050
Wire Wire Line
	9100 4600 9100 4000
Wire Wire Line
	9000 4600 9000 3950
$Comp
L 8-Bit~CPU~32k:74HC161 U26
U 1 1 5F128879
P 1850 2700
F 0 "U26" V 2050 2200 50  0000 L CNN
F 1 "74HC161" V 1850 2500 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 1850 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 1850 2700 50  0001 C CNN
	1    1850 2700
	0    1    1    0   
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U28
U 1 1 5F129C59
P 4150 2700
F 0 "U28" V 4400 2150 50  0000 L CNN
F 1 "74HC161" V 4150 2500 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 4150 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 4150 2700 50  0001 C CNN
	1    4150 2700
	0    1    1    0   
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U30
U 1 1 5F12A684
P 6550 2700
F 0 "U30" V 6800 2150 50  0000 L CNN
F 1 "74HC161" V 6550 2550 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6550 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 6550 2700 50  0001 C CNN
	1    6550 2700
	0    1    1    0   
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U33
U 1 1 5F12B63B
P 8850 2700
F 0 "U33" V 9100 2150 50  0000 L CNN
F 1 "74HC161" V 8850 2550 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 8850 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 8850 2700 50  0001 C CNN
	1    8850 2700
	0    1    1    0   
$EndComp
Connection ~ 8750 2200
$Comp
L 8-Bit~CPU~32k:CY62256 U32
U 1 1 5EFDB22D
P 8800 5100
F 0 "U32" V 8700 5250 50  0000 R CNN
F 1 "CY62256 32k RAM" V 8850 5500 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 8800 5100 50  0001 C CNN
F 3 "" H 8800 5100 50  0001 C CNN
	1    8800 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1850 900  6550 900 
Text Label 2050 3200 3    50   ~ 0
M15
Wire Wire Line
	9200 5900 10150 5900
Text HLabel 10050 6050 3    50   BiDi ~ 0
BUS0
Wire Wire Line
	10050 5950 9100 5950
Wire Wire Line
	1850 1300 4150 1300
Wire Wire Line
	6550 900  8850 900 
Text Label 2150 3200 3    50   ~ 0
M14
Text Label 2250 3200 3    50   ~ 0
M13
$Comp
L power:+5V #PWR?
U 1 1 5FAA0823
P 5600 4600
AR Path="/5EC5738F/5FAA0823" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5FAA0823" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 5600 4450 50  0001 C CNN
F 1 "+5V" V 5600 4800 50  0000 C CNN
F 2 "" H 5600 4600 50  0001 C CNN
F 3 "" H 5600 4600 50  0001 C CNN
	1    5600 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FAAC23C
P 7100 5600
AR Path="/5EC5738F/5FAAC23C" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5FAAC23C" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 7100 5350 50  0001 C CNN
F 1 "GND" H 7250 5550 50  0000 C CNN
F 2 "" H 7100 5600 50  0001 C CNN
F 3 "" H 7100 5600 50  0001 C CNN
	1    7100 5600
	1    0    0    -1  
$EndComp
Text Label 9350 3200 3    50   ~ 0
M0
Text Label 9250 3200 3    50   ~ 0
M1
Text Label 9150 3200 3    50   ~ 0
M2
Text Label 7050 3200 3    50   ~ 0
M4
Text Label 6950 3200 3    50   ~ 0
M5
Text Label 6850 3200 3    50   ~ 0
M6
Text Label 6750 3200 3    50   ~ 0
M7
Text Label 4650 3200 3    50   ~ 0
M8
Text Label 4550 3200 3    50   ~ 0
M9
Text Label 4450 3200 3    50   ~ 0
M10
Text Label 4350 3200 3    50   ~ 0
M11
Text Label 2350 3200 3    50   ~ 0
M12
Text Label 8800 4600 1    50   ~ 0
M0
Text Label 8600 4600 1    50   ~ 0
M1
Text Label 8500 4600 1    50   ~ 0
M2
Text Label 8400 4600 1    50   ~ 0
M3
Text Label 8300 4600 1    50   ~ 0
M4
Text Label 8100 5600 3    50   ~ 0
M5
Text Label 8200 5600 3    50   ~ 0
M6
Text Label 8300 5600 3    50   ~ 0
M7
Text Label 8400 5600 3    50   ~ 0
M8
Text Label 8500 5600 3    50   ~ 0
M9
Text Label 8600 5600 3    50   ~ 0
M10
Text Label 8700 5600 3    50   ~ 0
M11
Text Label 8800 5600 3    50   ~ 0
M12
Text Label 8900 5600 3    50   ~ 0
M13
Text Label 9000 5600 3    50   ~ 0
M14
Text Label 9050 3200 3    50   ~ 0
M3
Wire Wire Line
	6800 5600 6800 5950
Connection ~ 9100 5950
Wire Wire Line
	6900 5600 6900 5900
Connection ~ 9200 5900
Wire Wire Line
	9300 5850 7000 5850
Wire Wire Line
	7000 5850 7000 5600
Connection ~ 9300 5850
Wire Wire Line
	7100 4150 7100 4600
Wire Wire Line
	7000 4100 7000 4600
Wire Wire Line
	6900 4600 6900 4050
Wire Wire Line
	6800 4000 6800 4600
Wire Wire Line
	6700 4600 6700 3950
Wire Wire Line
	7900 3650 8900 3650
$Comp
L power:+5V #PWR?
U 1 1 5FE2E005
P 3650 2200
AR Path="/5EC5738F/5FE2E005" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5FE2E005" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 3650 2050 50  0001 C CNN
F 1 "+5V" H 3665 2373 50  0000 C CNN
F 2 "" H 3650 2200 50  0001 C CNN
F 3 "" H 3650 2200 50  0001 C CNN
	1    3650 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FE2E2FA
P 1350 2200
AR Path="/5EC5738F/5FE2E2FA" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5FE2E2FA" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 1350 2050 50  0001 C CNN
F 1 "+5V" H 1365 2373 50  0000 C CNN
F 2 "" H 1350 2200 50  0001 C CNN
F 3 "" H 1350 2200 50  0001 C CNN
	1    1350 2200
	1    0    0    -1  
$EndComp
Text Notes 1850 900  0    50   ~ 0
~MIL
Text Notes 1850 1300 0    50   ~ 0
~MIH
Text Label 6300 4600 1    50   ~ 0
M11
Text Label 6500 4600 1    50   ~ 0
M10
Text Label 6200 4600 1    50   ~ 0
M9
Text Label 6100 4600 1    50   ~ 0
M8
Text Label 5900 5600 3    50   ~ 0
M12
Text Label 6000 5600 3    50   ~ 0
M7
Text Label 6100 5600 3    50   ~ 0
M6
Text Label 6200 5600 3    50   ~ 0
M5
Text Label 6300 5600 3    50   ~ 0
M4
Text Label 6400 5600 3    50   ~ 0
M3
Text Label 6500 5600 3    50   ~ 0
M2
Text Label 6600 5600 3    50   ~ 0
M1
Text Label 6700 5600 3    50   ~ 0
M0
Text Notes 4800 3650 0    50   ~ 0
~ROM_CE
Text Notes 8400 3650 0    50   ~ 0
~RAM_CE
Wire Wire Line
	2050 3200 2050 3650
$Comp
L 74xx:74HC00 U?
U 1 1 600CA0EA
P 1550 900
AR Path="/5F64487D/600CA0EA" Ref="U?"  Part="2" 
AR Path="/5EC57456/600CA0EA" Ref="U44"  Part="1" 
F 0 "U44" H 1550 850 50  0000 C CNN
F 1 "74HC00" H 1550 950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1550 900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 1550 900 50  0001 C CNN
	1    1550 900 
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 2 1 600CA0F0
P 1550 1300
AR Path="/5F64487D/600CA0F0" Ref="U?"  Part="4" 
AR Path="/5EC57456/600CA0F0" Ref="U44"  Part="2" 
F 0 "U44" H 1550 1250 50  0000 C CNN
F 1 "74HC00" H 1550 1350 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1550 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 1550 1300 50  0001 C CNN
	2    1550 1300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 60102040
P 1250 7150
AR Path="/5F64487D/60102040" Ref="U?"  Part="5" 
AR Path="/5EC57456/60102040" Ref="U44"  Part="5" 
F 0 "U44" V 883 7150 50  0000 C CNN
F 1 "74HC00" V 974 7150 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1250 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 1250 7150 50  0001 C CNN
	5    1250 7150
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60102052
P 1750 7150
AR Path="/5F64487D/60102052" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/60102052" Ref="#PWR0208"  Part="1" 
F 0 "#PWR0208" H 1750 7000 50  0001 C CNN
F 1 "+5V" V 1750 7350 50  0000 C CNN
F 2 "" H 1750 7150 50  0001 C CNN
F 3 "" H 1750 7150 50  0001 C CNN
	1    1750 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60102059
P 750 7150
AR Path="/5F64487D/60102059" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/60102059" Ref="#PWR0209"  Part="1" 
F 0 "#PWR0209" H 750 6900 50  0001 C CNN
F 1 "GND" H 755 6977 50  0000 C CNN
F 2 "" H 750 7150 50  0001 C CNN
F 3 "" H 750 7150 50  0001 C CNN
	1    750  7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3650 8900 4600
Connection ~ 10350 4150
Connection ~ 10450 4100
Connection ~ 10550 4050
Connection ~ 10650 4000
Connection ~ 10750 3950
Wire Wire Line
	6400 3850 6400 4600
Wire Wire Line
	6600 3650 6600 4600
Wire Wire Line
	10350 4150 10350 6050
Wire Wire Line
	10450 4100 10450 6050
Wire Wire Line
	10550 4050 10550 6050
Wire Wire Line
	10650 4000 10650 6050
Wire Wire Line
	10750 3950 10750 6050
Connection ~ 10050 5950
Wire Wire Line
	10050 5950 10050 6050
Connection ~ 10150 5900
Wire Wire Line
	10150 5900 10150 6050
Connection ~ 10250 5850
Wire Wire Line
	10250 5850 10250 6050
Wire Wire Line
	10250 1650 10250 5850
Wire Wire Line
	10050 1750 10050 5950
Wire Wire Line
	10150 1700 10150 5900
Wire Wire Line
	8700 4600 8700 3850
Connection ~ 9000 3950
Wire Wire Line
	9000 3950 10750 3950
Connection ~ 9100 4000
Wire Wire Line
	9100 4000 10650 4000
Connection ~ 9200 4050
Wire Wire Line
	9200 4050 10550 4050
Connection ~ 9300 4100
Wire Wire Line
	9300 4100 10450 4100
Wire Wire Line
	9400 4150 10350 4150
Connection ~ 9400 4150
Text HLabel 4950 4150 0    50   Input ~ 0
RI
Wire Wire Line
	8200 4250 8200 4600
$Comp
L 74xx:74HC00 U?
U 3 1 5FC71C44
P 5250 4250
AR Path="/5F64487D/5FC71C44" Ref="U?"  Part="3" 
AR Path="/5EC57456/5FC71C44" Ref="U44"  Part="3" 
F 0 "U44" H 5250 4200 50  0000 C CNN
F 1 "74HC00" H 5250 4300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5250 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5250 4250 50  0001 C CNN
	3    5250 4250
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:SST39SF010A U31
U 1 1 60005265
P 6500 5100
F 0 "U31" V 6400 5300 50  0000 R CNN
F 1 "SST39SF010A ROM" V 6550 5550 50  0000 R CNN
F 2 "Package_DIP:DIP-32_W15.24mm_Socket" H 6500 5100 50  0001 C CNN
F 3 "" H 6500 5100 50  0001 C CNN
	1    6500 5100
	0    -1   -1   0   
$EndComp
Text Label 6000 4600 1    50   ~ 0
M13
Text Label 5900 4600 1    50   ~ 0
M14
Connection ~ 6400 3850
Wire Wire Line
	6400 3850 8700 3850
Connection ~ 6600 3650
Wire Wire Line
	6600 3650 7300 3650
Wire Wire Line
	6700 3950 9000 3950
Wire Wire Line
	6800 4000 9100 4000
Wire Wire Line
	6800 5950 9100 5950
Wire Wire Line
	6900 4050 9200 4050
Wire Wire Line
	6900 5900 9200 5900
Wire Wire Line
	7000 4100 9300 4100
Wire Wire Line
	7100 4150 9400 4150
Wire Wire Line
	4950 3850 6400 3850
Wire Wire Line
	2050 3650 6600 3650
$Comp
L power:GND #PWR?
U 1 1 601B4532
P 5800 5600
AR Path="/5EC5738F/601B4532" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/601B4532" Ref="#PWR063"  Part="1" 
F 0 "#PWR063" H 5800 5350 50  0001 C CNN
F 1 "GND" V 5800 5400 50  0000 C CNN
F 2 "" H 5800 5600 50  0001 C CNN
F 3 "" H 5800 5600 50  0001 C CNN
	1    5800 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 601B4C76
P 5700 5600
AR Path="/5EC5738F/601B4C76" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/601B4C76" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 5700 5350 50  0001 C CNN
F 1 "GND" V 5700 5400 50  0000 C CNN
F 2 "" H 5700 5600 50  0001 C CNN
F 3 "" H 5700 5600 50  0001 C CNN
	1    5700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4250 5700 4250
Wire Wire Line
	5700 4600 5700 4250
Connection ~ 5700 4250
Wire Wire Line
	5700 4250 8200 4250
Text GLabel 1550 2200 1    50   Input ~ 0
CLOCK
$Comp
L power:+5V #PWR?
U 1 1 600231A2
P 6050 2200
AR Path="/5EC5738F/600231A2" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/600231A2" Ref="#PWR01"  Part="1" 
F 0 "#PWR01" H 6050 2050 50  0001 C CNN
F 1 "+5V" H 6065 2373 50  0000 C CNN
F 2 "" H 6050 2200 50  0001 C CNN
F 3 "" H 6050 2200 50  0001 C CNN
	1    6050 2200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60023767
P 8350 2200
AR Path="/5EC5738F/60023767" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/60023767" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 8350 2050 50  0001 C CNN
F 1 "+5V" H 8365 2373 50  0000 C CNN
F 2 "" H 8350 2200 50  0001 C CNN
F 3 "" H 8350 2200 50  0001 C CNN
	1    8350 2200
	1    0    0    -1  
$EndComp
Text GLabel 4950 4350 0    50   Input ~ 0
CLOCK
$Comp
L 74xx:74HC04 U1
U 4 1 601673CE
P 7600 3650
AR Path="/5EC57456/601673CE" Ref="U1"  Part="4" 
AR Path="/5EC57429/601673CE" Ref="U?"  Part="4" 
AR Path="/5F64487D/601673CE" Ref="U?"  Part="4" 
F 0 "U1" H 7550 3600 50  0000 C CNN
F 1 "74HC04" H 7550 3700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7600 3650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7600 3650 50  0001 C CNN
	4    7600 3650
	1    0    0    -1  
$EndComp
Text Notes 950  7550 0    50   ~ 0
NAND used in TX
Wire Wire Line
	1250 1000 1250 1100
Wire Wire Line
	1150 1400 1250 1400
Wire Wire Line
	1150 1100 1250 1100
Connection ~ 1250 1100
Wire Wire Line
	1250 1100 1250 1200
Wire Wire Line
	1150 800  1250 800 
Text Notes 9050 1250 0    50   ~ 0
A separate reset of the MAR is not needed.\nDuring the time RESET is pressed,\nthe clock runs with SC=0 and PC=0.\nThis ensures that with CO|MI MAL=0.
Text Notes 4650 4950 0    50   ~ 0
Writing only during\nsecond clockphase.\n~RI~ alone would be\nvalid even after the\nclock phase ended\n-> not good!
$EndSCHEMATC
