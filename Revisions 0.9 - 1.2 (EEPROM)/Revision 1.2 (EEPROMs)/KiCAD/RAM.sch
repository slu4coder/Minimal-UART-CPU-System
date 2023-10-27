EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 9
Title "RAM, ROM and MAR"
Date "2020-12-16"
Rev "1.2"
Comp "by Carsten Herting (2020)"
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 8300 3950 0    50   Input ~ 0
~RO
Text HLabel 750  900  0    50   Input ~ 0
~MI
Text HLabel 9950 3450 2    50   Output ~ 0
~TI
Text HLabel 9950 3950 2    50   Output ~ 0
~TO
Text HLabel 750  1650 0    50   Input ~ 0
ME
Text HLabel 750  600  0    50   Input ~ 0
HI
Text HLabel 10550 6200 3    50   BiDi ~ 0
BUS3
Text HLabel 10650 6200 3    50   BiDi ~ 0
BUS4
Text HLabel 10750 6200 3    50   BiDi ~ 0
BUS5
Text HLabel 10850 6200 3    50   BiDi ~ 0
BUS6
Text HLabel 10950 6200 3    50   BiDi ~ 0
BUS7
Text GLabel 8300 2000 1    50   Input ~ 0
CLOCK
$Comp
L power:+5V #PWR?
U 1 1 5EFDEA03
P 7100 2500
AR Path="/5EC5738F/5EFDEA03" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA03" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 7100 2350 50  0001 C CNN
F 1 "+5V" H 7115 2673 50  0000 C CNN
F 2 "" H 7100 2500 50  0001 C CNN
F 3 "" H 7100 2500 50  0001 C CNN
	1    7100 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFDEA09
P 5500 2500
AR Path="/5EC5738F/5EFDEA09" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA09" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 5500 2250 50  0001 C CNN
F 1 "GND" H 5505 2327 50  0000 C CNN
F 2 "" H 5500 2500 50  0001 C CNN
F 3 "" H 5500 2500 50  0001 C CNN
	1    5500 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFDEA0F
P 7800 2500
AR Path="/5EC5738F/5EFDEA0F" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA0F" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 7800 2250 50  0001 C CNN
F 1 "GND" H 7805 2327 50  0000 C CNN
F 2 "" H 7800 2500 50  0001 C CNN
F 3 "" H 7800 2500 50  0001 C CNN
	1    7800 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EFDEA15
P 9400 2500
AR Path="/5EC5738F/5EFDEA15" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA15" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 9400 2350 50  0001 C CNN
F 1 "+5V" H 9415 2673 50  0000 C CNN
F 2 "" H 9400 2500 50  0001 C CNN
F 3 "" H 9400 2500 50  0001 C CNN
	1    9400 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2000 8500 2000
Wire Wire Line
	6200 2000 6200 1650
Wire Wire Line
	6200 1650 8500 1650
Wire Wire Line
	8500 1650 8500 2000
Wire Wire Line
	8600 3000 7700 3000
Wire Wire Line
	7700 3000 7700 1900
Wire Wire Line
	7700 1900 6100 1900
Wire Wire Line
	6100 1900 6100 2000
Text GLabel 6000 2000 1    50   Input ~ 0
CLOCK
Wire Wire Line
	6300 2000 6300 700 
Wire Wire Line
	8600 700  8600 2000
Wire Wire Line
	10350 1500 9000 1500
Wire Wire Line
	9000 1500 9000 2000
Wire Wire Line
	8900 2000 8900 1450
Wire Wire Line
	8900 1450 10450 1450
Wire Wire Line
	10550 1400 8800 1400
Wire Wire Line
	8800 1400 8800 2000
Wire Wire Line
	6800 2000 6800 1350
Wire Wire Line
	6800 1350 10650 1350
Wire Wire Line
	6700 2000 6700 1300
Wire Wire Line
	6700 1300 10750 1300
Wire Wire Line
	6600 2000 6600 1250
Wire Wire Line
	6600 1250 10850 1250
Wire Wire Line
	10950 1200 6500 1200
Wire Wire Line
	6500 1200 6500 2000
Wire Wire Line
	10250 1550 9100 1550
Wire Wire Line
	9100 1550 9100 2000
Text GLabel 3600 2000 1    50   Input ~ 0
CLOCK
$Comp
L power:+5V #PWR?
U 1 1 5EFDEA9A
P 2400 2500
AR Path="/5EC5738F/5EFDEA9A" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEA9A" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 2400 2350 50  0001 C CNN
F 1 "+5V" H 2415 2673 50  0000 C CNN
F 2 "" H 2400 2500 50  0001 C CNN
F 3 "" H 2400 2500 50  0001 C CNN
	1    2400 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFDEAA0
P 800 2500
AR Path="/5EC5738F/5EFDEAA0" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEAA0" Ref="#PWR097"  Part="1" 
F 0 "#PWR097" H 800 2250 50  0001 C CNN
F 1 "GND" H 805 2327 50  0000 C CNN
F 2 "" H 800 2500 50  0001 C CNN
F 3 "" H 800 2500 50  0001 C CNN
	1    800  2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EFDEAA6
P 3100 2500
AR Path="/5EC5738F/5EFDEAA6" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEAA6" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 3100 2250 50  0001 C CNN
F 1 "GND" H 3105 2327 50  0000 C CNN
F 2 "" H 3100 2500 50  0001 C CNN
F 3 "" H 3100 2500 50  0001 C CNN
	1    3100 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5EFDEAAC
P 4700 2500
AR Path="/5EC5738F/5EFDEAAC" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5EFDEAAC" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 4700 2350 50  0001 C CNN
F 1 "+5V" H 4715 2673 50  0000 C CNN
F 2 "" H 4700 2500 50  0001 C CNN
F 3 "" H 4700 2500 50  0001 C CNN
	1    4700 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2000 1500 1650
Wire Wire Line
	1500 1650 3800 1650
Wire Wire Line
	3800 1650 3800 2000
Wire Wire Line
	3900 3000 3000 3000
Wire Wire Line
	3000 3000 3000 1900
Wire Wire Line
	3000 1900 1400 1900
Wire Wire Line
	1400 1900 1400 2000
Text GLabel 1300 2000 1    50   Input ~ 0
CLOCK
Wire Wire Line
	1600 2000 1600 1100
Wire Wire Line
	3900 1100 3900 2000
Wire Wire Line
	4300 1500 4300 2000
Wire Wire Line
	4200 2000 4200 1450
Wire Wire Line
	4100 1400 4100 2000
Wire Wire Line
	2100 2000 2100 1350
Wire Wire Line
	2000 2000 2000 1300
Wire Wire Line
	1900 2000 1900 1250
Wire Wire Line
	1800 1200 1800 2000
Wire Wire Line
	4400 1550 4400 2000
Wire Wire Line
	6300 3000 5400 3000
Wire Wire Line
	5400 3000 5400 1900
Wire Wire Line
	5400 1900 3700 1900
Wire Wire Line
	3700 1900 3700 2000
NoConn ~ 1600 3000
Wire Wire Line
	3800 1650 6200 1650
Connection ~ 3800 1650
Connection ~ 6200 1650
Wire Wire Line
	750  1650 1500 1650
Connection ~ 1500 1650
Text HLabel 750  1200 0    50   Input ~ 0
~HI
Connection ~ 1600 1100
Connection ~ 6300 700 
Text HLabel 10450 6200 3    50   BiDi ~ 0
BUS2
Text HLabel 10350 6200 3    50   BiDi ~ 0
BUS1
Wire Wire Line
	4400 1550 9100 1550
Connection ~ 9100 1550
Wire Wire Line
	4300 1500 9000 1500
Connection ~ 9000 1500
Wire Wire Line
	4200 1450 8900 1450
Connection ~ 8900 1450
Wire Wire Line
	4100 1400 8800 1400
Connection ~ 8800 1400
Wire Wire Line
	2100 1350 6800 1350
Connection ~ 6800 1350
Wire Wire Line
	2000 1300 6700 1300
Connection ~ 6700 1300
Wire Wire Line
	1900 1250 6600 1250
Connection ~ 6600 1250
Wire Wire Line
	1800 1200 6500 1200
Connection ~ 6500 1200
$Comp
L power:GND #PWR?
U 1 1 5F341280
P 9150 5800
AR Path="/5EC5738F/5F341280" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F341280" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 9150 5550 50  0001 C CNN
F 1 "GND" H 9300 5750 50  0000 C CNN
F 2 "" H 9150 5800 50  0001 C CNN
F 3 "" H 9150 5800 50  0001 C CNN
	1    9150 5800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F341CBA
P 7850 4800
AR Path="/5EC5738F/5F341CBA" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F341CBA" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 7850 4650 50  0001 C CNN
F 1 "+5V" H 7750 4900 50  0000 C CNN
F 2 "" H 7850 4800 50  0001 C CNN
F 3 "" H 7850 4800 50  0001 C CNN
	1    7850 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 1450 10450 6000
Wire Wire Line
	10550 1400 10550 4650
Wire Wire Line
	10650 1350 10650 4600
Wire Wire Line
	10750 1300 10750 4550
Wire Wire Line
	10850 1250 10850 4500
Wire Wire Line
	10950 1200 10950 4450
Wire Wire Line
	9050 5800 9050 6000
Wire Wire Line
	9050 6000 10450 6000
Connection ~ 10450 6000
Wire Wire Line
	10450 6000 10450 6200
Wire Wire Line
	8950 5800 8950 6050
Connection ~ 10350 6050
Wire Wire Line
	10350 6050 10350 6200
Wire Wire Line
	8850 5800 8850 6100
Wire Wire Line
	9150 4800 9150 4650
Wire Wire Line
	9150 4650 10550 4650
Connection ~ 10550 4650
Wire Wire Line
	10550 4650 10550 6200
Wire Wire Line
	9050 4800 9050 4600
Wire Wire Line
	9050 4600 10650 4600
Connection ~ 10650 4600
Wire Wire Line
	10650 4600 10650 6200
Wire Wire Line
	8950 4800 8950 4550
Wire Wire Line
	8950 4550 10750 4550
Connection ~ 10750 4550
Wire Wire Line
	10750 4550 10750 6200
Wire Wire Line
	8850 4800 8850 4500
Wire Wire Line
	8850 4500 10850 4500
Connection ~ 10850 4500
Wire Wire Line
	10850 4500 10850 6200
Wire Wire Line
	8750 4800 8750 4450
Wire Wire Line
	8750 4450 10950 4450
Connection ~ 10950 4450
Wire Wire Line
	10950 4450 10950 6200
$Comp
L 74xx:74HC04 U1
U 4 1 5F44E8BC
P 8450 3650
F 0 "U1" H 8400 3700 50  0000 C CNN
F 1 "74HC04" H 8400 3600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8450 3650 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 8450 3650 50  0001 C CNN
	4    8450 3650
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC32 U24
U 1 1 60D32CC0
P 1250 700
F 0 "U24" H 1250 750 50  0000 C CNN
F 1 "74HC32" H 1250 650 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1250 700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1250 700 50  0001 C CNN
	1    1250 700 
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC32 U24
U 2 1 60D35382
P 1250 1100
F 0 "U24" H 1250 1150 50  0000 C CNN
F 1 "74HC32" H 1250 1050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1250 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1250 1100 50  0001 C CNN
	2    1250 1100
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U26
U 1 1 5F128879
P 1600 2500
F 0 "U26" V 1800 2000 50  0000 L CNN
F 1 "74HC161" V 1600 2300 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 1600 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 1600 2500 50  0001 C CNN
	1    1600 2500
	0    1    1    0   
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U28
U 1 1 5F129C59
P 3900 2500
F 0 "U28" V 4150 1950 50  0000 L CNN
F 1 "74HC161" V 3900 2300 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 3900 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 3900 2500 50  0001 C CNN
	1    3900 2500
	0    1    1    0   
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U30
U 1 1 5F12A684
P 6300 2500
F 0 "U30" V 6550 1950 50  0000 L CNN
F 1 "74HC161" V 6300 2350 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6300 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 6300 2500 50  0001 C CNN
	1    6300 2500
	0    1    1    0   
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U33
U 1 1 5F12B63B
P 8600 2500
F 0 "U33" V 8850 1950 50  0000 L CNN
F 1 "74HC161" V 8600 2350 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 8600 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 8600 2500 50  0001 C CNN
	1    8600 2500
	0    1    1    0   
$EndComp
Connection ~ 8500 2000
$Comp
L 8-Bit~CPU~32k:CY62256 U32
U 1 1 5EFDB22D
P 8550 5300
F 0 "U32" V 8450 5450 50  0000 R CNN
F 1 "CY62256 32k RAM" V 8550 5450 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 8550 5300 50  0001 C CNN
F 3 "" H 8550 5300 50  0001 C CNN
	1    8550 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1550 700  6300 700 
Wire Wire Line
	1550 1100 1600 1100
Text Label 1800 3000 3    50   ~ 0
M15
$Comp
L 8-Bit~CPU~32k:AT28C64B U?
U 1 1 5F250705
P 6250 5300
AR Path="/5EC57429/5F250705" Ref="U?"  Part="1" 
AR Path="/5EC57456/5F250705" Ref="U31"  Part="1" 
F 0 "U31" V 6150 5500 50  0000 R CNN
F 1 "AT28C64B 8k ROM" V 6250 5500 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 6250 5300 50  0001 C CNN
F 3 "" H 6250 5300 50  0001 C CNN
	1    6250 5300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	950  1000 950  900 
Wire Wire Line
	8950 6050 10350 6050
Text HLabel 10250 6200 3    50   BiDi ~ 0
BUS0
Wire Wire Line
	10250 1550 10250 6100
Wire Wire Line
	10250 6100 8850 6100
Connection ~ 10250 6100
Wire Wire Line
	10250 6100 10250 6200
Wire Wire Line
	1600 1100 3900 1100
Wire Wire Line
	6300 700  8600 700 
Wire Wire Line
	750  900  950  900 
Connection ~ 950  900 
Wire Wire Line
	950  900  950  800 
Text Label 1900 3000 3    50   ~ 0
M14
Text Label 2000 3000 3    50   ~ 0
M13
Wire Wire Line
	1800 3000 1800 3650
$Comp
L 8-Bit~CPU~32k:74HC32 U29
U 2 1 5F9F3829
P 4050 4600
F 0 "U29" H 4050 4650 50  0000 C CNN
F 1 "74HC32" H 4050 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4050 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4050 4600 50  0001 C CNN
	2    4050 4600
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC32 U29
U 1 1 5F9F09F7
P 3450 4500
F 0 "U29" H 3450 4550 50  0000 C CNN
F 1 "74HC32" H 3450 4450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3450 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3450 4500 50  0001 C CNN
	1    3450 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FAA0823
P 5550 4800
AR Path="/5EC5738F/5FAA0823" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5FAA0823" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 5550 4650 50  0001 C CNN
F 1 "+5V" H 5500 4950 50  0000 C CNN
F 2 "" H 5550 4800 50  0001 C CNN
F 3 "" H 5550 4800 50  0001 C CNN
	1    5550 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FAA0D26
P 5650 4800
AR Path="/5EC5738F/5FAA0D26" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5FAA0D26" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 5650 4650 50  0001 C CNN
F 1 "+5V" H 5650 4950 50  0000 C CNN
F 2 "" H 5650 4800 50  0001 C CNN
F 3 "" H 5650 4800 50  0001 C CNN
	1    5650 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FAAC23C
P 6850 5800
AR Path="/5EC5738F/5FAAC23C" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5FAAC23C" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 6850 5550 50  0001 C CNN
F 1 "GND" H 7000 5750 50  0000 C CNN
F 2 "" H 6850 5800 50  0001 C CNN
F 3 "" H 6850 5800 50  0001 C CNN
	1    6850 5800
	1    0    0    -1  
$EndComp
NoConn ~ 5550 5800
Text Label 9100 3000 3    50   ~ 0
M0
Text Label 9000 3000 3    50   ~ 0
M1
Text Label 8900 3000 3    50   ~ 0
M2
Text Label 6800 3000 3    50   ~ 0
M4
Text Label 6700 3000 3    50   ~ 0
M5
Text Label 6600 3000 3    50   ~ 0
M6
Text Label 6500 3000 3    50   ~ 0
M7
Text Label 4400 3000 3    50   ~ 0
M8
Text Label 4300 3000 3    50   ~ 0
M9
Text Label 4200 3000 3    50   ~ 0
M10
Text Label 4100 3000 3    50   ~ 0
M11
Text Label 2100 3000 3    50   ~ 0
M12
Text Label 8550 4800 1    50   ~ 0
M0
Text Label 8350 4800 1    50   ~ 0
M1
Text Label 8250 4800 1    50   ~ 0
M2
Text Label 8150 4800 1    50   ~ 0
M3
Text Label 8050 4800 1    50   ~ 0
M4
Text Label 7850 5800 3    50   ~ 0
M5
Text Label 7950 5800 3    50   ~ 0
M6
Text Label 8050 5800 3    50   ~ 0
M7
Text Label 8150 5800 3    50   ~ 0
M8
Text Label 8250 5800 3    50   ~ 0
M9
Text Label 8350 5800 3    50   ~ 0
M10
Text Label 8450 5800 3    50   ~ 0
M11
Text Label 8550 5800 3    50   ~ 0
M12
Text Label 8650 5800 3    50   ~ 0
M13
Text Label 8750 5800 3    50   ~ 0
M14
Text Label 8800 3000 3    50   ~ 0
M3
Wire Wire Line
	6550 5800 6550 6100
Wire Wire Line
	6550 6100 8850 6100
Connection ~ 8850 6100
Wire Wire Line
	6650 5800 6650 6050
Wire Wire Line
	6650 6050 8950 6050
Connection ~ 8950 6050
Wire Wire Line
	9050 6000 6750 6000
Wire Wire Line
	6750 6000 6750 5800
Connection ~ 9050 6000
Wire Wire Line
	9150 4650 6850 4650
Wire Wire Line
	6850 4650 6850 4800
Connection ~ 9150 4650
Wire Wire Line
	9050 4600 6750 4600
Wire Wire Line
	6750 4600 6750 4800
Connection ~ 9050 4600
Wire Wire Line
	6650 4800 6650 4550
Wire Wire Line
	6650 4550 8950 4550
Connection ~ 8950 4550
Wire Wire Line
	8850 4500 6550 4500
Wire Wire Line
	6550 4500 6550 4800
Connection ~ 8850 4500
Wire Wire Line
	6450 4800 6450 4450
Wire Wire Line
	6450 4450 8750 4450
Connection ~ 8750 4450
Wire Wire Line
	8450 4350 8450 4800
Wire Wire Line
	6150 4350 8450 4350
Wire Wire Line
	6150 4350 6150 4800
Wire Wire Line
	1800 3650 1800 4700
Wire Wire Line
	1800 4700 3750 4700
Connection ~ 1800 3650
Wire Wire Line
	1900 3000 1900 4600
Wire Wire Line
	1900 4600 3150 4600
Wire Wire Line
	3150 4400 2000 4400
Wire Wire Line
	2000 4400 2000 3000
Wire Wire Line
	750  600  950  600 
Wire Wire Line
	750  1200 950  1200
Wire Wire Line
	10350 1500 10350 6050
Wire Wire Line
	1800 3650 4950 3650
Wire Wire Line
	5550 4250 8650 4250
Wire Wire Line
	8650 4250 8650 4800
Text HLabel 6600 3350 0    50   Input ~ 0
~RI
$Comp
L 8-Bit~CPU~32k:74HC32 U24
U 4 1 5F329AC0
P 9050 3850
F 0 "U24" H 9050 3900 50  0000 C CNN
F 1 "74HC32" H 9050 3800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9050 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 9050 3850 50  0001 C CNN
	4    9050 3850
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC32 U29
U 3 1 5F32C151
P 9050 3450
F 0 "U29" H 9050 3500 50  0000 C CNN
F 1 "74HC32" H 9050 3400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9050 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 9050 3450 50  0001 C CNN
	3    9050 3450
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC32 U24
U 3 1 5F35E0E6
P 5250 4250
F 0 "U24" H 5250 4300 50  0000 C CNN
F 1 "74HC32" H 5250 4200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5250 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5250 4250 50  0001 C CNN
	3    5250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 4800 6350 4600
Wire Wire Line
	8450 4350 8450 3950
Connection ~ 8450 4350
Connection ~ 8450 3950
Wire Wire Line
	8450 3950 8750 3950
$Comp
L 74xx:74HC04 U1
U 3 1 5F43501F
P 4650 4350
F 0 "U1" H 4600 4400 50  0000 C CNN
F 1 "74HC04" H 4600 4300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4650 4350 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4650 4350 50  0001 C CNN
	3    4650 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3550 8750 3650
Connection ~ 8750 3650
Wire Wire Line
	8750 3650 8750 3750
Wire Wire Line
	4350 4600 4350 4350
Connection ~ 4350 4600
Wire Wire Line
	4350 4600 6350 4600
Wire Wire Line
	4950 4150 4950 3650
Connection ~ 4950 3650
Wire Wire Line
	4950 3650 8150 3650
$Comp
L power:+5V #PWR?
U 1 1 5FE2E005
P 3400 2000
AR Path="/5EC5738F/5FE2E005" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5FE2E005" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 3400 1850 50  0001 C CNN
F 1 "+5V" H 3415 2173 50  0000 C CNN
F 2 "" H 3400 2000 50  0001 C CNN
F 3 "" H 3400 2000 50  0001 C CNN
	1    3400 2000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FE2E2FA
P 1100 2000
AR Path="/5EC5738F/5FE2E2FA" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5FE2E2FA" Ref="#PWR099"  Part="1" 
F 0 "#PWR099" H 1100 1850 50  0001 C CNN
F 1 "+5V" H 1115 2173 50  0000 C CNN
F 2 "" H 1100 2000 50  0001 C CNN
F 3 "" H 1100 2000 50  0001 C CNN
	1    1100 2000
	1    0    0    -1  
$EndComp
Text HLabel 5800 2000 1    50   Input ~ 0
~RESET
$Comp
L 8-Bit~CPU~32k:74HC32 U29
U 4 1 5F3FD269
P 9650 3950
F 0 "U29" H 9650 4000 50  0000 C CNN
F 1 "74HC32" H 9650 3900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 9650 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 9650 3950 50  0001 C CNN
	4    9650 3950
	1    0    0    -1  
$EndComp
Text HLabel 9350 4050 0    50   Input ~ 0
~AI
Wire Wire Line
	9950 3450 9350 3450
Wire Wire Line
	8300 3950 8450 3950
$Comp
L Device:C_Small C?
U 1 1 5F5B6B46
P 7100 2600
AR Path="/5F645851/5F5B6B46" Ref="C?"  Part="1" 
AR Path="/5EC57456/5F5B6B46" Ref="C28"  Part="1" 
F 0 "C28" H 7192 2646 50  0000 L CNN
F 1 "100nF" H 7192 2555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7100 2600 50  0001 C CNN
F 3 "~" H 7100 2600 50  0001 C CNN
	1    7100 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5B6B4C
P 7100 2700
AR Path="/5F645851/5F5B6B4C" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F5B6B4C" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 7100 2450 50  0001 C CNN
F 1 "GND" H 7105 2527 50  0000 C CNN
F 2 "" H 7100 2700 50  0001 C CNN
F 3 "" H 7100 2700 50  0001 C CNN
	1    7100 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5BD6F1
P 9400 2600
AR Path="/5F645851/5F5BD6F1" Ref="C?"  Part="1" 
AR Path="/5EC57456/5F5BD6F1" Ref="C31"  Part="1" 
F 0 "C31" H 9492 2646 50  0000 L CNN
F 1 "100nF" H 9492 2555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9400 2600 50  0001 C CNN
F 3 "~" H 9400 2600 50  0001 C CNN
	1    9400 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5BD6F7
P 9400 2700
AR Path="/5F645851/5F5BD6F7" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F5BD6F7" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 9400 2450 50  0001 C CNN
F 1 "GND" H 9405 2527 50  0000 C CNN
F 2 "" H 9400 2700 50  0001 C CNN
F 3 "" H 9400 2700 50  0001 C CNN
	1    9400 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5C42FE
P 4700 2600
AR Path="/5F645851/5F5C42FE" Ref="C?"  Part="1" 
AR Path="/5EC57456/5F5C42FE" Ref="C25"  Part="1" 
F 0 "C25" H 4792 2646 50  0000 L CNN
F 1 "100nF" H 4792 2555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4700 2600 50  0001 C CNN
F 3 "~" H 4700 2600 50  0001 C CNN
	1    4700 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5C4304
P 4700 2700
AR Path="/5F645851/5F5C4304" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F5C4304" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 4700 2450 50  0001 C CNN
F 1 "GND" H 4705 2527 50  0000 C CNN
F 2 "" H 4700 2700 50  0001 C CNN
F 3 "" H 4700 2700 50  0001 C CNN
	1    4700 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5CB545
P 2400 2600
AR Path="/5F645851/5F5CB545" Ref="C?"  Part="1" 
AR Path="/5EC57456/5F5CB545" Ref="C23"  Part="1" 
F 0 "C23" H 2492 2646 50  0000 L CNN
F 1 "100nF" H 2492 2555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2400 2600 50  0001 C CNN
F 3 "~" H 2400 2600 50  0001 C CNN
	1    2400 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5CB54B
P 2400 2700
AR Path="/5F645851/5F5CB54B" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F5CB54B" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 2400 2450 50  0001 C CNN
F 1 "GND" H 2405 2527 50  0000 C CNN
F 2 "" H 2400 2700 50  0001 C CNN
F 3 "" H 2400 2700 50  0001 C CNN
	1    2400 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5D22E8
P 5350 5000
AR Path="/5F645851/5F5D22E8" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F5D22E8" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 5350 4750 50  0001 C CNN
F 1 "GND" H 5355 4827 50  0000 C CNN
F 2 "" H 5350 5000 50  0001 C CNN
F 3 "" H 5350 5000 50  0001 C CNN
	1    5350 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4800 5550 4800
Connection ~ 5550 4800
$Comp
L power:GND #PWR?
U 1 1 5F5E0185
P 7650 5000
AR Path="/5F645851/5F5E0185" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F5E0185" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 7650 4750 50  0001 C CNN
F 1 "GND" H 7655 4827 50  0000 C CNN
F 2 "" H 7650 5000 50  0001 C CNN
F 3 "" H 7650 5000 50  0001 C CNN
	1    7650 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4800 7850 4800
Connection ~ 7850 4800
$Comp
L 74xx:74HC04 U1
U 7 1 5F641115
P 4300 5500
F 0 "U1" V 3933 5500 50  0000 C CNN
F 1 "74HC04" V 4024 5500 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4300 5500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 4300 5500 50  0001 C CNN
	7    4300 5500
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F64526E
P 1800 5600
AR Path="/5F645851/5F64526E" Ref="C?"  Part="1" 
AR Path="/5EC57456/5F64526E" Ref="C22"  Part="1" 
F 0 "C22" H 1892 5646 50  0000 L CNN
F 1 "100nF" H 1892 5555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1800 5600 50  0001 C CNN
F 3 "~" H 1800 5600 50  0001 C CNN
	1    1800 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F645274
P 1800 5700
AR Path="/5F645851/5F645274" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F645274" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 1800 5450 50  0001 C CNN
F 1 "GND" H 1805 5527 50  0000 C CNN
F 2 "" H 1800 5700 50  0001 C CNN
F 3 "" H 1800 5700 50  0001 C CNN
	1    1800 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F64C40F
P 3300 5600
AR Path="/5F645851/5F64C40F" Ref="C?"  Part="1" 
AR Path="/5EC57456/5F64C40F" Ref="C24"  Part="1" 
F 0 "C24" H 3392 5646 50  0000 L CNN
F 1 "100nF" H 3392 5555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3300 5600 50  0001 C CNN
F 3 "~" H 3300 5600 50  0001 C CNN
	1    3300 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F64C415
P 3300 5700
AR Path="/5F645851/5F64C415" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F64C415" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 3300 5450 50  0001 C CNN
F 1 "GND" H 3305 5527 50  0000 C CNN
F 2 "" H 3300 5700 50  0001 C CNN
F 3 "" H 3300 5700 50  0001 C CNN
	1    3300 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F65356E
P 4800 5600
AR Path="/5F645851/5F65356E" Ref="C?"  Part="1" 
AR Path="/5EC57456/5F65356E" Ref="C26"  Part="1" 
F 0 "C26" H 4892 5646 50  0000 L CNN
F 1 "100nF" H 4892 5555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4800 5600 50  0001 C CNN
F 3 "~" H 4800 5600 50  0001 C CNN
	1    4800 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F653574
P 4800 5700
AR Path="/5F645851/5F653574" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F653574" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 4800 5450 50  0001 C CNN
F 1 "GND" H 4805 5527 50  0000 C CNN
F 2 "" H 4800 5700 50  0001 C CNN
F 3 "" H 4800 5700 50  0001 C CNN
	1    4800 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F659861
P 3800 5500
AR Path="/5F645851/5F659861" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F659861" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 3800 5250 50  0001 C CNN
F 1 "GND" H 3805 5327 50  0000 C CNN
F 2 "" H 3800 5500 50  0001 C CNN
F 3 "" H 3800 5500 50  0001 C CNN
	1    3800 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F659CFA
P 2300 5500
AR Path="/5F645851/5F659CFA" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F659CFA" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 2300 5250 50  0001 C CNN
F 1 "GND" H 2305 5327 50  0000 C CNN
F 2 "" H 2300 5500 50  0001 C CNN
F 3 "" H 2300 5500 50  0001 C CNN
	1    2300 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F65A03F
P 800 5500
AR Path="/5F645851/5F65A03F" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F65A03F" Ref="#PWR098"  Part="1" 
F 0 "#PWR098" H 800 5250 50  0001 C CNN
F 1 "GND" H 805 5327 50  0000 C CNN
F 2 "" H 800 5500 50  0001 C CNN
F 3 "" H 800 5500 50  0001 C CNN
	1    800  5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F65A34F
P 1800 5500
AR Path="/5EC5738F/5F65A34F" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F65A34F" Ref="#PWR0100"  Part="1" 
F 0 "#PWR0100" H 1800 5350 50  0001 C CNN
F 1 "+5V" H 1815 5673 50  0000 C CNN
F 2 "" H 1800 5500 50  0001 C CNN
F 3 "" H 1800 5500 50  0001 C CNN
	1    1800 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F65AAE7
P 3300 5500
AR Path="/5EC5738F/5F65AAE7" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F65AAE7" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 3300 5350 50  0001 C CNN
F 1 "+5V" H 3315 5673 50  0000 C CNN
F 2 "" H 3300 5500 50  0001 C CNN
F 3 "" H 3300 5500 50  0001 C CNN
	1    3300 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F65AF54
P 4800 5500
AR Path="/5EC5738F/5F65AF54" Ref="#PWR?"  Part="1" 
AR Path="/5EC57456/5F65AF54" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 4800 5350 50  0001 C CNN
F 1 "+5V" H 4815 5673 50  0000 C CNN
F 2 "" H 4800 5500 50  0001 C CNN
F 3 "" H 4800 5500 50  0001 C CNN
	1    4800 5500
	1    0    0    -1  
$EndComp
Connection ~ 4800 5500
$Comp
L 8-Bit~CPU~32k:74HC32 U24
U 5 1 5FC4B33E
P 1300 5500
F 0 "U24" V 1450 5500 50  0000 C CNN
F 1 "74HC32" V 1200 5500 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1300 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1300 5500 50  0001 C CNN
	5    1300 5500
	0    1    1    0   
$EndComp
Connection ~ 1800 5500
$Comp
L 8-Bit~CPU~32k:74HC32 U29
U 5 1 5FC51D5B
P 2800 5500
F 0 "U29" V 2950 5500 50  0000 C CNN
F 1 "74HC32" V 2700 5500 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2800 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 2800 5500 50  0001 C CNN
	5    2800 5500
	0    1    1    0   
$EndComp
Connection ~ 3300 5500
Text Notes 1550 700  0    50   ~ 0
~MIL
Text Notes 1600 1100 0    50   ~ 0
~MIH
$Comp
L 74xx:74HC04 U1
U 5 1 5FC53FF6
P 7050 3950
F 0 "U1" H 7000 4000 50  0000 C CNN
F 1 "74HC04" H 7000 3900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7050 3950 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7050 3950 50  0001 C CNN
	5    7050 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 3 1 5FC71C44
P 7650 3850
AR Path="/5F64487D/5FC71C44" Ref="U?"  Part="3" 
AR Path="/5EC57456/5FC71C44" Ref="U44"  Part="3" 
F 0 "U44" H 7650 3800 50  0000 C CNN
F 1 "74HC00" H 7650 3900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7650 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 7650 3850 50  0001 C CNN
	3    7650 3850
	1    0    0    -1  
$EndComp
Text GLabel 7350 3750 0    50   Input ~ 0
CLOCK
Wire Wire Line
	6600 3350 6750 3350
Wire Wire Line
	7950 4800 7950 3850
Wire Wire Line
	6750 3950 6750 3350
Connection ~ 6750 3350
Wire Wire Line
	6750 3350 8750 3350
Text HLabel 8100 2000 1    50   Input ~ 0
~RESET
$Comp
L Device:C_Small C?
U 1 1 5F5E017F
P 7650 4900
AR Path="/5F645851/5F5E017F" Ref="C?"  Part="1" 
AR Path="/5EC57456/5F5E017F" Ref="C29"  Part="1" 
F 0 "C29" H 7450 5000 50  0000 L CNN
F 1 "100nF" H 7400 4800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7650 4900 50  0001 C CNN
F 3 "~" H 7650 4900 50  0001 C CNN
	1    7650 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F5D22E2
P 5350 4900
AR Path="/5F645851/5F5D22E2" Ref="C?"  Part="1" 
AR Path="/5EC57456/5F5D22E2" Ref="C27"  Part="1" 
F 0 "C27" H 5150 5000 50  0000 L CNN
F 1 "100nF" H 5100 4800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5350 4900 50  0001 C CNN
F 3 "~" H 5350 4900 50  0001 C CNN
	1    5350 4900
	1    0    0    -1  
$EndComp
Text Label 6050 4800 1    50   ~ 0
M11
Text Label 6250 4800 1    50   ~ 0
M10
Text Label 5950 4800 1    50   ~ 0
M9
Text Label 5850 4800 1    50   ~ 0
M8
Text Label 5650 5800 3    50   ~ 0
M12
Text Label 5750 5800 3    50   ~ 0
M7
Text Label 5850 5800 3    50   ~ 0
M6
Text Label 5950 5800 3    50   ~ 0
M5
Text Label 6050 5800 3    50   ~ 0
M4
Text Label 6150 5800 3    50   ~ 0
M3
Text Label 6250 5800 3    50   ~ 0
M2
Text Label 6350 5800 3    50   ~ 0
M1
Text Label 6450 5800 3    50   ~ 0
M0
Text Notes 5600 4600 0    50   ~ 0
~ROM_ENABLE
Text Notes 5600 4250 0    50   ~ 0
~RAM_ENABLE
$EndSCHEMATC
