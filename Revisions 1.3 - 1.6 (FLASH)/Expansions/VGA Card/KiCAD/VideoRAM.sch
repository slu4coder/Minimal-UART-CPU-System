EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Minimal VGA Card"
Date "2021-11-18"
Rev "1.0"
Comp ""
Comment1 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment2 "License: CC BY-NC-SA 3.0"
Comment3 "Author: Carsten Herting (slu4)"
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR026
U 1 1 5FA549F2
P 8300 6400
F 0 "#PWR026" H 8300 6150 50  0001 C CNN
F 1 "GND" V 8300 6300 50  0000 R CNN
F 2 "" H 8300 6400 50  0001 C CNN
F 3 "" H 8300 6400 50  0001 C CNN
	1    8300 6400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5FAC0EE4
P 7300 5300
F 0 "#PWR023" H 7300 5050 50  0001 C CNN
F 1 "GND" V 7300 5200 50  0000 R CNN
F 2 "" H 7300 5300 50  0001 C CNN
F 3 "" H 7300 5300 50  0001 C CNN
	1    7300 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 5000 14800 5000
Wire Wire Line
	8300 5100 14700 5100
Wire Wire Line
	8300 5200 14600 5200
Wire Wire Line
	8300 5300 14500 5300
Wire Wire Line
	8300 5700 11000 5700
Wire Wire Line
	8300 5800 10900 5800
Wire Wire Line
	8300 5900 10800 5900
Wire Wire Line
	8300 6000 10700 6000
Wire Wire Line
	8300 6100 10600 6100
$Comp
L power:GND #PWR027
U 1 1 5FFCC538
P 2450 6650
F 0 "#PWR027" H 2450 6400 50  0001 C CNN
F 1 "GND" H 2450 6500 50  0000 C CNN
F 2 "" H 2450 6650 50  0001 C CNN
F 3 "" H 2450 6650 50  0001 C CNN
	1    2450 6650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F926206
P 9250 7150
AR Path="/5F8CED2C/5F926206" Ref="#PWR?"  Part="1" 
AR Path="/5F926206" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 9250 7000 50  0001 C CNN
F 1 "+5V" V 9250 7350 50  0000 C CNN
F 2 "" H 9250 7150 50  0001 C CNN
F 3 "" H 9250 7150 50  0001 C CNN
	1    9250 7150
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F92620C
P 13150 7150
AR Path="/5F8CED2C/5F92620C" Ref="#PWR?"  Part="1" 
AR Path="/5F92620C" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 13150 7000 50  0001 C CNN
F 1 "+5V" V 13150 7350 50  0000 C CNN
F 2 "" H 13150 7150 50  0001 C CNN
F 3 "" H 13150 7150 50  0001 C CNN
	1    13150 7150
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U11
U 4 1 5FBC04D0
P 4400 1400
F 0 "U11" H 4400 1350 50  0000 C CNN
F 1 "74HC00" H 4400 1450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4400 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4400 1400 50  0001 C CNN
	4    4400 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U19
U 2 1 5FBC5047
P 1850 6150
F 0 "U19" H 1850 6100 50  0000 C CNN
F 1 "74HC00" H 1850 6200 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1850 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 1850 6150 50  0001 C CNN
	2    1850 6150
	0    -1   1    0   
$EndComp
NoConn ~ 2450 5450
$Comp
L power:GND #PWR024
U 1 1 5F988BFA
P 3450 5350
F 0 "#PWR024" H 3450 5100 50  0001 C CNN
F 1 "GND" V 3450 5200 50  0000 R CNN
F 2 "" H 3450 5350 50  0001 C CNN
F 3 "" H 3450 5350 50  0001 C CNN
	1    3450 5350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR037
U 1 1 5FA66186
P 13300 7150
F 0 "#PWR037" H 13300 6900 50  0001 C CNN
F 1 "GND" H 13305 6977 50  0000 C CNN
F 2 "" H 13300 7150 50  0001 C CNN
F 3 "" H 13300 7150 50  0001 C CNN
	1    13300 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5FA67039
P 11350 7150
F 0 "#PWR035" H 11350 6900 50  0001 C CNN
F 1 "GND" H 11355 6977 50  0000 C CNN
F 2 "" H 11350 7150 50  0001 C CNN
F 3 "" H 11350 7150 50  0001 C CNN
	1    11350 7150
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5FA67FA7
P 7300 6400
F 0 "#PWR025" H 7300 6150 50  0001 C CNN
F 1 "GND" V 7300 6200 50  0000 C CNN
F 2 "" H 7300 6400 50  0001 C CNN
F 3 "" H 7300 6400 50  0001 C CNN
	1    7300 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR038
U 1 1 5FA94D8A
P 15100 7150
F 0 "#PWR038" H 15100 7000 50  0001 C CNN
F 1 "+5V" V 15100 7350 50  0000 C CNN
F 2 "" H 15100 7150 50  0001 C CNN
F 3 "" H 15100 7150 50  0001 C CNN
	1    15100 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR034
U 1 1 5FA95230
P 11200 7150
F 0 "#PWR034" H 11200 7000 50  0001 C CNN
F 1 "+5V" V 11200 7350 50  0000 C CNN
F 2 "" H 11200 7150 50  0001 C CNN
F 3 "" H 11200 7150 50  0001 C CNN
	1    11200 7150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR020
U 1 1 5FAD7FB5
P 7300 5000
F 0 "#PWR020" H 7300 4850 50  0001 C CNN
F 1 "+5V" V 7300 5200 50  0000 C CNN
F 2 "" H 7300 5000 50  0001 C CNN
F 3 "" H 7300 5000 50  0001 C CNN
	1    7300 5000
	0    -1   -1   0   
$EndComp
$Comp
L VideoRAM:CY62256 U12
U 1 1 5FA30EEE
P 7800 5850
F 0 "U12" V 7800 6200 50  0000 C CNN
F 1 "CY62256" V 7800 5800 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 7800 5850 50  0001 C CNN
F 3 "" H 7800 5850 50  0001 C CNN
	1    7800 5850
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR021
U 1 1 5FAE4A5A
P 2950 5050
F 0 "#PWR021" H 2950 4900 50  0001 C CNN
F 1 "+5V" H 2965 5223 50  0000 C CNN
F 2 "" H 2950 5050 50  0001 C CNN
F 3 "" H 2950 5050 50  0001 C CNN
	1    2950 5050
	1    0    0    -1  
$EndComp
Text Notes 8450 3150 2    50   ~ 0
~S
Text Notes 8450 2400 2    50   ~ 0
~R
Text Notes 7800 2950 2    50   ~ 0
Q
$Comp
L 74xx:74HC00 U?
U 4 1 5FB915BD
P 8700 3050
AR Path="/5F8CD850/5FB915BD" Ref="U?"  Part="2" 
AR Path="/5FB915BD" Ref="U7"  Part="4" 
F 0 "U7" H 8700 3000 50  0000 C CNN
F 1 "74HC00" H 8700 3100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8700 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8700 3050 50  0001 C CNN
	4    8700 3050
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC00 U?
U 1 1 5FB915C3
P 8700 2400
AR Path="/5F8CD850/5FB915C3" Ref="U?"  Part="1" 
AR Path="/5FB915C3" Ref="U7"  Part="1" 
F 0 "U7" H 8700 2350 50  0000 C CNN
F 1 "74HC00" H 8700 2450 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8700 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8700 2400 50  0001 C CNN
	1    8700 2400
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74HC00 U?
U 2 1 5FB915E3
P 8100 2500
AR Path="/5F8CD850/5FB915E3" Ref="U?"  Part="4" 
AR Path="/5FB915E3" Ref="U7"  Part="2" 
F 0 "U7" H 8100 2450 50  0000 C CNN
F 1 "74HC00" H 8100 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8100 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8100 2500 50  0001 C CNN
	2    8100 2500
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 3 1 5FB915EE
P 8100 2950
AR Path="/5F8CD850/5FB915EE" Ref="U?"  Part="3" 
AR Path="/5FB915EE" Ref="U7"  Part="3" 
F 0 "U7" H 8100 2900 50  0000 C CNN
F 1 "74HC00" H 8100 3000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8100 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8100 2950 50  0001 C CNN
	3    8100 2950
	-1   0    0    -1  
$EndComp
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 2 1 5FB915F4
P 8100 3350
AR Path="/5F8CD850/5FB915F4" Ref="U?"  Part="1" 
AR Path="/5FB915F4" Ref="U1"  Part="2" 
F 0 "U1" H 8100 3400 50  0000 C CNN
F 1 "74HC32" H 8100 3300 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8100 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8100 3350 50  0001 C CNN
	2    8100 3350
	-1   0    0    1   
$EndComp
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 1 1 5FB915FA
P 8700 3450
AR Path="/5F8CD850/5FB915FA" Ref="U?"  Part="2" 
AR Path="/5FB915FA" Ref="U1"  Part="1" 
F 0 "U1" H 8700 3400 50  0000 C CNN
F 1 "74HC32" H 8700 3500 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8700 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8700 3450 50  0001 C CNN
	1    8700 3450
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74HC590 U?
U 1 1 5FB91618
P 10500 1850
AR Path="/5F8CD850/5FB91618" Ref="U?"  Part="1" 
AR Path="/5FB91618" Ref="U5"  Part="1" 
F 0 "U5" V 10500 1800 50  0000 L CNN
F 1 "74HC590" V 10600 1700 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 10500 1900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 10500 1900 50  0001 C CNN
	1    10500 1850
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC590 U?
U 1 1 5FB9161E
P 14300 1850
AR Path="/5F8CD850/5FB9161E" Ref="U?"  Part="1" 
AR Path="/5FB9161E" Ref="U6"  Part="1" 
F 0 "U6" V 14300 1800 50  0000 L CNN
F 1 "74HC590" V 14400 1700 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 14300 1900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC590.pdf" H 14300 1900 50  0001 C CNN
	1    14300 1850
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FB9162A
P 15000 1850
AR Path="/5F8CD8D4/5FB9162A" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/5FB9162A" Ref="#PWR?"  Part="1" 
AR Path="/5FB9162A" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 15000 1700 50  0001 C CNN
F 1 "+5V" V 15000 2050 50  0000 C CNN
F 2 "" H 15000 1850 50  0001 C CNN
F 3 "" H 15000 1850 50  0001 C CNN
	1    15000 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FB91630
P 11200 1850
AR Path="/5F8CD8D4/5FB91630" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/5FB91630" Ref="#PWR?"  Part="1" 
AR Path="/5FB91630" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 11200 1700 50  0001 C CNN
F 1 "+5V" V 11200 2050 50  0000 C CNN
F 2 "" H 11200 1850 50  0001 C CNN
F 3 "" H 11200 1850 50  0001 C CNN
	1    11200 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FB91636
P 9900 1850
AR Path="/5F8CD850/5FB91636" Ref="#PWR?"  Part="1" 
AR Path="/5FB91636" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 9900 1600 50  0001 C CNN
F 1 "GND" H 9905 1677 50  0000 C CNN
F 2 "" H 9900 1850 50  0001 C CNN
F 3 "" H 9900 1850 50  0001 C CNN
	1    9900 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FB9163C
P 13700 1850
AR Path="/5F8CD850/5FB9163C" Ref="#PWR?"  Part="1" 
AR Path="/5FB9163C" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 13700 1600 50  0001 C CNN
F 1 "GND" H 13705 1677 50  0000 C CNN
F 2 "" H 13700 1850 50  0001 C CNN
F 3 "" H 13700 1850 50  0001 C CNN
	1    13700 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 1450 10800 1450
Wire Wire Line
	14500 1450 14600 1450
Wire Wire Line
	13900 2250 12450 2250
Wire Wire Line
	12450 2250 12450 1450
NoConn ~ 10100 2250
Wire Wire Line
	10900 2250 10900 2500
Wire Wire Line
	10500 1450 10500 1150
Wire Wire Line
	14300 1450 14300 1150
Wire Wire Line
	10300 2250 10300 2300
Wire Wire Line
	10300 2300 9000 2300
Wire Wire Line
	11000 1450 12450 1450
Wire Wire Line
	14300 1150 10500 1150
Connection ~ 10500 1150
Wire Wire Line
	8400 1150 10500 1150
Wire Wire Line
	10400 2250 10400 3600
Wire Wire Line
	10500 2250 10500 3600
Wire Wire Line
	10600 2250 10600 3600
Wire Wire Line
	10700 2250 10700 3600
Wire Wire Line
	10800 2250 10800 3600
Wire Wire Line
	11000 2250 11000 3600
Connection ~ 11000 5700
Text Notes 7400 3350 0    50   ~ 0
~HSYNC
Text Notes 7400 2950 0    50   ~ 0
~VSYNC
Connection ~ 2600 2750
$Comp
L power:GND #PWR013
U 1 1 5F980386
P 2600 2750
F 0 "#PWR013" H 2600 2500 50  0001 C CNN
F 1 "GND" H 2605 2577 50  0000 C CNN
F 2 "" H 2600 2750 50  0001 C CNN
F 3 "" H 2600 2750 50  0001 C CNN
	1    2600 2750
	1    0    0    1   
$EndComp
NoConn ~ 2700 3050
NoConn ~ 2700 2950
NoConn ~ 3300 2750
NoConn ~ 3300 3350
NoConn ~ 3300 3550
Connection ~ 2600 2850
Wire Wire Line
	2600 2750 2700 2750
Wire Wire Line
	2600 2850 2600 2750
Connection ~ 2600 3250
Wire Wire Line
	2600 2850 2700 2850
Wire Wire Line
	2600 3250 2600 2850
$Comp
L Device:R R2
U 1 1 5FAB6EFA
P 3450 3150
F 0 "R2" V 3350 3150 50  0000 C CNN
F 1 "75" V 3450 3150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3450 3150 50  0001 C CNN
F 3 "~" H 3450 3150 50  0001 C CNN
	1    3450 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5FAB5FC5
P 3450 2950
F 0 "R1" V 3550 2950 50  0000 C CNN
F 1 "75" V 3450 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3450 2950 50  0001 C CNN
F 3 "~" H 3450 2950 50  0001 C CNN
	1    3450 2950
	0    -1   -1   0   
$EndComp
Connection ~ 2600 3450
Wire Wire Line
	2600 3250 2700 3250
Wire Wire Line
	2600 3450 2600 3250
Wire Wire Line
	2600 3450 2700 3450
Wire Wire Line
	2600 3650 2600 3450
Wire Wire Line
	2700 3650 2600 3650
Connection ~ 2450 3350
Wire Wire Line
	2450 3150 2450 3350
Wire Wire Line
	2700 3150 2450 3150
Wire Wire Line
	2450 3350 2450 3550
Wire Wire Line
	2700 3350 2450 3350
Wire Wire Line
	2700 3550 2450 3550
$Comp
L Device:R R3
U 1 1 5F9FE84B
P 2450 3700
F 0 "R3" V 2350 3700 50  0000 C CNN
F 1 "150" V 2450 3700 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 2450 3700 50  0001 C CNN
F 3 "~" H 2450 3700 50  0001 C CNN
	1    2450 3700
	-1   0    0    -1  
$EndComp
$Comp
L Connector:DB15_Female_HighDensity J2
U 1 1 5F9DF8FD
P 3000 3150
F 0 "J2" H 3200 2550 50  0000 C CNN
F 1 "VGA connector" H 3000 2450 50  0000 C CNN
F 2 "ArduinoPC:VGA DSUB15HD_female" H 2050 3550 50  0001 C CNN
F 3 " ~" H 2050 3550 50  0001 C CNN
	1    3000 3150
	1    0    0    1   
$EndComp
Connection ~ 2450 3550
Connection ~ 10900 2500
Wire Wire Line
	10900 2500 10900 3600
Wire Wire Line
	8400 2400 8400 1150
$Comp
L power:GND #PWR?
U 1 1 5F9DE643
P 14800 1450
AR Path="/5F8CD850/5F9DE643" Ref="#PWR?"  Part="1" 
AR Path="/5F9DE643" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 14800 1200 50  0001 C CNN
F 1 "GND" H 14805 1277 50  0000 C CNN
F 2 "" H 14800 1450 50  0001 C CNN
F 3 "" H 14800 1450 50  0001 C CNN
	1    14800 1450
	-1   0    0    1   
$EndComp
Text GLabel 2450 6550 0    50   Input ~ 0
PIXEL
Text GLabel 1850 4050 1    50   Input ~ 0
4MHz
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 4 1 5FA0A33A
P 1950 4350
AR Path="/5F8CD850/5FA0A33A" Ref="U?"  Part="2" 
AR Path="/5FA0A33A" Ref="U1"  Part="4" 
F 0 "U1" H 1950 4300 50  0000 C CNN
F 1 "74HC32" H 1950 4400 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1950 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1950 4350 50  0001 C CNN
	4    1950 4350
	0    -1   1    0   
$EndComp
Wire Wire Line
	1650 4650 1850 4650
Connection ~ 1850 4650
$Comp
L power:GND #PWR?
U 1 1 5FA5D831
P 14100 1450
AR Path="/5F8CD850/5FA5D831" Ref="#PWR?"  Part="1" 
AR Path="/5FA5D831" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 14100 1200 50  0001 C CNN
F 1 "GND" H 14105 1277 50  0000 C CNN
F 2 "" H 14100 1450 50  0001 C CNN
F 3 "" H 14100 1450 50  0001 C CNN
	1    14100 1450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA5DB19
P 10300 1450
AR Path="/5F8CD850/5FA5DB19" Ref="#PWR?"  Part="1" 
AR Path="/5FA5DB19" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 10300 1200 50  0001 C CNN
F 1 "GND" H 10305 1277 50  0000 C CNN
F 2 "" H 10300 1450 50  0001 C CNN
F 3 "" H 10300 1450 50  0001 C CNN
	1    10300 1450
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FB60157
P 11300 4100
AR Path="/5F8CD8D4/5FB60157" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/5FB60157" Ref="#PWR?"  Part="1" 
AR Path="/5FB60157" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 11300 3950 50  0001 C CNN
F 1 "+5V" V 11300 4300 50  0000 C CNN
F 2 "" H 11300 4100 50  0001 C CNN
F 3 "" H 11300 4100 50  0001 C CNN
	1    11300 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FB60161
P 9700 4100
AR Path="/5F8CD850/5FB60161" Ref="#PWR?"  Part="1" 
AR Path="/5FB60161" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 9700 3850 50  0001 C CNN
F 1 "GND" H 9705 3927 50  0000 C CNN
F 2 "" H 9700 4100 50  0001 C CNN
F 3 "" H 9700 4100 50  0001 C CNN
	1    9700 4100
	1    0    0    -1  
$EndComp
$Comp
L VideoRAM-rescue:74HC245-8-Bit_CPU_32k U9
U 1 1 5FB6016B
P 10500 4100
F 0 "U9" V 10450 4050 50  0000 L CNN
F 1 "74HC245" V 10550 3900 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 10500 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 10500 4100 50  0001 C CNN
	1    10500 4100
	0    1    -1   0   
$EndComp
Wire Wire Line
	10400 4600 10400 6300
Wire Wire Line
	10500 4600 10500 6200
Wire Wire Line
	10600 4600 10600 6100
Wire Wire Line
	10700 4600 10700 6000
Wire Wire Line
	10800 4600 10800 5900
Wire Wire Line
	10900 4600 10900 5800
Wire Wire Line
	11000 4600 11000 5700
Wire Wire Line
	14600 2250 14600 3600
Wire Wire Line
	14700 2250 14700 3600
$Comp
L power:+5V #PWR?
U 1 1 5FA6270A
P 15100 4100
AR Path="/5F8CD8D4/5FA6270A" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/5FA6270A" Ref="#PWR?"  Part="1" 
AR Path="/5FA6270A" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 15100 3950 50  0001 C CNN
F 1 "+5V" V 15100 4300 50  0000 C CNN
F 2 "" H 15100 4100 50  0001 C CNN
F 3 "" H 15100 4100 50  0001 C CNN
	1    15100 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	14800 2250 14800 3600
Wire Wire Line
	14800 4600 14800 5000
Wire Wire Line
	14700 4600 14700 5100
Wire Wire Line
	14600 4600 14600 5200
Wire Wire Line
	14500 4600 14500 5300
Wire Wire Line
	14400 4600 14400 5400
Wire Wire Line
	14300 4600 14300 5500
Wire Wire Line
	14100 4600 14100 5600
$Comp
L power:GND #PWR?
U 1 1 5FA62F35
P 13500 4100
AR Path="/5F8CD850/5FA62F35" Ref="#PWR?"  Part="1" 
AR Path="/5FA62F35" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 13500 3850 50  0001 C CNN
F 1 "GND" H 13505 3927 50  0000 C CNN
F 2 "" H 13500 4100 50  0001 C CNN
F 3 "" H 13500 4100 50  0001 C CNN
	1    13500 4100
	1    0    0    -1  
$EndComp
$Comp
L VideoRAM-rescue:74HC245-8-Bit_CPU_32k U10
U 1 1 5FA5EE63
P 14300 4100
F 0 "U10" V 14250 4050 50  0000 L CNN
F 1 "74HC245" V 14350 3900 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 14300 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 14300 4100 50  0001 C CNN
	1    14300 4100
	0    1    -1   0   
$EndComp
NoConn ~ 14200 4600
NoConn ~ 10300 4600
Wire Wire Line
	14200 2250 14200 3600
Wire Wire Line
	10300 2300 10300 3600
Connection ~ 10300 2300
$Comp
L VideoRAM:74HC165 U13
U 1 1 5FDF8487
P 2950 5950
F 0 "U13" V 3050 5800 50  0000 C CNN
F 1 "74HC165" V 2900 5900 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 2950 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS165" H 2950 5950 50  0001 C CNN
	1    2950 5950
	-1   0    0    -1  
$EndComp
Text Notes 7800 2550 2    50   ~ 0
~Q
Wire Wire Line
	7800 2800 7800 2950
Wire Wire Line
	7800 2650 7800 2500
Wire Wire Line
	8400 2650 8400 2600
Wire Wire Line
	8400 2800 8400 2850
Wire Wire Line
	8400 2800 7800 2650
Wire Wire Line
	7800 2800 8400 2650
$Comp
L VideoRAM:74HC173 U15
U 1 1 60756F8A
P 8350 7150
F 0 "U15" V 8450 7100 50  0000 L CNN
F 1 "74HC173" V 8350 6950 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 8350 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 8350 7150 50  0001 C CNN
	1    8350 7150
	0    1    -1   0   
$EndComp
$Comp
L VideoRAM:74HC173 U16
U 1 1 6077B62A
P 10300 7150
F 0 "U16" V 10400 7100 50  0000 L CNN
F 1 "74HC173" V 10300 6950 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 10300 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 10300 7150 50  0001 C CNN
	1    10300 7150
	0    1    -1   0   
$EndComp
$Comp
L VideoRAM:74HC173 U17
U 1 1 6077C9D8
P 12250 7150
F 0 "U17" V 12350 7100 50  0000 L CNN
F 1 "74HC173" V 12250 7000 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 12250 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 12250 7150 50  0001 C CNN
	1    12250 7150
	0    1    -1   0   
$EndComp
$Comp
L VideoRAM:74HC173 U18
U 1 1 6077D2D0
P 14200 7150
F 0 "U18" V 14300 7150 50  0000 L CNN
F 1 "74HC173" V 14200 7000 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 14200 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 14200 7150 50  0001 C CNN
	1    14200 7150
	0    1    -1   0   
$EndComp
Text Label 8950 7650 3    50   ~ 0
Bus4
Text Label 8850 7650 3    50   ~ 0
Bus5
Text Label 8750 7650 3    50   ~ 0
Bus6
Text Label 8650 7650 3    50   ~ 0
Bus7
Text Label 14800 7650 3    50   ~ 0
Bus0
Text Label 14700 7650 3    50   ~ 0
Bus1
Text Label 14600 7650 3    50   ~ 0
Bus2
Text Label 14500 7650 3    50   ~ 0
Bus3
Text Label 12850 7650 3    50   ~ 0
Bus4
Text Label 12750 7650 3    50   ~ 0
Bus5
$Comp
L power:GND #PWR033
U 1 1 6092D838
P 9400 7150
F 0 "#PWR033" H 9400 6900 50  0001 C CNN
F 1 "GND" H 9405 6977 50  0000 C CNN
F 2 "" H 9400 7150 50  0001 C CNN
F 3 "" H 9400 7150 50  0001 C CNN
	1    9400 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 6092DBC2
P 7450 7150
F 0 "#PWR031" H 7450 6900 50  0001 C CNN
F 1 "GND" H 7455 6977 50  0000 C CNN
F 2 "" H 7450 7150 50  0001 C CNN
F 3 "" H 7450 7150 50  0001 C CNN
	1    7450 7150
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR040
U 1 1 6092E1E1
P 9700 7650
F 0 "#PWR040" H 9700 7400 50  0001 C CNN
F 1 "GND" V 9700 7450 50  0000 C CNN
F 2 "" H 9700 7650 50  0001 C CNN
F 3 "" H 9700 7650 50  0001 C CNN
	1    9700 7650
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR039
U 1 1 6092E474
P 7750 7650
F 0 "#PWR039" H 7750 7400 50  0001 C CNN
F 1 "GND" V 7750 7450 50  0000 C CNN
F 2 "" H 7750 7650 50  0001 C CNN
F 3 "" H 7750 7650 50  0001 C CNN
	1    7750 7650
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR041
U 1 1 6092E963
P 11650 7650
F 0 "#PWR041" H 11650 7400 50  0001 C CNN
F 1 "GND" V 11650 7450 50  0000 C CNN
F 2 "" H 11650 7650 50  0001 C CNN
F 3 "" H 11650 7650 50  0001 C CNN
	1    11650 7650
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR042
U 1 1 6092ECE6
P 13600 7650
F 0 "#PWR042" H 13600 7400 50  0001 C CNN
F 1 "GND" V 13600 7450 50  0000 C CNN
F 2 "" H 13600 7650 50  0001 C CNN
F 3 "" H 13600 7650 50  0001 C CNN
	1    13600 7650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	14000 8200 14000 7650
$Comp
L Minimal~Expansion:Expansion_Port J1
U 1 1 609FA737
P 6050 2350
F 0 "J1" V 6300 1650 50  0000 L CNN
F 1 "EXPANSION PORT" V 6300 2050 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x16_P2.54mm_Vertical" H 6050 2450 50  0001 C CNN
F 3 "" H 6050 2450 50  0001 C CNN
	1    6050 2350
	0    1    -1   0   
$EndComp
$Comp
L 74xx:74HC04 U3
U 1 1 5FC9A408
P 6100 9600
F 0 "U3" H 6100 9550 50  0000 R CNN
F 1 "74HC04" H 6250 9650 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6100 9600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6100 9600 50  0001 C CNN
	1    6100 9600
	1    0    0    -1  
$EndComp
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 3 1 60ADD271
P 6450 5100
AR Path="/5F8CD850/60ADD271" Ref="U?"  Part="2" 
AR Path="/60ADD271" Ref="U8"  Part="3" 
F 0 "U8" H 6450 5050 50  0000 C CNN
F 1 "74HC32" H 6450 5150 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6450 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6450 5100 50  0001 C CNN
	3    6450 5100
	1    0    0    1   
$EndComp
Text Label 5550 4900 2    50   ~ 0
~INH
Text Label 6050 2550 3    50   ~ 0
M0
Text Label 5950 2550 3    50   ~ 0
M2
Text Label 5850 2550 3    50   ~ 0
M4
Text Label 5750 2550 3    50   ~ 0
M6
Text Label 5650 2550 3    50   ~ 0
M8
Text Label 5550 2550 3    50   ~ 0
M10
Text Label 5450 2550 3    50   ~ 0
M12
Text Label 5350 2550 3    50   ~ 0
M14
Text Label 5350 1650 1    50   ~ 0
M15
Text Label 5450 1650 1    50   ~ 0
M13
Text Label 5550 1650 1    50   ~ 0
M11
Text Label 5650 1650 1    50   ~ 0
M9
Text Label 5750 1650 1    50   ~ 0
M7
Text Label 5850 1650 1    50   ~ 0
M5
Text Label 5950 1650 1    50   ~ 0
M3
Text Label 6050 1650 1    50   ~ 0
M1
Text Label 6450 2550 3    50   ~ 0
Bus0
Text Label 6350 2550 3    50   ~ 0
Bus2
Text Label 6250 2550 3    50   ~ 0
Bus4
Text Label 6150 2550 3    50   ~ 0
Bus6
Text Label 6450 1650 1    50   ~ 0
Bus1
Text Label 6350 1650 1    50   ~ 0
Bus3
Text Label 6250 1650 1    50   ~ 0
Bus5
Text Label 6150 1650 1    50   ~ 0
Bus7
NoConn ~ 6750 1650
Text Label 6650 1650 1    50   ~ 0
RI
$Comp
L power:GND #PWR012
U 1 1 60B2CC62
P 6850 2550
F 0 "#PWR012" H 6850 2300 50  0001 C CNN
F 1 "GND" V 6850 2350 50  0000 C CNN
F 2 "" H 6850 2550 50  0001 C CNN
F 3 "" H 6850 2550 50  0001 C CNN
	1    6850 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 60B2D48A
P 6750 2550
F 0 "#PWR011" H 6750 2400 50  0001 C CNN
F 1 "+5V" V 6750 2750 50  0000 C CNN
F 2 "" H 6750 2550 50  0001 C CNN
F 3 "" H 6750 2550 50  0001 C CNN
	1    6750 2550
	-1   0    0    1   
$EndComp
Text Label 2700 800  2    50   ~ 0
M2
Text Label 14600 8100 0    50   ~ 0
M0
Text Label 8050 7650 3    50   ~ 0
~RI
Wire Wire Line
	3600 3150 3600 3350
Wire Wire Line
	12550 5700 11000 5700
Wire Wire Line
	14500 2250 14500 3550
Wire Wire Line
	14400 2250 14400 3350
Wire Wire Line
	14300 2250 14300 3250
Wire Wire Line
	9000 3550 14500 3550
Connection ~ 14500 3550
Wire Wire Line
	14500 3550 14500 3600
Wire Wire Line
	9000 3350 14400 3350
Connection ~ 14400 3350
Wire Wire Line
	14400 3350 14400 3600
Wire Wire Line
	8400 3250 14300 3250
Connection ~ 14300 3250
Wire Wire Line
	14300 3250 14300 3600
Text Notes 11300 4900 0    50   ~ 0
During the first phase, the VRAM\naddress is controlled by the timer.
Text Notes 11300 6050 0    50   ~ 0
During the second phase, the\nVRAM address is controlled by\nthe MSB/LSB access register.
Text Notes 12050 8500 0    50   ~ 0
The address LSB is sampled from the\nbus if ~VGA_RANGE~=LOW and M0=1,\ne. g. MAR=0xdff9, and RI is active.
Text Notes 1100 6950 0    50   ~ 0
~PL~ happens in the middle\nof the first half of the\nclock cycle when the\nVRAM output is still\ncontrolled by the VGA timer.
Text Label 10600 7650 3    50   ~ 0
Bus3
Text Label 10700 7650 3    50   ~ 0
Bus2
Text Label 10800 7650 3    50   ~ 0
Bus1
Text Label 10900 7650 3    50   ~ 0
Bus0
Wire Wire Line
	8450 7650 8350 7650
Wire Wire Line
	10100 8200 8150 8200
Text Notes 8150 8500 0    50   ~ 0
The address MSB is sampled from the\nbus if ~VGA_RANGE~=LOW and M1=1,\ne. g. MAR=0xdffa, and RI is active.
Wire Wire Line
	8150 8200 8150 7650
Wire Wire Line
	10400 7650 10300 7650
Wire Wire Line
	10100 8200 10100 7650
Wire Wire Line
	14300 7650 14200 7650
Wire Wire Line
	12050 8200 12050 7650
Wire Wire Line
	14000 8200 12050 8200
Wire Wire Line
	12350 7650 12250 7650
$Comp
L power:GND #PWR?
U 1 1 60675AA5
P 10100 4600
AR Path="/5F8CD850/60675AA5" Ref="#PWR?"  Part="1" 
AR Path="/60675AA5" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 10100 4350 50  0001 C CNN
F 1 "GND" V 10100 4400 50  0000 C CNN
F 2 "" H 10100 4600 50  0001 C CNN
F 3 "" H 10100 4600 50  0001 C CNN
	1    10100 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60699CB6
P 13900 4600
AR Path="/5F8CD850/60699CB6" Ref="#PWR?"  Part="1" 
AR Path="/60699CB6" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 13900 4350 50  0001 C CNN
F 1 "GND" V 13900 4400 50  0000 C CNN
F 2 "" H 13900 4600 50  0001 C CNN
F 3 "" H 13900 4600 50  0001 C CNN
	1    13900 4600
	1    0    0    -1  
$EndComp
Text Label 12650 7650 3    50   ~ 0
Bus6
Text Label 12550 7650 3    50   ~ 0
Bus7
$Comp
L Device:C C2
U 1 1 607D59BB
P 1000 10850
F 0 "C2" H 950 10950 50  0000 L CNN
F 1 "100nF" H 900 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 1038 10700 50  0001 C CNN
F 3 "~" H 1000 10850 50  0001 C CNN
	1    1000 10850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 607D9E22
P 1250 10850
F 0 "C3" H 1200 10950 50  0000 L CNN
F 1 "100nF" H 1150 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 1288 10700 50  0001 C CNN
F 3 "~" H 1250 10850 50  0001 C CNN
	1    1250 10850
	1    0    0    -1  
$EndComp
Connection ~ 1250 11000
Connection ~ 1250 10700
$Comp
L power:+5V #PWR?
U 1 1 608196EE
P 3900 10700
AR Path="/5F8CD8D4/608196EE" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/608196EE" Ref="#PWR?"  Part="1" 
AR Path="/608196EE" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 3900 10550 50  0001 C CNN
F 1 "+5V" V 3900 10900 50  0000 C CNN
F 2 "" H 3900 10700 50  0001 C CNN
F 3 "" H 3900 10700 50  0001 C CNN
	1    3900 10700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60819CC0
P 3900 11000
AR Path="/5F8CD8D4/60819CC0" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/60819CC0" Ref="#PWR?"  Part="1" 
AR Path="/60819CC0" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 3900 10750 50  0001 C CNN
F 1 "GND" V 3900 10800 50  0000 C CNN
F 2 "" H 3900 11000 50  0001 C CNN
F 3 "" H 3900 11000 50  0001 C CNN
	1    3900 11000
	0    -1   -1   0   
$EndComp
Text Label 5550 5100 2    50   ~ 0
~RI
Wire Wire Line
	14800 5000 14800 6650
Wire Wire Line
	14700 6650 14700 5100
Wire Wire Line
	14600 5200 14600 6650
Wire Wire Line
	14500 6650 14500 5300
Wire Wire Line
	12850 6650 12850 5400
Wire Wire Line
	12750 6650 12750 5500
Wire Wire Line
	12650 6650 12650 5600
Wire Wire Line
	12550 6650 12550 5700
Wire Wire Line
	10900 6650 10900 5800
Wire Wire Line
	10800 6650 10800 5900
Wire Wire Line
	10700 6650 10700 6000
Wire Wire Line
	10600 6650 10600 6100
Wire Wire Line
	8950 6650 8950 6200
Wire Wire Line
	8850 6650 8850 6300
Wire Wire Line
	3600 3350 7800 3350
Wire Wire Line
	3600 2950 7800 2950
Connection ~ 7800 2950
$Comp
L 74xx:74HC04 U3
U 5 1 60AB6996
P 7850 10100
F 0 "U3" V 7850 10150 50  0000 R CNN
F 1 "74HC04" V 7750 10250 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7850 10100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7850 10100 50  0001 C CNN
	5    7850 10100
	1    0    0    -1  
$EndComp
Text Notes 5300 1250 0    50   ~ 0
~INH~ is only LOW if MAR\n= 0b11011111111111xx \n= 0xdffc-0xdfff, i. e. data I/O\n\n~INH~ deactivates RAM/FLASH\naccess on the main board.
Text Label 2700 900  2    50   ~ 0
M3
Text Label 2700 1000 2    50   ~ 0
M4
Text Label 2700 1100 2    50   ~ 0
M5
Text Label 2700 1200 2    50   ~ 0
M6
Text Label 2700 1300 2    50   ~ 0
M7
Text Label 2700 1400 2    50   ~ 0
M8
Text Label 2700 1500 2    50   ~ 0
M9
Text Label 2700 1600 2    50   ~ 0
M10
Text Label 2700 1700 2    50   ~ 0
M11
Text Label 2700 1800 2    50   ~ 0
M12
Text Label 2100 1900 2    50   ~ 0
M13
Text Label 2700 2000 2    50   ~ 0
M14
Text Label 2700 2100 2    50   ~ 0
M15
Wire Wire Line
	3400 1950 3300 1950
Wire Wire Line
	3400 1650 3400 1950
Wire Wire Line
	3500 1650 3400 1650
Wire Wire Line
	3500 1550 3300 1550
Wire Wire Line
	3400 1150 3300 1150
Wire Wire Line
	3400 1450 3400 1150
Wire Wire Line
	3500 1450 3400 1450
Wire Wire Line
	2700 900  3500 900 
Wire Wire Line
	3500 1350 3500 900 
$Comp
L 74xx:74HC04 U3
U 4 1 60A2F95B
P 2400 1900
F 0 "U3" V 2400 1950 50  0000 R CNN
F 1 "74HC04" V 2300 2050 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2400 1900 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2400 1900 50  0001 C CNN
	4    2400 1900
	1    0    0    -1  
$EndComp
$Comp
L Minimal~Expansion:74HC21 U2
U 2 1 60A2F119
P 3800 1500
F 0 "U2" V 3850 1450 50  0000 L CNN
F 1 "74HC21" V 3750 1350 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3800 1500 50  0001 C CNN
F 3 "" H 3800 1500 50  0001 C CNN
	2    3800 1500
	1    0    0    -1  
$EndComp
$Comp
L Minimal~Expansion:74HC21 U2
U 1 1 60A2E759
P 3000 1150
F 0 "U2" V 3050 1100 50  0000 L CNN
F 1 "74HC21" V 2950 1000 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3000 1150 50  0001 C CNN
F 3 "" H 3000 1150 50  0001 C CNN
	1    3000 1150
	1    0    0    -1  
$EndComp
$Comp
L Minimal~Expansion:74HC21 U4
U 2 1 60A2D1BB
P 3000 1550
F 0 "U4" V 3050 1500 50  0000 L CNN
F 1 "74HC21" V 2950 1400 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3000 1550 50  0001 C CNN
F 3 "" H 3000 1550 50  0001 C CNN
	2    3000 1550
	1    0    0    -1  
$EndComp
$Comp
L Minimal~Expansion:74HC21 U4
U 1 1 609F8153
P 3000 1950
F 0 "U4" V 3050 1900 50  0000 L CNN
F 1 "74HC21" V 2950 1800 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3000 1950 50  0001 C CNN
F 3 "" H 3000 1950 50  0001 C CNN
	1    3000 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5FA678D6
P 2950 6950
F 0 "#PWR028" H 2950 6700 50  0001 C CNN
F 1 "GND" H 2955 6777 50  0000 C CNN
F 2 "" H 2950 6950 50  0001 C CNN
F 3 "" H 2950 6950 50  0001 C CNN
	1    2950 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 1650 6550 1400
Wire Wire Line
	6550 1400 4700 1400
$Comp
L power:GND #PWR022
U 1 1 618CF0F8
P 7300 5200
F 0 "#PWR022" H 7300 4950 50  0001 C CNN
F 1 "GND" V 7300 5100 50  0000 R CNN
F 2 "" H 7300 5200 50  0001 C CNN
F 3 "" H 7300 5200 50  0001 C CNN
	1    7300 5200
	0    1    1    0   
$EndComp
Text Label 10000 7650 3    50   ~ 0
~RI
Text Label 11950 7650 3    50   ~ 0
~RI
Text Label 13900 7650 3    50   ~ 0
~RI
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 3 1 61A0BD84
P 1750 4950
AR Path="/5F8CD850/61A0BD84" Ref="U?"  Part="2" 
AR Path="/61A0BD84" Ref="U1"  Part="3" 
F 0 "U1" H 1750 4900 50  0000 C CNN
F 1 "74HC32" H 1750 5000 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1750 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1750 4950 50  0001 C CNN
	3    1750 4950
	0    -1   1    0   
$EndComp
Text Notes 2600 8750 0    50   ~ 0
Buffer is only active while\nVRAM is accessed by th CPU.\n\nIn case of a write access (RI) the data on\nthe bus is present on the RAM's I/O lines.\nAt the same time ~WE~ is LOW forcing the\nRAM's I/O lines to read mode.\n\nIn case of a read access (RO) data from\nthe RAM's I/O lines drives the bus.
Wire Wire Line
	1850 6450 2450 6450
Text Label 6550 2550 3    50   ~ 0
~RO
Wire Wire Line
	2700 800  4100 800 
Text Label 6550 1400 2    50   ~ 0
~INH
Text Label 4600 1700 0    50   ~ 0
VGA_RANGE
Text Label 10700 8300 0    50   ~ 0
VGA_RANGE
$Comp
L Device:C C4
U 1 1 619B4A49
P 1500 10850
F 0 "C4" H 1450 10950 50  0000 L CNN
F 1 "100nF" H 1400 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 1538 10700 50  0001 C CNN
F 3 "~" H 1500 10850 50  0001 C CNN
	1    1500 10850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 619B4A4F
P 1750 10850
F 0 "C5" H 1700 10950 50  0000 L CNN
F 1 "100nF" H 1650 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 1788 10700 50  0001 C CNN
F 3 "~" H 1750 10850 50  0001 C CNN
	1    1750 10850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 619B4A55
P 2000 10850
F 0 "C6" H 1950 10950 50  0000 L CNN
F 1 "100nF" H 1900 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2038 10700 50  0001 C CNN
F 3 "~" H 2000 10850 50  0001 C CNN
	1    2000 10850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 619B4A5B
P 2250 10850
F 0 "C7" H 2200 10950 50  0000 L CNN
F 1 "100nF" H 2150 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2288 10700 50  0001 C CNN
F 3 "~" H 2250 10850 50  0001 C CNN
	1    2250 10850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 619B4A61
P 2500 10850
F 0 "C8" H 2450 10950 50  0000 L CNN
F 1 "100nF" H 2400 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2538 10700 50  0001 C CNN
F 3 "~" H 2500 10850 50  0001 C CNN
	1    2500 10850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 619B4A67
P 2750 10850
F 0 "C9" H 2700 10950 50  0000 L CNN
F 1 "100nF" H 2650 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 2788 10700 50  0001 C CNN
F 3 "~" H 2750 10850 50  0001 C CNN
	1    2750 10850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 619C31C8
P 3000 10850
F 0 "C10" H 2950 10950 50  0000 L CNN
F 1 "100nF" H 2900 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3038 10700 50  0001 C CNN
F 3 "~" H 3000 10850 50  0001 C CNN
	1    3000 10850
	1    0    0    -1  
$EndComp
Connection ~ 2000 10700
Wire Wire Line
	2000 10700 2250 10700
Connection ~ 2250 10700
Wire Wire Line
	2250 10700 2500 10700
Connection ~ 2500 10700
Wire Wire Line
	2500 10700 2750 10700
Connection ~ 2750 10700
Wire Wire Line
	2750 10700 3000 10700
Connection ~ 3000 10700
Connection ~ 2000 11000
Connection ~ 2250 11000
Wire Wire Line
	2250 11000 2000 11000
Connection ~ 2500 11000
Wire Wire Line
	2500 11000 2250 11000
Connection ~ 2750 11000
Wire Wire Line
	2750 11000 2500 11000
Connection ~ 3000 11000
Wire Wire Line
	3000 11000 2750 11000
Text GLabel 8450 7650 3    50   Input ~ 0
~T_VRAM
Text GLabel 10400 7650 3    50   Input ~ 0
~T_VRAM
Text GLabel 12350 7650 3    50   Input ~ 0
~T_VRAM
Text GLabel 14300 7650 3    50   Input ~ 0
~T_VRAM
Text GLabel 10000 4600 3    50   Input ~ 0
T_VRAM
Text GLabel 13800 4600 3    50   Input ~ 0
T_VRAM
Text GLabel 1650 5250 0    50   Output ~ 0
T_VRAM
Wire Wire Line
	4100 1300 4100 800 
Wire Wire Line
	1950 5850 1950 4650
Wire Wire Line
	1750 5250 1650 5250
Connection ~ 1750 5250
Text GLabel 7950 7650 3    50   Input ~ 0
2MHz
Text GLabel 9900 7650 3    50   Input ~ 0
2MHz
Text GLabel 11850 7650 3    50   Input ~ 0
2MHz
Text GLabel 13800 7650 3    50   Input ~ 0
2MHz
Wire Wire Line
	1250 10700 1500 10700
Wire Wire Line
	1250 11000 1500 11000
Connection ~ 1500 10700
Wire Wire Line
	1500 10700 1750 10700
Connection ~ 1500 11000
Wire Wire Line
	1500 11000 1750 11000
Connection ~ 1750 10700
Wire Wire Line
	1750 10700 2000 10700
Connection ~ 1750 11000
Wire Wire Line
	1750 11000 2000 11000
Wire Wire Line
	3000 10700 3250 10700
Wire Wire Line
	3000 11000 3250 11000
Text Label 6650 2550 3    50   ~ 0
CLOCK
$Comp
L Device:CP C1
U 1 1 61B0F524
P 750 10850
F 0 "C1" H 700 10950 50  0000 L CNN
F 1 "47µF" H 650 10750 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 750 10850 50  0001 C CNN
F 3 "~" H 750 10850 50  0001 C CNN
	1    750  10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  10750 750  10700
Wire Wire Line
	750  10700 1000 10700
Wire Wire Line
	750  10950 750  11000
Wire Wire Line
	750  11000 1000 11000
Connection ~ 1000 10700
Wire Wire Line
	1000 10700 1250 10700
Connection ~ 1000 11000
Wire Wire Line
	1000 11000 1250 11000
Text GLabel 10800 1450 1    50   Input ~ 0
2MHz
Text GLabel 14600 1450 1    50   Input ~ 0
2MHz
Text Label 2050 4050 1    50   ~ 0
CLOCK
Text GLabel 6150 5200 0    50   Input ~ 0
~2MHz
$Comp
L Device:C C11
U 1 1 61A7D511
P 1500 4050
F 0 "C11" V 1650 4000 50  0000 L CNN
F 1 "100pF" V 1350 3950 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 1538 3900 50  0001 C CNN
F 3 "~" H 1500 4050 50  0001 C CNN
	1    1500 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	1650 4050 1850 4050
$Comp
L power:GND #PWR0102
U 1 1 61A8BA38
P 1350 4050
F 0 "#PWR0102" H 1350 3800 50  0001 C CNN
F 1 "GND" V 1350 3950 50  0000 R CNN
F 2 "" H 1350 4050 50  0001 C CNN
F 3 "" H 1350 4050 50  0001 C CNN
	1    1350 4050
	1    0    0    -1  
$EndComp
Text Notes 1100 3700 0    50   ~ 0
For a stable ~PL~, signals must\nrise simultaneously. Since CLOCK\ndrives a lot of ICs, 4MHz needs\nan additional capacitive load.
Connection ~ 750  10700
Connection ~ 750  11000
Text Label 14700 2500 1    50   ~ 0
H2
Text Label 14600 2500 1    50   ~ 0
H4
Text Label 14500 2500 1    50   ~ 0
H8
Text Label 14400 2500 1    50   ~ 0
H16
Text Label 14300 2500 1    50   ~ 0
H32
Text Label 14100 2500 1    50   ~ 0
V1
Text Label 11000 2450 1    50   ~ 0
V2
Text Label 10900 2450 1    50   ~ 0
V4
Text Label 10300 2450 1    50   ~ 0
V256
Text Label 14800 2500 1    50   ~ 0
H1
Text Label 10800 2450 1    50   ~ 0
V8
Text Label 10700 2450 1    50   ~ 0
V16
Text Label 10600 2450 1    50   ~ 0
V32
Text Label 10500 2450 1    50   ~ 0
V64
Text Label 10400 2450 1    50   ~ 0
V128
Wire Wire Line
	9000 2500 10900 2500
Connection ~ 8400 2400
Wire Wire Line
	14100 2250 14100 3050
Wire Wire Line
	14100 3050 9000 3050
Wire Wire Line
	9000 3050 9000 2950
Connection ~ 14100 3050
Wire Wire Line
	14100 3050 14100 3600
Wire Wire Line
	9000 3050 9000 3150
Connection ~ 9000 3050
Wire Wire Line
	1850 4650 1950 4650
Connection ~ 1950 4650
Wire Wire Line
	2450 5350 2450 3850
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 5 1 60655134
P 1250 9600
AR Path="/5F8CD850/60655134" Ref="U?"  Part="5" 
AR Path="/60655134" Ref="U8"  Part="5" 
F 0 "U8" V 1150 9600 50  0000 C CNN
F 1 "74HC32" V 1350 9600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1250 9600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1250 9600 50  0001 C CNN
	5    1250 9600
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60655140
P 1750 9600
AR Path="/5F8CD8D4/60655140" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/60655140" Ref="#PWR?"  Part="1" 
AR Path="/60655140" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 1750 9450 50  0001 C CNN
F 1 "+5V" H 1765 9773 50  0000 C CNN
F 2 "" H 1750 9600 50  0001 C CNN
F 3 "" H 1750 9600 50  0001 C CNN
	1    1750 9600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61888EB7
P 4150 10100
AR Path="/5F8CD8D4/61888EB7" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/61888EB7" Ref="#PWR?"  Part="1" 
AR Path="/61888EB7" Ref="#PWR053"  Part="1" 
F 0 "#PWR053" H 4150 9950 50  0001 C CNN
F 1 "+5V" H 4165 10273 50  0000 C CNN
F 2 "" H 4150 10100 50  0001 C CNN
F 3 "" H 4150 10100 50  0001 C CNN
	1    4150 10100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61889473
P 3150 10100
AR Path="/5F8CD8D4/61889473" Ref="#PWR?"  Part="1" 
AR Path="/61889473" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 3150 9850 50  0001 C CNN
F 1 "GND" H 3155 9927 50  0000 C CNN
F 2 "" H 3150 10100 50  0001 C CNN
F 3 "" H 3150 10100 50  0001 C CNN
	1    3150 10100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61B12082
P 750 9600
AR Path="/5F8CD8D4/61B12082" Ref="#PWR?"  Part="1" 
AR Path="/61B12082" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 750 9350 50  0001 C CNN
F 1 "GND" H 755 9427 50  0000 C CNN
F 2 "" H 750 9600 50  0001 C CNN
F 3 "" H 750 9600 50  0001 C CNN
	1    750  9600
	1    0    0    -1  
$EndComp
Text Notes 5950 9350 0    50   ~ 0
buffers the system clock to reduce capacitive load
Text GLabel 7000 9600 2    50   Output ~ 0
2MHz
Text Label 5800 9600 2    50   ~ 0
CLOCK
Wire Wire Line
	6400 10000 6400 10200
Text GLabel 4750 10800 2    50   Output ~ 0
4MHz
Text GLabel 4750 10900 2    50   Output ~ 0
16MHz
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 61ACC202
P 4550 10800
F 0 "J3" H 4600 10550 50  0000 R CNN
F 1 "EXT CLOCK" H 5150 10550 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4550 10800 50  0001 C CNN
F 3 "~" H 4550 10800 50  0001 C CNN
	1    4550 10800
	1    0    0    -1  
$EndComp
Text Label 8150 10100 0    50   ~ 0
RO
Text Label 7550 10100 2    50   ~ 0
~RO
Text Label 8150 9600 0    50   ~ 0
~RI
Text GLabel 6400 10100 0    50   Input ~ 0
16MHz
$Comp
L 74xx:74HC04 U3
U 6 1 60BD1BBE
P 7850 10850
F 0 "U3" V 7850 10900 50  0000 R CNN
F 1 "74HC04" V 7750 11000 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7850 10850 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7850 10850 50  0001 C CNN
	6    7850 10850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC04 U3
U 3 1 60B032E1
P 7850 9600
F 0 "U3" V 7850 9650 50  0000 R CNN
F 1 "74HC04" V 7750 9750 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 7850 9600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 7850 9600 50  0001 C CNN
	3    7850 9600
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60655158
P 5350 10100
AR Path="/5F8CD8D4/60655158" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/60655158" Ref="#PWR?"  Part="1" 
AR Path="/60655158" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 5350 9950 50  0001 C CNN
F 1 "+5V" H 5350 10250 50  0000 C CNN
F 2 "" H 5350 10100 50  0001 C CNN
F 3 "" H 5350 10100 50  0001 C CNN
	1    5350 10100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60655152
P 5350 9600
AR Path="/5F8CD8D4/60655152" Ref="#PWR?"  Part="1" 
AR Path="/60655152" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 5350 9450 50  0001 C CNN
F 1 "+5V" H 5365 9773 50  0000 C CNN
F 2 "" H 5350 9600 50  0001 C CNN
F 3 "" H 5350 9600 50  0001 C CNN
	1    5350 9600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6065514C
P 4350 10100
AR Path="/5F8CD8D4/6065514C" Ref="#PWR?"  Part="1" 
AR Path="/6065514C" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 4350 9850 50  0001 C CNN
F 1 "GND" H 4355 9927 50  0000 C CNN
F 2 "" H 4350 10100 50  0001 C CNN
F 3 "" H 4350 10100 50  0001 C CNN
	1    4350 10100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60655146
P 4350 9600
AR Path="/5F8CD8D4/60655146" Ref="#PWR?"  Part="1" 
AR Path="/60655146" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 4350 9350 50  0001 C CNN
F 1 "GND" H 4355 9427 50  0000 C CNN
F 2 "" H 4350 9600 50  0001 C CNN
F 3 "" H 4350 9600 50  0001 C CNN
	1    4350 9600
	1    0    0    -1  
$EndComp
$Comp
L Minimal~Expansion:74HC21 U4
U 3 1 6065512E
P 4850 9600
F 0 "U4" V 4950 9550 50  0000 L CNN
F 1 "74HC21" V 4750 9450 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4850 9600 50  0001 C CNN
F 3 "" H 4850 9600 50  0001 C CNN
	3    4850 9600
	0    1    1    0   
$EndComp
$Comp
L Minimal~Expansion:74HC21 U2
U 3 1 60655128
P 4850 10100
F 0 "U2" V 4950 10050 50  0000 L CNN
F 1 "74HC21" V 4750 9950 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4850 10100 50  0001 C CNN
F 3 "" H 4850 10100 50  0001 C CNN
	3    4850 10100
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC04 U3
U 7 1 60655122
P 2450 10100
F 0 "U3" V 2350 10150 50  0000 R CNN
F 1 "74HC04" V 2550 10250 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2450 10100 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 2450 10100 50  0001 C CNN
	7    2450 10100
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6065511C
P 1750 10100
AR Path="/5F8CD8D4/6065511C" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/6065511C" Ref="#PWR?"  Part="1" 
AR Path="/6065511C" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 1750 9950 50  0001 C CNN
F 1 "+5V" H 1765 10273 50  0000 C CNN
F 2 "" H 1750 10100 50  0001 C CNN
F 3 "" H 1750 10100 50  0001 C CNN
	1    1750 10100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60655116
P 750 10100
AR Path="/5F8CD8D4/60655116" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/60655116" Ref="#PWR?"  Part="1" 
AR Path="/60655116" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 750 9850 50  0001 C CNN
F 1 "GND" H 755 9927 50  0000 C CNN
F 2 "" H 750 10100 50  0001 C CNN
F 3 "" H 750 10100 50  0001 C CNN
	1    750  10100
	1    0    0    -1  
$EndComp
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 5 1 60655110
P 1250 10100
AR Path="/5F8CD850/60655110" Ref="U?"  Part="5" 
AR Path="/60655110" Ref="U1"  Part="5" 
F 0 "U1" V 1150 10100 50  0000 C CNN
F 1 "74HC32" V 1350 10100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1250 10100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1250 10100 50  0001 C CNN
	5    1250 10100
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6065510A
P 4150 9600
AR Path="/5F8CD8D4/6065510A" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/6065510A" Ref="#PWR?"  Part="1" 
AR Path="/6065510A" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 4150 9450 50  0001 C CNN
F 1 "+5V" H 4150 9750 50  0000 C CNN
F 2 "" H 4150 9600 50  0001 C CNN
F 3 "" H 4150 9600 50  0001 C CNN
	1    4150 9600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60655104
P 3150 9600
AR Path="/5F8CD8D4/60655104" Ref="#PWR?"  Part="1" 
AR Path="/5F8CD850/60655104" Ref="#PWR?"  Part="1" 
AR Path="/60655104" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 3150 9350 50  0001 C CNN
F 1 "GND" H 3155 9427 50  0000 C CNN
F 2 "" H 3150 9600 50  0001 C CNN
F 3 "" H 3150 9600 50  0001 C CNN
	1    3150 9600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 606550FE
P 3650 9600
AR Path="/5F8CD8D4/606550FE" Ref="U?"  Part="5" 
AR Path="/5F8CD850/606550FE" Ref="U?"  Part="5" 
AR Path="/606550FE" Ref="U11"  Part="5" 
F 0 "U11" V 3550 9600 50  0000 C CNN
F 1 "74HC00" V 3750 9600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3650 9600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3650 9600 50  0001 C CNN
	5    3650 9600
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 606550F8
P 2950 10100
AR Path="/5F8CD8D4/606550F8" Ref="#PWR?"  Part="1" 
AR Path="/606550F8" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 2950 9950 50  0001 C CNN
F 1 "+5V" H 2965 10273 50  0000 C CNN
F 2 "" H 2950 10100 50  0001 C CNN
F 3 "" H 2950 10100 50  0001 C CNN
	1    2950 10100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 606550F2
P 1950 10100
AR Path="/5F8CD8D4/606550F2" Ref="#PWR?"  Part="1" 
AR Path="/606550F2" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 1950 9850 50  0001 C CNN
F 1 "GND" H 1955 9927 50  0000 C CNN
F 2 "" H 1950 10100 50  0001 C CNN
F 3 "" H 1950 10100 50  0001 C CNN
	1    1950 10100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 606550EC
P 2950 9600
AR Path="/5F8CD8D4/606550EC" Ref="#PWR?"  Part="1" 
AR Path="/606550EC" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 2950 9450 50  0001 C CNN
F 1 "+5V" H 2965 9773 50  0000 C CNN
F 2 "" H 2950 9600 50  0001 C CNN
F 3 "" H 2950 9600 50  0001 C CNN
	1    2950 9600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 606550E6
P 1950 9600
AR Path="/5F8CD8D4/606550E6" Ref="#PWR?"  Part="1" 
AR Path="/606550E6" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 1950 9350 50  0001 C CNN
F 1 "GND" H 1955 9427 50  0000 C CNN
F 2 "" H 1950 9600 50  0001 C CNN
F 3 "" H 1950 9600 50  0001 C CNN
	1    1950 9600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 606550E0
P 2450 9600
AR Path="/5F8CD8D4/606550E0" Ref="U?"  Part="5" 
AR Path="/606550E0" Ref="U7"  Part="5" 
F 0 "U7" V 2350 9600 50  0000 C CNN
F 1 "74HC00" V 2550 9600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 2450 9600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 2450 9600 50  0001 C CNN
	5    2450 9600
	0    1    1    0   
$EndComp
Text Label 7550 9600 2    50   ~ 0
RI
$Comp
L 74xx:74HC04 U3
U 2 1 5FC9BC6F
P 6700 9600
F 0 "U3" V 6700 9650 50  0000 R CNN
F 1 "74HC04" V 6600 9750 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6700 9600 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6700 9600 50  0001 C CNN
	2    6700 9600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U11
U 3 1 5FBBAF01
P 6700 10100
F 0 "U11" H 6700 10050 50  0000 C CNN
F 1 "74HC00" H 6700 10150 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6700 10100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6700 10100 50  0001 C CNN
	3    6700 10100
	1    0    0    -1  
$EndComp
Text GLabel 7000 10100 2    50   Output ~ 0
PIXEL
Text GLabel 1650 5850 0    50   Output ~ 0
~T_VRAM
Wire Wire Line
	1750 5850 1650 5850
Connection ~ 1750 5850
Text GLabel 7000 9850 2    50   Output ~ 0
~2MHz
$Comp
L 74xx:74HC00 U11
U 1 1 619B813D
P 14300 8200
F 0 "U11" H 14300 8150 50  0000 C CNN
F 1 "74HC00" H 14300 8250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 14300 8200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 14300 8200 50  0001 C CNN
	1    14300 8200
	-1   0    0    1   
$EndComp
Connection ~ 14000 8200
$Comp
L 74xx:74HC00 U11
U 2 1 619BD083
P 10400 8200
F 0 "U11" H 10400 8150 50  0000 C CNN
F 1 "74HC00" H 10400 8250 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 10400 8200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 10400 8200 50  0001 C CNN
	2    10400 8200
	-1   0    0    1   
$EndComp
Connection ~ 10100 8200
Text Label 10700 8100 0    50   ~ 0
M1
Text Label 14600 8300 0    50   ~ 0
VGA_RANGE
$Comp
L 74xx:74HC00 U19
U 1 1 619C1B77
P 1750 5550
F 0 "U19" H 1750 5500 50  0000 C CNN
F 1 "74HC00" H 1750 5600 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 1750 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 1750 5550 50  0001 C CNN
	1    1750 5550
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC00 U19
U 4 1 619C24D9
P 6700 10850
F 0 "U19" H 6700 10800 50  0000 C CNN
F 1 "74HC00" H 6700 10900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6700 10850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6700 10850 50  0001 C CNN
	4    6700 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 5250 1750 5250
Wire Wire Line
	7000 9850 6400 9850
Wire Wire Line
	6400 9850 6400 9600
Connection ~ 6400 9600
$Comp
L 74xx:74HC00 U?
U 5 1 61969288
P 3650 10100
AR Path="/5F8CD8D4/61969288" Ref="U?"  Part="5" 
AR Path="/61969288" Ref="U19"  Part="5" 
F 0 "U19" V 3550 10100 50  0000 C CNN
F 1 "74HC00" V 3750 10100 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3650 10100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 3650 10100 50  0001 C CNN
	5    3650 10100
	0    1    1    0   
$EndComp
NoConn ~ 7000 10850
$Comp
L power:GND #PWR0103
U 1 1 6198652C
P 6400 10750
F 0 "#PWR0103" H 6400 10500 50  0001 C CNN
F 1 "GND" V 6400 10550 50  0000 C CNN
F 2 "" H 6400 10750 50  0001 C CNN
F 3 "" H 6400 10750 50  0001 C CNN
	1    6400 10750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 61991F8B
P 6400 10950
F 0 "#PWR0104" H 6400 10700 50  0001 C CNN
F 1 "GND" V 6400 10750 50  0000 C CNN
F 2 "" H 6400 10950 50  0001 C CNN
F 3 "" H 6400 10950 50  0001 C CNN
	1    6400 10950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 619922C1
P 7550 10850
F 0 "#PWR0105" H 7550 10600 50  0001 C CNN
F 1 "GND" V 7550 10650 50  0000 C CNN
F 2 "" H 7550 10850 50  0001 C CNN
F 3 "" H 7550 10850 50  0001 C CNN
	1    7550 10850
	0    1    1    0   
$EndComp
NoConn ~ 8150 10850
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 4 1 60956DCA
P 5850 5000
AR Path="/5F8CD850/60956DCA" Ref="U?"  Part="2" 
AR Path="/60956DCA" Ref="U8"  Part="4" 
F 0 "U8" H 5850 4950 50  0000 C CNN
F 1 "74HC32" H 5850 5050 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5850 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5850 5000 50  0001 C CNN
	4    5850 5000
	1    0    0    1   
$EndComp
$Comp
L Device:C C12
U 1 1 61BE79DA
P 3250 10850
F 0 "C12" H 3200 10950 50  0000 L CNN
F 1 "100nF" H 3150 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3288 10700 50  0001 C CNN
F 3 "~" H 3250 10850 50  0001 C CNN
	1    3250 10850
	1    0    0    -1  
$EndComp
Connection ~ 3250 10700
Wire Wire Line
	3250 10700 3500 10700
Connection ~ 3250 11000
Wire Wire Line
	3250 11000 3500 11000
$Comp
L Device:C C13
U 1 1 61C2BFB0
P 3500 10850
F 0 "C13" H 3450 10950 50  0000 L CNN
F 1 "100nF" H 3400 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3538 10700 50  0001 C CNN
F 3 "~" H 3500 10850 50  0001 C CNN
	1    3500 10850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 61C2BFBA
P 3750 10850
F 0 "C14" H 3700 10950 50  0000 L CNN
F 1 "100nF" H 3650 10750 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 3788 10700 50  0001 C CNN
F 3 "~" H 3750 10850 50  0001 C CNN
	1    3750 10850
	1    0    0    -1  
$EndComp
Connection ~ 3500 10700
Wire Wire Line
	3500 10700 3750 10700
Connection ~ 3500 11000
Wire Wire Line
	3500 11000 3750 11000
Connection ~ 3750 10700
Wire Wire Line
	3750 10700 3900 10700
Connection ~ 3750 11000
Wire Wire Line
	3750 11000 3900 11000
Text Notes 5950 10400 0    50   ~ 0
aligns pixel shift with parallel load
Wire Wire Line
	8300 5400 12850 5400
Wire Wire Line
	8300 5500 12750 5500
Wire Wire Line
	8300 5600 12650 5600
Wire Wire Line
	8300 6200 8950 6200
Wire Wire Line
	8300 6300 8850 6300
Connection ~ 8850 6300
Wire Wire Line
	8850 6300 10400 6300
Connection ~ 8950 6200
Wire Wire Line
	8950 6200 10500 6200
Connection ~ 10600 6100
Connection ~ 10700 6000
Connection ~ 10800 5900
Connection ~ 10900 5800
Connection ~ 12650 5600
Wire Wire Line
	12650 5600 14100 5600
Connection ~ 12750 5500
Wire Wire Line
	12750 5500 14300 5500
Connection ~ 12850 5400
Wire Wire Line
	12850 5400 14400 5400
Connection ~ 14500 5300
Connection ~ 14600 5200
Connection ~ 14700 5100
Connection ~ 14800 5000
Wire Wire Line
	4100 1500 4100 1700
Connection ~ 4100 1500
Wire Wire Line
	4100 1700 4600 1700
Text Notes 4100 2050 0    50   ~ 0
VGA_RANGE is HIGH if MAR\n= 0b1101111111111xxx \n= 0xdff8-0xdfff
Wire Wire Line
	3450 6150 5900 6150
Wire Wire Line
	3450 6050 6000 6050
Wire Wire Line
	3450 5950 6100 5950
Wire Wire Line
	3450 5850 6200 5850
$Comp
L 74xx:74HC00 U19
U 3 1 5FBB490E
P 4700 6750
F 0 "U19" H 4700 6700 50  0000 C CNN
F 1 "74HC00" H 4700 6800 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4700 6750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 4700 6750 50  0001 C CNN
	3    4700 6750
	1    0    0    1   
$EndComp
Text Label 5000 6550 2    50   ~ 0
~INH
Text GLabel 4400 6650 0    50   Input ~ 0
T_VRAM
Text Label 5700 6650 1    50   ~ 0
RO
Text Label 3800 6950 2    50   ~ 0
RO
Text Label 3800 6750 2    50   ~ 0
RI
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 2 1 61930AD7
P 5300 6650
AR Path="/5F8CD850/61930AD7" Ref="U?"  Part="2" 
AR Path="/61930AD7" Ref="U8"  Part="2" 
F 0 "U8" H 5300 6600 50  0000 C CNN
F 1 "74HC32" H 5300 6700 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5300 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5300 6650 50  0001 C CNN
	2    5300 6650
	1    0    0    1   
$EndComp
$Comp
L VideoRAM-rescue:74HC32-8-Bit_CPU_32k U?
U 1 1 6188C861
P 4100 6850
AR Path="/5F8CD850/6188C861" Ref="U?"  Part="2" 
AR Path="/6188C861" Ref="U8"  Part="1" 
F 0 "U8" H 4100 6800 50  0000 C CNN
F 1 "74HC32" H 4100 6900 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 4100 6850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4100 6850 50  0001 C CNN
	1    4100 6850
	1    0    0    -1  
$EndComp
$Comp
L VideoRAM-rescue:74HC245-8-Bit_CPU_32k U14
U 1 1 618CDAFF
P 6100 7150
F 0 "U14" V 6050 7100 50  0000 L CNN
F 1 "74HC245" V 6150 6950 50  0000 L CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 6100 7150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 6100 7150 50  0001 C CNN
	1    6100 7150
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR030
U 1 1 60B82F70
P 6900 7150
F 0 "#PWR030" H 6900 7000 50  0001 C CNN
F 1 "+5V" H 6900 7300 50  0000 C CNN
F 2 "" H 6900 7150 50  0001 C CNN
F 3 "" H 6900 7150 50  0001 C CNN
	1    6900 7150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 60B82419
P 5300 7150
F 0 "#PWR029" H 5300 6900 50  0001 C CNN
F 1 "GND" H 5150 7100 50  0000 C CNN
F 2 "" H 5300 7150 50  0001 C CNN
F 3 "" H 5300 7150 50  0001 C CNN
	1    5300 7150
	1    0    0    -1  
$EndComp
Text Label 5900 7650 3    50   ~ 0
Bus7
Text Label 6000 7650 3    50   ~ 0
Bus6
Text Label 6100 7650 3    50   ~ 0
Bus5
Text Label 6200 7650 3    50   ~ 0
Bus4
Text Label 6300 7650 3    50   ~ 0
Bus3
Text Label 6400 7650 3    50   ~ 0
Bus2
Text Label 6500 7650 3    50   ~ 0
Bus1
Text Label 6600 7650 3    50   ~ 0
Bus0
Wire Wire Line
	6200 6650 6200 5850
Wire Wire Line
	6100 6650 6100 5950
Wire Wire Line
	6000 6050 6000 6650
Wire Wire Line
	5900 6650 5900 6150
NoConn ~ 8650 6650
NoConn ~ 8750 6650
Connection ~ 5900 6150
Connection ~ 6000 6050
Connection ~ 6100 5950
Connection ~ 6200 5850
Wire Wire Line
	6200 5850 7300 5850
Wire Wire Line
	3450 5450 6600 5450
Wire Wire Line
	6600 6650 6600 5450
Connection ~ 6600 5450
Wire Wire Line
	6600 5450 7300 5450
Wire Wire Line
	3450 5550 6500 5550
Wire Wire Line
	6100 5950 7300 5950
Wire Wire Line
	6000 6050 7300 6050
Wire Wire Line
	3450 5650 6400 5650
Wire Wire Line
	3450 5750 6300 5750
Wire Wire Line
	5900 6150 7300 6150
Wire Wire Line
	6500 6650 6500 5550
Connection ~ 6500 5550
Wire Wire Line
	6500 5550 7300 5550
Wire Wire Line
	6400 5650 6400 6650
Connection ~ 6400 5650
Wire Wire Line
	6400 5650 7300 5650
Wire Wire Line
	6300 6650 6300 5750
Connection ~ 6300 5750
Wire Wire Line
	6300 5750 7300 5750
Wire Wire Line
	6750 5100 7300 5100
$EndSCHEMATC
