EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 8268 11693 portrait
encoding utf-8
Sheet 1 9
Title "Minimal UART Computer (FLASH Edition)"
Date "2021-03-10"
Rev "1.3.2"
Comp ""
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
$Sheet
S 5100 5200 650  1150
U 5EC573DA
F0 "Reg A" 50
F1 "RegA.sch" 50
F2 "BUS0" B L 5100 5300 50 
F3 "BUS1" B L 5100 5400 50 
F4 "BUS2" B L 5100 5500 50 
F5 "BUS3" B L 5100 5600 50 
F6 "BUS4" B L 5100 5700 50 
F7 "BUS5" B L 5100 5800 50 
F8 "BUS6" B L 5100 5900 50 
F9 "BUS7" B L 5100 6000 50 
F10 "~AI" I L 5100 6250 50 
F11 "~AO" I L 5100 6150 50 
F12 "R0" O R 5750 5300 50 
F13 "R1" O R 5750 5400 50 
F14 "R2" O R 5750 5500 50 
F15 "R3" O R 5750 5600 50 
F16 "R4" O R 5750 5700 50 
F17 "R5" O R 5750 5800 50 
F18 "R6" O R 5750 5900 50 
F19 "R7" O R 5750 6000 50 
$EndSheet
$Sheet
S 6200 3050 650  3750
U 5EC57909
F0 "ALU" 50
F1 "ALU.sch" 50
F2 "BUS0" O L 6200 4350 50 
F3 "BUS1" O L 6200 4450 50 
F4 "BUS2" O L 6200 4550 50 
F5 "BUS3" O L 6200 4650 50 
F6 "BUS4" O L 6200 4750 50 
F7 "BUS5" O L 6200 4850 50 
F8 "BUS6" O L 6200 4950 50 
F9 "BUS7" O L 6200 5050 50 
F10 "A0" I L 6200 5300 50 
F11 "A1" I L 6200 5400 50 
F12 "A2" I L 6200 5500 50 
F13 "A3" I L 6200 5600 50 
F14 "A4" I L 6200 5700 50 
F15 "A5" I L 6200 5800 50 
F16 "A6" I L 6200 5900 50 
F17 "A7" I L 6200 6000 50 
F18 "B0" I L 6200 3150 50 
F19 "B1" I L 6200 3250 50 
F20 "B2" I L 6200 3350 50 
F21 "B3" I L 6200 3450 50 
F22 "B4" I L 6200 3550 50 
F23 "B5" I L 6200 3650 50 
F24 "B6" I L 6200 3750 50 
F25 "B7" I L 6200 3850 50 
F26 "~EO" I R 6850 6500 50 
F27 "ES" I R 6850 6600 50 
F28 "EC" I R 6850 6700 50 
F29 "FLAG_C" O L 6200 6500 50 
F30 "FLAG_Z" O L 6200 6600 50 
F31 "FLAG_N" O L 6200 6700 50 
$EndSheet
Wire Wire Line
	5750 5300 6200 5300
Wire Wire Line
	6200 5400 5750 5400
Wire Wire Line
	5750 5500 6200 5500
Wire Wire Line
	5750 5600 6200 5600
Wire Wire Line
	5750 5700 6200 5700
Wire Wire Line
	5750 5800 6200 5800
Wire Wire Line
	5750 5900 6200 5900
Wire Wire Line
	5750 6000 6200 6000
Connection ~ 4650 7200
Connection ~ 4550 7300
Wire Wire Line
	5100 7400 4450 7400
Connection ~ 4450 7400
Wire Wire Line
	5100 7500 4350 7500
Connection ~ 4350 7500
Wire Wire Line
	5100 7600 4250 7600
Connection ~ 4250 7600
Wire Wire Line
	5100 7700 4150 7700
Connection ~ 4150 7700
Wire Wire Line
	5100 7800 4050 7800
Connection ~ 4050 7800
Wire Wire Line
	5100 7900 3950 7900
Connection ~ 3950 7900
Wire Wire Line
	4650 4350 6200 4350
Wire Wire Line
	4550 4450 6200 4450
Wire Wire Line
	4450 4550 6200 4550
Wire Wire Line
	4350 4650 6200 4650
Wire Wire Line
	4250 4750 6200 4750
Wire Wire Line
	4150 4850 6200 4850
Wire Wire Line
	4050 4950 6200 4950
Wire Wire Line
	3950 5050 6200 5050
Wire Wire Line
	5100 5300 4650 5300
Connection ~ 4650 5300
Wire Wire Line
	4650 5300 4650 7200
Wire Wire Line
	5100 5400 4550 5400
Connection ~ 4550 5400
Wire Wire Line
	4550 5400 4550 7300
Wire Wire Line
	5100 5500 4450 5500
Connection ~ 4450 5500
Wire Wire Line
	4450 5500 4450 7400
Wire Wire Line
	5100 5600 4350 5600
Connection ~ 4350 5600
Wire Wire Line
	4350 5600 4350 7500
Wire Wire Line
	5100 5700 4250 5700
Connection ~ 4250 5700
Wire Wire Line
	4250 5700 4250 7600
Wire Wire Line
	4150 5800 5100 5800
Connection ~ 4150 5800
Wire Wire Line
	4150 5800 4150 7700
Wire Wire Line
	5100 5900 4050 5900
Connection ~ 4050 5900
Wire Wire Line
	4050 5900 4050 7800
Wire Wire Line
	3950 6000 5100 6000
Connection ~ 3950 6000
Wire Wire Line
	3950 6000 3950 7900
Wire Wire Line
	2500 6700 2400 6700
Wire Wire Line
	2400 6700 2400 7200
$Comp
L Device:R R1
U 1 1 5EF6AFDA
P 3950 8150
F 0 "R1" V 4000 7950 50  0000 L CNN
F 1 "470" V 3950 8050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3880 8150 50  0001 C CNN
F 3 "~" H 3950 8150 50  0001 C CNN
	1    3950 8150
	-1   0    0    1   
$EndComp
Wire Wire Line
	2250 6250 2500 6250
Wire Wire Line
	2250 6250 2250 7450
Wire Wire Line
	1950 8550 6000 8550
Wire Wire Line
	2500 5300 2050 5300
Wire Wire Line
	2050 8450 5900 8450
Wire Wire Line
	3150 3750 3400 3750
Wire Wire Line
	3450 3850 3150 3850
Wire Wire Line
	3150 5300 4650 5300
Wire Wire Line
	4550 5400 3150 5400
Wire Wire Line
	3150 5500 4450 5500
Wire Wire Line
	4350 5600 3150 5600
Wire Wire Line
	3150 5700 4250 5700
Wire Wire Line
	4150 5800 3150 5800
Wire Wire Line
	3150 7200 4650 7200
Wire Wire Line
	3150 7300 4550 7300
Wire Wire Line
	4450 7400 3150 7400
Wire Wire Line
	3150 7500 4350 7500
Wire Wire Line
	4250 7600 3150 7600
Wire Wire Line
	3150 7700 4150 7700
Wire Wire Line
	4050 7800 3150 7800
Wire Wire Line
	3150 7900 3950 7900
Connection ~ 4250 8300
$Comp
L Device:R R4
U 1 1 5ED8EC6D
P 4250 8150
F 0 "R4" V 4200 8250 50  0000 L CNN
F 1 "470" V 4250 8100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4180 8150 50  0001 C CNN
F 3 "~" H 4250 8150 50  0001 C CNN
	1    4250 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 8300 4350 8300
Connection ~ 4350 8300
$Comp
L Device:R R5
U 1 1 5ED8E729
P 4350 8150
F 0 "R5" V 4300 8250 50  0000 L CNN
F 1 "470" V 4350 8100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4280 8150 50  0001 C CNN
F 3 "~" H 4350 8150 50  0001 C CNN
	1    4350 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 8300 4450 8300
Connection ~ 4450 8300
$Comp
L Device:R R6
U 1 1 5ED8E208
P 4450 8150
F 0 "R6" V 4400 8250 50  0000 L CNN
F 1 "470" V 4450 8100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4380 8150 50  0001 C CNN
F 3 "~" H 4450 8150 50  0001 C CNN
	1    4450 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 8300 4550 8300
Connection ~ 4550 8300
$Comp
L Device:R R7
U 1 1 5ED8DB17
P 4550 8150
F 0 "R7" V 4500 8250 50  0000 L CNN
F 1 "470" V 4550 8100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4480 8150 50  0001 C CNN
F 3 "~" H 4550 8150 50  0001 C CNN
	1    4550 8150
	1    0    0    -1  
$EndComp
Connection ~ 4650 8300
Wire Wire Line
	4550 8300 4650 8300
$Comp
L Device:R R8
U 1 1 5ED0FC24
P 4650 8150
F 0 "R8" V 4600 8250 50  0000 L CNN
F 1 "470" V 4650 8100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4580 8150 50  0001 C CNN
F 3 "~" H 4650 8150 50  0001 C CNN
	1    4650 8150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5ED8F666
P 4050 8150
F 0 "R2" V 4000 8250 50  0000 L CNN
F 1 "470" V 4050 8100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3980 8150 50  0001 C CNN
F 3 "~" H 4050 8150 50  0001 C CNN
	1    4050 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3250 3400 3750
Wire Wire Line
	4050 7800 4050 8000
Wire Wire Line
	4150 7700 4150 8000
Wire Wire Line
	4650 7200 4650 8000
Wire Wire Line
	4550 7300 4550 8000
Wire Wire Line
	4450 7400 4450 8000
Wire Wire Line
	4350 7500 4350 8000
Wire Wire Line
	4250 7600 4250 8000
Wire Wire Line
	2050 5300 2050 7800
Wire Wire Line
	2500 7800 2050 7800
Connection ~ 2050 7800
$Sheet
S 2500 950  650  1050
U 5F645851
F0 "UART Receiver" 50
F1 "UART_RX.sch" 50
F2 "BUS0" O R 3150 1050 50 
F3 "BUS1" O R 3150 1150 50 
F4 "BUS2" O R 3150 1250 50 
F5 "BUS3" O R 3150 1350 50 
F6 "BUS4" O R 3150 1450 50 
F7 "BUS5" O R 3150 1550 50 
F8 "BUS6" O R 3150 1650 50 
F9 "BUS7" O R 3150 1750 50 
F10 "TO" I R 3150 1900 50 
F11 "RX" I L 2500 1900 50 
$EndSheet
Wire Wire Line
	1750 8750 6950 8750
Wire Wire Line
	6950 8750 6950 6700
Wire Wire Line
	6950 6700 6850 6700
Wire Wire Line
	6850 6600 7000 6600
Wire Wire Line
	7000 6600 7000 8800
Wire Wire Line
	7000 8800 1700 8800
Wire Wire Line
	6850 6500 7050 6500
Wire Wire Line
	2350 6600 2500 6600
Wire Wire Line
	2350 6600 2350 7300
Wire Wire Line
	3150 1050 4650 1050
Wire Wire Line
	4650 1050 4650 2400
Wire Wire Line
	3150 1150 4550 1150
Wire Wire Line
	4550 1150 4550 2500
Wire Wire Line
	3150 1250 4450 1250
Wire Wire Line
	4450 1250 4450 2600
Wire Wire Line
	3150 1350 4350 1350
Wire Wire Line
	4350 1350 4350 2700
Wire Wire Line
	4250 1450 3150 1450
Wire Wire Line
	4250 1450 4250 2800
Wire Wire Line
	3150 1550 4150 1550
Wire Wire Line
	4150 1550 4150 2900
Wire Wire Line
	4050 1650 3150 1650
Wire Wire Line
	4050 1650 4050 3000
Wire Wire Line
	3150 1750 3950 1750
Wire Wire Line
	3950 1750 3950 3100
Wire Wire Line
	3400 3250 3150 3250
Wire Wire Line
	3450 1900 3150 1900
Wire Wire Line
	3450 1900 3450 3850
Wire Wire Line
	3150 2400 4650 2400
Wire Wire Line
	4550 2500 3150 2500
Wire Wire Line
	3150 2600 4450 2600
Wire Wire Line
	4350 2700 3150 2700
Wire Wire Line
	3150 2800 4250 2800
Wire Wire Line
	4150 2900 3150 2900
Wire Wire Line
	3150 3000 4050 3000
Wire Wire Line
	3950 3100 3150 3100
Wire Wire Line
	2050 7800 2050 8450
Wire Wire Line
	2500 5400 2100 5400
$Comp
L Connector:Conn_01x06_Female J1
U 1 1 5F351101
P 1200 1800
F 0 "J1" H 1100 2250 50  0000 C CNN
F 1 "UART" H 1100 2150 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 1200 1800 50  0001 C CNN
F 3 "~" H 1200 1800 50  0001 C CNN
	1    1200 1800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2500 2400 1550 2400
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5F399079
P 1550 1800
F 0 "#FLG01" H 1550 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 1800 1900 50  0000 C CNN
F 2 "" H 1550 1800 50  0001 C CNN
F 3 "~" H 1550 1800 50  0001 C CNN
	1    1550 1800
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5F399B07
P 1550 1600
F 0 "#FLG02" H 1550 1675 50  0001 C CNN
F 1 "PWR_FLAG" H 1800 1700 50  0000 C CNN
F 2 "" H 1550 1600 50  0001 C CNN
F 3 "~" H 1550 1600 50  0001 C CNN
	1    1550 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1900 2500 1900
Wire Wire Line
	1550 2400 1550 2000
$Sheet
S 2500 2300 650  1050
U 5F64487D
F0 "UART Transmitter" 50
F1 "UART_TX.sch" 50
F2 "BUS0" I R 3150 2400 50 
F3 "BUS1" I R 3150 2500 50 
F4 "BUS2" I R 3150 2600 50 
F5 "BUS3" I R 3150 2700 50 
F6 "BUS4" I R 3150 2800 50 
F7 "BUS5" I R 3150 2900 50 
F8 "BUS6" I R 3150 3000 50 
F9 "BUS7" I R 3150 3100 50 
F10 "TX" O L 2500 2400 50 
F11 "TI" I R 3150 3250 50 
$EndSheet
Wire Wire Line
	5100 7300 4550 7300
Wire Wire Line
	5100 7200 4650 7200
Wire Wire Line
	5850 7900 5850 8400
Wire Wire Line
	5900 7800 5900 8450
Wire Wire Line
	7050 8850 1650 8850
Wire Wire Line
	7050 6500 7050 8850
$Sheet
S 5100 7100 650  900 
U 5EC5738F
F0 "PC" 50
F1 "PC.sch" 50
F2 "BUS0" B L 5100 7200 50 
F3 "BUS1" B L 5100 7300 50 
F4 "BUS2" B L 5100 7400 50 
F5 "BUS3" B L 5100 7500 50 
F6 "BUS4" B L 5100 7600 50 
F7 "BUS5" B L 5100 7700 50 
F8 "BUS6" B L 5100 7800 50 
F9 "BUS7" B L 5100 7900 50 
F10 "CE" I R 5750 7400 50 
F11 "HI" I R 5750 7800 50 
F12 "CI" I R 5750 7200 50 
F13 "CO" I R 5750 7300 50 
F14 "~HI" I R 5750 7900 50 
$EndSheet
Wire Wire Line
	3950 7900 3950 8000
Wire Wire Line
	1550 2000 1400 2000
$Comp
L power:GND #PWR04
U 1 1 5F46FAF8
P 1550 1600
F 0 "#PWR04" H 1550 1350 50  0001 C CNN
F 1 "GND" V 1550 1450 50  0000 R CNN
F 2 "" H 1550 1600 50  0001 C CNN
F 3 "" H 1550 1600 50  0001 C CNN
	1    1550 1600
	0    -1   -1   0   
$EndComp
NoConn ~ 1400 1700
NoConn ~ 1400 2100
$Comp
L power:+5V #PWR05
U 1 1 5F6BB48A
P 1550 1800
F 0 "#PWR05" H 1550 1650 50  0001 C CNN
F 1 "+5V" V 1550 1950 50  0000 L CNN
F 2 "" H 1550 1800 50  0001 C CNN
F 3 "" H 1550 1800 50  0001 C CNN
	1    1550 1800
	0    1    1    0   
$EndComp
Connection ~ 4150 8300
Wire Wire Line
	4150 8300 4250 8300
Wire Wire Line
	4050 8300 4150 8300
$Comp
L Device:R R3
U 1 1 5ED8F236
P 4150 8150
F 0 "R3" V 4100 8250 50  0000 L CNN
F 1 "470" V 4150 8100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4080 8150 50  0001 C CNN
F 3 "~" H 4150 8150 50  0001 C CNN
	1    4150 8150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6150 5100 6150
Connection ~ 1550 1800
Connection ~ 1550 1600
Wire Wire Line
	6200 3850 5750 3850
Wire Wire Line
	5750 3750 6200 3750
Wire Wire Line
	6200 3650 5750 3650
Wire Wire Line
	5750 3550 6200 3550
Wire Wire Line
	6200 3450 5750 3450
Wire Wire Line
	5750 3350 6200 3350
Wire Wire Line
	5750 3250 6200 3250
Wire Wire Line
	5750 3150 6200 3150
Wire Wire Line
	3150 4000 5100 4000
Wire Wire Line
	3150 4100 5100 4100
$Sheet
S 5100 3050 650  1150
U 5EC5A568
F0 "Reg B" 50
F1 "RegB.sch" 50
F2 "BUS0" B L 5100 3150 50 
F3 "BUS1" B L 5100 3250 50 
F4 "BUS2" B L 5100 3350 50 
F5 "BUS3" B L 5100 3450 50 
F6 "BUS4" B L 5100 3550 50 
F7 "BUS5" B L 5100 3650 50 
F8 "BUS6" B L 5100 3750 50 
F9 "BUS7" B L 5100 3850 50 
F10 "~BI" I L 5100 4100 50 
F11 "~BO" I L 5100 4000 50 
F12 "R0" O R 5750 3150 50 
F13 "R1" O R 5750 3250 50 
F14 "R2" O R 5750 3350 50 
F15 "R3" O R 5750 3450 50 
F16 "R4" O R 5750 3550 50 
F17 "R5" O R 5750 3650 50 
F18 "R6" O R 5750 3750 50 
F19 "R7" O R 5750 3850 50 
$EndSheet
Connection ~ 3950 3100
Wire Wire Line
	3950 3100 3950 3850
Connection ~ 3950 3850
Wire Wire Line
	5100 3850 3950 3850
Connection ~ 4050 3000
Wire Wire Line
	4050 3000 4050 3750
Wire Wire Line
	5100 3750 4050 3750
Connection ~ 4050 3750
Connection ~ 4150 2900
Wire Wire Line
	4150 2900 4150 3650
Wire Wire Line
	4150 3650 5100 3650
Connection ~ 4150 3650
Connection ~ 4250 2800
Wire Wire Line
	4250 2800 4250 3550
Wire Wire Line
	5100 3550 4250 3550
Connection ~ 4250 3550
Connection ~ 4350 2700
Wire Wire Line
	4350 2700 4350 3450
Wire Wire Line
	4350 3450 5100 3450
Connection ~ 4350 3450
Connection ~ 4450 2600
Wire Wire Line
	4450 2600 4450 3350
Wire Wire Line
	5100 3350 4450 3350
Connection ~ 4450 3350
Connection ~ 4550 2500
Wire Wire Line
	4550 2500 4550 3250
Wire Wire Line
	5100 3250 4550 3250
Connection ~ 4550 3250
Connection ~ 4650 2400
Wire Wire Line
	4650 2400 4650 3150
Wire Wire Line
	5100 3150 4650 3150
Connection ~ 4650 3150
Wire Wire Line
	3150 6250 5100 6250
Wire Wire Line
	2100 8400 5850 8400
Wire Wire Line
	3950 8300 4050 8300
Connection ~ 4050 8300
Wire Wire Line
	1950 4600 2500 4600
$Sheet
S 2500 7100 650  900 
U 5EC57456
F0 "Memory" 50
F1 "RAM.sch" 50
F2 "BUS0" B R 3150 7200 50 
F3 "BUS1" B R 3150 7300 50 
F4 "BUS2" B R 3150 7400 50 
F5 "BUS3" B R 3150 7500 50 
F6 "BUS4" B R 3150 7600 50 
F7 "BUS5" B R 3150 7700 50 
F8 "BUS6" B R 3150 7800 50 
F9 "BUS7" B R 3150 7900 50 
F10 "RI" I L 2500 7300 50 
F11 "~RO" I L 2500 7200 50 
F12 "MI" I L 2500 7450 50 
F13 "HI" I L 2500 7800 50 
F14 "ME" I L 2500 7550 50 
F15 "~HI" I L 2500 7900 50 
$EndSheet
Wire Wire Line
	1850 8650 6100 8650
Wire Wire Line
	1850 4400 2500 4400
Wire Wire Line
	1850 4400 1850 8650
Wire Wire Line
	1900 8600 6050 8600
Wire Wire Line
	2500 4500 1900 4500
Wire Wire Line
	1900 4500 1900 8600
Wire Wire Line
	1950 4600 1950 8550
Wire Wire Line
	2200 7550 2200 6150
Wire Wire Line
	2200 6150 2500 6150
Wire Wire Line
	2100 5400 2100 7900
Wire Wire Line
	2100 7900 2500 7900
Connection ~ 2100 7900
Wire Wire Line
	2100 7900 2100 8400
Wire Wire Line
	1400 1600 1550 1600
Wire Wire Line
	1400 1800 1550 1800
Wire Wire Line
	1750 3950 1750 8750
Wire Wire Line
	1750 3950 2500 3950
Wire Wire Line
	1700 8800 1700 3850
Wire Wire Line
	1700 3850 2500 3850
Wire Wire Line
	1650 8850 1650 3750
Wire Wire Line
	1650 3750 2500 3750
$Sheet
S 2500 3650 650  3150
U 5EC57429
F0 "Control Logic" 50
F1 "IR.sch" 50
F2 "BUS0" I R 3150 5300 50 
F3 "BUS1" I R 3150 5400 50 
F4 "BUS2" I R 3150 5500 50 
F5 "BUS3" I R 3150 5600 50 
F6 "BUS4" I R 3150 5700 50 
F7 "BUS5" I R 3150 5800 50 
F8 "CO" O L 2500 4500 50 
F9 "CI" O L 2500 4400 50 
F10 "HI" O L 2500 5300 50 
F11 "~AI" O R 3150 6250 50 
F12 "~AO" O R 3150 6150 50 
F13 "~BI" O R 3150 4100 50 
F14 "~BO" O R 3150 4000 50 
F15 "MI" O L 2500 6250 50 
F16 "~EO" O L 2500 3750 50 
F17 "ES" O L 2500 3850 50 
F18 "EC" O L 2500 3950 50 
F19 "RI" O L 2500 6600 50 
F20 "~RO" O L 2500 6700 50 
F21 "CE" O L 2500 4600 50 
F22 "FLAG_C" I R 3150 6500 50 
F23 "FLAG_N" I R 3150 6700 50 
F24 "FLAG_Z" I R 3150 6600 50 
F25 "~HI" O L 2500 5400 50 
F26 "TI" O R 3150 3750 50 
F27 "TO" O R 3150 3850 50 
F28 "ME" O L 2500 6150 50 
$EndSheet
$Comp
L power:+5V #PWR06
U 1 1 5ED8FF17
P 4650 8300
F 0 "#PWR06" H 4650 8150 50  0001 C CNN
F 1 "+5V" V 4650 8500 50  0000 C CNN
F 2 "" H 4650 8300 50  0001 C CNN
F 3 "" H 4650 8300 50  0001 C CNN
	1    4650 8300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 6005BCD3
P 1250 3300
AR Path="/6005BCD3" Ref="#PWR0111"  Part="1" 
AR Path="/5EC57429/6005BCD3" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6005BCD3" Ref="#PWR?"  Part="1" 
F 0 "#PWR0111" H 1250 3050 50  0001 C CNN
F 1 "GND" H 1255 3127 50  0000 C CNN
F 2 "" H 1250 3300 50  0001 C CNN
F 3 "" H 1250 3300 50  0001 C CNN
	1    1250 3300
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 6005BCD9
P 1450 3300
AR Path="/6005BCD9" Ref="SW1"  Part="1" 
AR Path="/5EC57429/6005BCD9" Ref="SW?"  Part="1" 
AR Path="/6026EA31/6005BCD9" Ref="SW?"  Part="1" 
F 0 "SW1" H 1450 3585 50  0000 C CNN
F 1 "RESET" H 1450 3494 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 1450 3500 50  0001 C CNN
F 3 "~" H 1450 3500 50  0001 C CNN
	1    1450 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0112
U 1 1 6005BCDF
P 1650 3000
AR Path="/6005BCDF" Ref="#PWR0112"  Part="1" 
AR Path="/5EC57429/6005BCDF" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6005BCDF" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 1650 2850 50  0001 C CNN
F 1 "+5V" H 1665 3173 50  0000 C CNN
F 2 "" H 1650 3000 50  0001 C CNN
F 3 "" H 1650 3000 50  0001 C CNN
	1    1650 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 6005BCE5
P 1650 3150
AR Path="/6005BCE5" Ref="R9"  Part="1" 
AR Path="/5EC57429/6005BCE5" Ref="R?"  Part="1" 
AR Path="/6026EA31/6005BCE5" Ref="R?"  Part="1" 
F 0 "R9" H 1500 3150 50  0000 L CNN
F 1 "470" V 1650 3050 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1580 3150 50  0001 C CNN
F 3 "~" H 1650 3150 50  0001 C CNN
	1    1650 3150
	-1   0    0    1   
$EndComp
Text GLabel 1750 3300 2    50   Output ~ 0
~RESET
Wire Wire Line
	1650 3300 1750 3300
Connection ~ 1650 3300
$Comp
L Oscillator:ACO-xxxMHz X1
U 1 1 6006CBDB
P 5250 1450
AR Path="/6006CBDB" Ref="X1"  Part="1" 
AR Path="/6026EA31/6006CBDB" Ref="X?"  Part="1" 
F 0 "X1" H 5450 1300 50  0000 R CNN
F 1 "ACO-1.8432MHz" H 5550 850 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 5700 1100 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 5150 1450 50  0001 C CNN
	1    5250 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 6006CBE1
P 5250 1750
AR Path="/6006CBE1" Ref="#PWR0136"  Part="1" 
AR Path="/6026EA31/6006CBE1" Ref="#PWR?"  Part="1" 
F 0 "#PWR0136" H 5250 1500 50  0001 C CNN
F 1 "GND" H 5255 1577 50  0000 C CNN
F 2 "" H 5250 1750 50  0001 C CNN
F 3 "" H 5250 1750 50  0001 C CNN
	1    5250 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0124
U 1 1 6006CBE7
P 5250 1150
AR Path="/6006CBE7" Ref="#PWR0124"  Part="1" 
AR Path="/6026EA31/6006CBE7" Ref="#PWR?"  Part="1" 
F 0 "#PWR0124" H 5250 1000 50  0001 C CNN
F 1 "+5V" H 5265 1323 50  0000 C CNN
F 2 "" H 5250 1150 50  0001 C CNN
F 3 "" H 5250 1150 50  0001 C CNN
	1    5250 1150
	1    0    0    -1  
$EndComp
Text GLabel 6850 900  1    50   Output ~ 0
~CLOCK
Text GLabel 6250 900  1    50   Output ~ 0
CLOCK
$Comp
L 74xx:74HC04 U?
U 6 1 6006CBEF
P 6550 1450
AR Path="/5EC57429/6006CBEF" Ref="U?"  Part="6" 
AR Path="/6006CBEF" Ref="U1"  Part="6" 
AR Path="/6026EA31/6006CBEF" Ref="U?"  Part="6" 
F 0 "U1" H 6400 1500 50  0000 L CNN
F 1 "74HC04" H 6400 1400 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 6550 1450 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 6550 1450 50  0001 C CNN
	6    6550 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C52
U 1 1 600A41D4
P 2800 9450
AR Path="/600A41D4" Ref="C52"  Part="1" 
AR Path="/6026EA31/600A41D4" Ref="C?"  Part="1" 
F 0 "C52" H 2700 9600 50  0000 L CNN
F 1 "47µF" H 2700 9300 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D7.5mm_P2.50mm" H 2838 9300 50  0001 C CNN
F 3 "~" H 2800 9450 50  0001 C CNN
	1    2800 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A41DA
P 2950 9450
AR Path="/5F645851/600A41DA" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A41DA" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A41DA" Ref="C?"  Part="1" 
AR Path="/600A41DA" Ref="C1"  Part="1" 
AR Path="/6026EA31/600A41DA" Ref="C?"  Part="1" 
F 0 "C1" H 2900 9600 50  0000 L CNN
F 1 "100nF" H 2850 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2950 9450 50  0001 C CNN
F 3 "~" H 2950 9450 50  0001 C CNN
	1    2950 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A41E0
P 3100 9450
AR Path="/5F645851/600A41E0" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A41E0" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A41E0" Ref="C?"  Part="1" 
AR Path="/600A41E0" Ref="C2"  Part="1" 
AR Path="/6026EA31/600A41E0" Ref="C?"  Part="1" 
F 0 "C2" H 3050 9600 50  0000 L CNN
F 1 "100nF" H 3000 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3100 9450 50  0001 C CNN
F 3 "~" H 3100 9450 50  0001 C CNN
	1    3100 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A41E6
P 3250 9450
AR Path="/5F645851/600A41E6" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A41E6" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A41E6" Ref="C?"  Part="1" 
AR Path="/600A41E6" Ref="C3"  Part="1" 
AR Path="/6026EA31/600A41E6" Ref="C?"  Part="1" 
F 0 "C3" H 3200 9600 50  0000 L CNN
F 1 "100nF" H 3150 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3250 9450 50  0001 C CNN
F 3 "~" H 3250 9450 50  0001 C CNN
	1    3250 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A41EC
P 3400 9450
AR Path="/5F645851/600A41EC" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A41EC" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A41EC" Ref="C?"  Part="1" 
AR Path="/600A41EC" Ref="C4"  Part="1" 
AR Path="/6026EA31/600A41EC" Ref="C?"  Part="1" 
F 0 "C4" H 3350 9600 50  0000 L CNN
F 1 "100nF" H 3300 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3400 9450 50  0001 C CNN
F 3 "~" H 3400 9450 50  0001 C CNN
	1    3400 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A41F2
P 3550 9450
AR Path="/5F645851/600A41F2" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A41F2" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A41F2" Ref="C?"  Part="1" 
AR Path="/600A41F2" Ref="C5"  Part="1" 
AR Path="/6026EA31/600A41F2" Ref="C?"  Part="1" 
F 0 "C5" H 3500 9600 50  0000 L CNN
F 1 "100nF" H 3450 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3550 9450 50  0001 C CNN
F 3 "~" H 3550 9450 50  0001 C CNN
	1    3550 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A41F8
P 3700 9450
AR Path="/5F645851/600A41F8" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A41F8" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A41F8" Ref="C?"  Part="1" 
AR Path="/600A41F8" Ref="C6"  Part="1" 
AR Path="/6026EA31/600A41F8" Ref="C?"  Part="1" 
F 0 "C6" H 3650 9600 50  0000 L CNN
F 1 "100nF" H 3600 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3700 9450 50  0001 C CNN
F 3 "~" H 3700 9450 50  0001 C CNN
	1    3700 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A41FE
P 3850 9450
AR Path="/5F645851/600A41FE" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A41FE" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A41FE" Ref="C?"  Part="1" 
AR Path="/600A41FE" Ref="C7"  Part="1" 
AR Path="/6026EA31/600A41FE" Ref="C?"  Part="1" 
F 0 "C7" H 3800 9600 50  0000 L CNN
F 1 "100nF" H 3750 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3850 9450 50  0001 C CNN
F 3 "~" H 3850 9450 50  0001 C CNN
	1    3850 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A4204
P 4000 9450
AR Path="/5F645851/600A4204" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A4204" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A4204" Ref="C?"  Part="1" 
AR Path="/600A4204" Ref="C8"  Part="1" 
AR Path="/6026EA31/600A4204" Ref="C?"  Part="1" 
F 0 "C8" H 3950 9600 50  0000 L CNN
F 1 "100nF" H 3900 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4000 9450 50  0001 C CNN
F 3 "~" H 4000 9450 50  0001 C CNN
	1    4000 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A420A
P 4150 9450
AR Path="/5F645851/600A420A" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A420A" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A420A" Ref="C?"  Part="1" 
AR Path="/600A420A" Ref="C9"  Part="1" 
AR Path="/6026EA31/600A420A" Ref="C?"  Part="1" 
F 0 "C9" H 4100 9600 50  0000 L CNN
F 1 "100nF" H 4050 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4150 9450 50  0001 C CNN
F 3 "~" H 4150 9450 50  0001 C CNN
	1    4150 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A4210
P 4300 9450
AR Path="/5F645851/600A4210" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A4210" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A4210" Ref="C?"  Part="1" 
AR Path="/600A4210" Ref="C10"  Part="1" 
AR Path="/6026EA31/600A4210" Ref="C?"  Part="1" 
F 0 "C10" H 4250 9600 50  0000 L CNN
F 1 "100nF" H 4200 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4300 9450 50  0001 C CNN
F 3 "~" H 4300 9450 50  0001 C CNN
	1    4300 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A4216
P 4450 9450
AR Path="/5F645851/600A4216" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A4216" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A4216" Ref="C?"  Part="1" 
AR Path="/600A4216" Ref="C11"  Part="1" 
AR Path="/6026EA31/600A4216" Ref="C?"  Part="1" 
F 0 "C11" H 4400 9600 50  0000 L CNN
F 1 "100nF" H 4350 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4450 9450 50  0001 C CNN
F 3 "~" H 4450 9450 50  0001 C CNN
	1    4450 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A421C
P 4600 9450
AR Path="/5F645851/600A421C" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A421C" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A421C" Ref="C?"  Part="1" 
AR Path="/600A421C" Ref="C12"  Part="1" 
AR Path="/6026EA31/600A421C" Ref="C?"  Part="1" 
F 0 "C12" H 4550 9600 50  0000 L CNN
F 1 "100nF" H 4500 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4600 9450 50  0001 C CNN
F 3 "~" H 4600 9450 50  0001 C CNN
	1    4600 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A4222
P 4750 9450
AR Path="/5F645851/600A4222" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A4222" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A4222" Ref="C?"  Part="1" 
AR Path="/600A4222" Ref="C13"  Part="1" 
AR Path="/6026EA31/600A4222" Ref="C?"  Part="1" 
F 0 "C13" H 4700 9600 50  0000 L CNN
F 1 "100nF" H 4650 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4750 9450 50  0001 C CNN
F 3 "~" H 4750 9450 50  0001 C CNN
	1    4750 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A4228
P 4900 9450
AR Path="/5F645851/600A4228" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A4228" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A4228" Ref="C?"  Part="1" 
AR Path="/600A4228" Ref="C14"  Part="1" 
AR Path="/6026EA31/600A4228" Ref="C?"  Part="1" 
F 0 "C14" H 4850 9600 50  0000 L CNN
F 1 "100nF" H 4800 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4900 9450 50  0001 C CNN
F 3 "~" H 4900 9450 50  0001 C CNN
	1    4900 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A422E
P 5050 9450
AR Path="/5F645851/600A422E" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A422E" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A422E" Ref="C?"  Part="1" 
AR Path="/600A422E" Ref="C15"  Part="1" 
AR Path="/6026EA31/600A422E" Ref="C?"  Part="1" 
F 0 "C15" H 5000 9600 50  0000 L CNN
F 1 "100nF" H 4950 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5050 9450 50  0001 C CNN
F 3 "~" H 5050 9450 50  0001 C CNN
	1    5050 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A4234
P 5200 9450
AR Path="/5F645851/600A4234" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A4234" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A4234" Ref="C?"  Part="1" 
AR Path="/600A4234" Ref="C16"  Part="1" 
AR Path="/6026EA31/600A4234" Ref="C?"  Part="1" 
F 0 "C16" H 5150 9600 50  0000 L CNN
F 1 "100nF" H 5100 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5200 9450 50  0001 C CNN
F 3 "~" H 5200 9450 50  0001 C CNN
	1    5200 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A423A
P 5350 9450
AR Path="/5F645851/600A423A" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A423A" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A423A" Ref="C?"  Part="1" 
AR Path="/600A423A" Ref="C17"  Part="1" 
AR Path="/6026EA31/600A423A" Ref="C?"  Part="1" 
F 0 "C17" H 5300 9600 50  0000 L CNN
F 1 "100nF" H 5250 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5350 9450 50  0001 C CNN
F 3 "~" H 5350 9450 50  0001 C CNN
	1    5350 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A4240
P 5500 9450
AR Path="/5F645851/600A4240" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A4240" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A4240" Ref="C?"  Part="1" 
AR Path="/600A4240" Ref="C18"  Part="1" 
AR Path="/6026EA31/600A4240" Ref="C?"  Part="1" 
F 0 "C18" H 5450 9600 50  0000 L CNN
F 1 "100nF" H 5400 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5500 9450 50  0001 C CNN
F 3 "~" H 5500 9450 50  0001 C CNN
	1    5500 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A4246
P 5650 9450
AR Path="/5F645851/600A4246" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A4246" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A4246" Ref="C?"  Part="1" 
AR Path="/600A4246" Ref="C19"  Part="1" 
AR Path="/6026EA31/600A4246" Ref="C?"  Part="1" 
F 0 "C19" H 5600 9600 50  0000 L CNN
F 1 "100nF" H 5550 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5650 9450 50  0001 C CNN
F 3 "~" H 5650 9450 50  0001 C CNN
	1    5650 9450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 600A424C
P 5800 9450
AR Path="/5F645851/600A424C" Ref="C?"  Part="1" 
AR Path="/5F64487D/600A424C" Ref="C?"  Part="1" 
AR Path="/5EC57456/600A424C" Ref="C?"  Part="1" 
AR Path="/600A424C" Ref="C20"  Part="1" 
AR Path="/6026EA31/600A424C" Ref="C?"  Part="1" 
F 0 "C20" H 5750 9600 50  0000 L CNN
F 1 "100nF" H 5700 9250 50  0001 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5800 9450 50  0001 C CNN
F 3 "~" H 5800 9450 50  0001 C CNN
	1    5800 9450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 9350 2950 9350
Connection ~ 2950 9350
Wire Wire Line
	2950 9350 3100 9350
Connection ~ 3100 9350
Wire Wire Line
	3100 9350 3250 9350
Connection ~ 3250 9350
Wire Wire Line
	3250 9350 3400 9350
Connection ~ 3400 9350
Wire Wire Line
	3400 9350 3550 9350
Connection ~ 3550 9350
Wire Wire Line
	3550 9350 3700 9350
Connection ~ 3700 9350
Wire Wire Line
	3700 9350 3850 9350
Connection ~ 3850 9350
Wire Wire Line
	3850 9350 4000 9350
Connection ~ 4000 9350
Wire Wire Line
	4000 9350 4150 9350
Connection ~ 4150 9350
Wire Wire Line
	4150 9350 4300 9350
Connection ~ 4300 9350
Wire Wire Line
	4300 9350 4450 9350
Connection ~ 4450 9350
Wire Wire Line
	4450 9350 4600 9350
Connection ~ 4600 9350
Wire Wire Line
	4600 9350 4750 9350
Connection ~ 4750 9350
Wire Wire Line
	4750 9350 4900 9350
Connection ~ 4900 9350
Wire Wire Line
	4900 9350 5050 9350
Connection ~ 5050 9350
Wire Wire Line
	5050 9350 5200 9350
Connection ~ 5200 9350
Wire Wire Line
	5200 9350 5350 9350
Connection ~ 5350 9350
Wire Wire Line
	5350 9350 5500 9350
Connection ~ 5500 9350
Wire Wire Line
	5500 9350 5650 9350
Connection ~ 5650 9350
Wire Wire Line
	5650 9350 5800 9350
Connection ~ 5800 9350
Wire Wire Line
	2800 9550 2950 9550
Connection ~ 2950 9550
Wire Wire Line
	2950 9550 3100 9550
Connection ~ 3100 9550
Wire Wire Line
	3100 9550 3250 9550
Connection ~ 3250 9550
Wire Wire Line
	3250 9550 3400 9550
Connection ~ 3400 9550
Wire Wire Line
	3400 9550 3550 9550
Connection ~ 3550 9550
Wire Wire Line
	3550 9550 3700 9550
Connection ~ 3700 9550
Wire Wire Line
	3700 9550 3850 9550
Connection ~ 3850 9550
Wire Wire Line
	3850 9550 4000 9550
Connection ~ 4000 9550
Wire Wire Line
	4000 9550 4150 9550
Connection ~ 4150 9550
Wire Wire Line
	4150 9550 4300 9550
Connection ~ 4300 9550
Wire Wire Line
	4300 9550 4450 9550
Connection ~ 4450 9550
Wire Wire Line
	4450 9550 4600 9550
Connection ~ 4600 9550
Wire Wire Line
	4600 9550 4750 9550
Connection ~ 4750 9550
Wire Wire Line
	4750 9550 4900 9550
Connection ~ 4900 9550
Wire Wire Line
	4900 9550 5050 9550
Connection ~ 5050 9550
Wire Wire Line
	5050 9550 5200 9550
Connection ~ 5200 9550
Wire Wire Line
	5200 9550 5350 9550
Connection ~ 5350 9550
Wire Wire Line
	5350 9550 5500 9550
Connection ~ 5500 9550
Wire Wire Line
	5500 9550 5650 9550
Connection ~ 5650 9550
Wire Wire Line
	5650 9550 5800 9550
Connection ~ 5800 9550
$Comp
L power:GND #PWR0138
U 1 1 600A42A2
P 5950 9550
AR Path="/600A42A2" Ref="#PWR0138"  Part="1" 
AR Path="/6026EA31/600A42A2" Ref="#PWR?"  Part="1" 
F 0 "#PWR0138" H 5950 9300 50  0001 C CNN
F 1 "GND" H 6150 9450 50  0000 R CNN
F 2 "" H 5950 9550 50  0001 C CNN
F 3 "" H 5950 9550 50  0001 C CNN
	1    5950 9550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0137
U 1 1 600A42A8
P 5950 9350
AR Path="/600A42A8" Ref="#PWR0137"  Part="1" 
AR Path="/6026EA31/600A42A8" Ref="#PWR?"  Part="1" 
F 0 "#PWR0137" H 5950 9200 50  0001 C CNN
F 1 "+5V" H 6000 9450 50  0000 L CNN
F 2 "" H 5950 9350 50  0001 C CNN
F 3 "" H 5950 9350 50  0001 C CNN
	1    5950 9350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 9350 5950 9350
Wire Wire Line
	5800 9550 5950 9550
Wire Wire Line
	6850 900  6850 1450
Text GLabel 5550 1050 1    50   Output ~ 0
1.8432MHz
Wire Wire Line
	6250 900  6250 1450
Connection ~ 5550 1450
Wire Wire Line
	5550 1050 5550 1450
Wire Wire Line
	5550 1450 6250 1450
Connection ~ 6250 1450
Wire Wire Line
	2400 7200 2500 7200
Wire Wire Line
	2350 7300 2500 7300
Wire Wire Line
	2250 7450 2500 7450
Wire Wire Line
	2200 7550 2500 7550
Wire Wire Line
	6100 7200 5750 7200
Wire Wire Line
	6100 7200 6100 8650
Wire Wire Line
	5750 7300 6050 7300
Wire Wire Line
	6050 7300 6050 8600
Wire Wire Line
	6000 7400 5750 7400
Wire Wire Line
	6000 7400 6000 8550
Wire Wire Line
	5850 7900 5750 7900
Wire Wire Line
	5900 7800 5750 7800
Wire Wire Line
	6200 6500 3150 6500
Wire Wire Line
	6200 6600 3150 6600
Wire Wire Line
	6200 6700 3150 6700
Connection ~ 3950 5050
Wire Wire Line
	3950 5050 3950 6000
Connection ~ 4050 4950
Wire Wire Line
	4050 4950 4050 5900
Connection ~ 4150 4850
Wire Wire Line
	4150 4850 4150 5800
Connection ~ 4250 4750
Wire Wire Line
	4250 4750 4250 5700
Connection ~ 4350 4650
Wire Wire Line
	4350 4650 4350 5600
Connection ~ 4450 4550
Wire Wire Line
	4450 4550 4450 5500
Connection ~ 4550 4450
Wire Wire Line
	4550 4450 4550 5400
Connection ~ 4650 4350
Wire Wire Line
	4650 4350 4650 5300
Wire Wire Line
	4650 3150 4650 4350
Wire Wire Line
	4550 3250 4550 4450
Wire Wire Line
	4450 3350 4450 4550
Wire Wire Line
	4350 3450 4350 4650
Wire Wire Line
	4250 3550 4250 4750
Wire Wire Line
	4150 3650 4150 4850
Wire Wire Line
	4050 3750 4050 4950
Wire Wire Line
	3950 3850 3950 5050
Text Notes 3000 8300 0    50   ~ 0
The bus is tied to $ff\nif not driven actively.
$EndSCHEMATC
