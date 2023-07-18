EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 10
Title "Cassette Interface"
Date "2020-12-09"
Rev "1.02"
Comp ""
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 4050 4500 0    50   Input ~ 0
~TX
Text HLabel 4050 4300 0    50   Output ~ 0
~RX
$Comp
L 74xx:74HC04 U?
U 5 1 5F27CEEA
P 5100 4500
AR Path="/5F27CEEA" Ref="U?"  Part="5" 
AR Path="/5F25F2A7/5F27CEEA" Ref="U1"  Part="5" 
F 0 "U1" H 5200 4600 50  0000 C CNN
F 1 "74HC04" H 5050 4500 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5100 4500 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5100 4500 50  0001 C CNN
	5    5100 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4500 4800 4500
$Comp
L Switch:SW_SPST SW?
U 1 1 5F27CEF1
P 5600 4300
AR Path="/5F27CEF1" Ref="SW?"  Part="1" 
AR Path="/5F25F2A7/5F27CEF1" Ref="SW1"  Part="1" 
F 0 "SW1" H 5500 4400 50  0000 C CNN
F 1 "SW_SPST" H 5600 4200 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 5600 4300 50  0001 C CNN
F 3 "~" H 5600 4300 50  0001 C CNN
	1    5600 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 4300 4700 4300
$Comp
L 74xx:74HC04 U?
U 6 1 5F27CEF8
P 5000 2550
AR Path="/5F27CEF8" Ref="U?"  Part="6" 
AR Path="/5F25F2A7/5F27CEF8" Ref="U1"  Part="6" 
F 0 "U1" H 5050 2700 50  0000 C CNN
F 1 "74HC04" H 4950 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 5000 2550 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 5000 2550 50  0001 C CNN
	6    5000 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5F27CEFF
P 6600 2550
AR Path="/5F27CEFF" Ref="R?"  Part="1" 
AR Path="/5F25F2A7/5F27CEFF" Ref="R1"  Part="1" 
F 0 "R1" V 6500 2550 50  0000 C CNN
F 1 "1k" V 6600 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6530 2550 50  0001 C CNN
F 3 "~" H 6600 2550 50  0001 C CNN
	1    6600 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	6750 2550 6950 2550
Wire Wire Line
	5300 2550 6450 2550
Wire Wire Line
	4700 4300 4050 4300
Connection ~ 4700 4300
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 5F27CF09
P 7150 2450
AR Path="/5F27CF09" Ref="J?"  Part="1" 
AR Path="/5F25F2A7/5F27CF09" Ref="J4"  Part="1" 
F 0 "J4" H 7050 2550 50  0000 L CNN
F 1 "Speaker" H 6850 2250 50  0000 L CNN
F 2 "" H 7150 2450 50  0001 C CNN
F 3 "~" H 7150 2450 50  0001 C CNN
	1    7150 2450
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:C2N_PCB_Connector J?
U 1 1 5F27CF0F
P 6800 4200
AR Path="/5F27CF0F" Ref="J?"  Part="1" 
AR Path="/5F25F2A7/5F27CF0F" Ref="J2"  Part="1" 
F 0 "J2" H 6600 4500 50  0000 R CNN
F 1 "C2N_PCB_Connector" H 7250 4650 50  0000 R CNN
F 2 "" H 6800 4200 50  0001 C CNN
F 3 "~" H 6800 4200 50  0001 C CNN
	1    6800 4200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F27CF15
P 6600 3900
AR Path="/5F27CF15" Ref="#PWR?"  Part="1" 
AR Path="/5F25F2A7/5F27CF15" Ref="#PWR04"  Part="1" 
F 0 "#PWR04" H 6600 3650 50  0001 C CNN
F 1 "GND" V 6605 3772 50  0000 R CNN
F 2 "" H 6600 3900 50  0001 C CNN
F 3 "" H 6600 3900 50  0001 C CNN
	1    6600 3900
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F27CF1B
P 6600 4000
AR Path="/5F27CF1B" Ref="#PWR?"  Part="1" 
AR Path="/5F25F2A7/5F27CF1B" Ref="#PWR05"  Part="1" 
F 0 "#PWR05" H 6600 3850 50  0001 C CNN
F 1 "+5V" V 6615 4128 50  0000 L CNN
F 2 "" H 6600 4000 50  0001 C CNN
F 3 "" H 6600 4000 50  0001 C CNN
	1    6600 4000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F27CF21
P 6950 2450
AR Path="/5F27CF21" Ref="#PWR?"  Part="1" 
AR Path="/5F25F2A7/5F27CF21" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 6950 2200 50  0001 C CNN
F 1 "GND" V 6850 2400 50  0000 C CNN
F 2 "" H 6950 2450 50  0001 C CNN
F 3 "" H 6950 2450 50  0001 C CNN
	1    6950 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	5400 4500 6000 4500
Wire Wire Line
	6000 4500 6000 4400
Wire Wire Line
	6000 4400 6600 4400
Wire Wire Line
	5800 4300 6600 4300
Wire Wire Line
	6400 5400 6400 4200
Wire Wire Line
	6400 4200 6600 4200
Wire Wire Line
	6600 4500 6500 4500
Wire Wire Line
	6500 4500 6500 5300
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5F29565C
P 7100 5400
AR Path="/5F29565C" Ref="J?"  Part="1" 
AR Path="/5F25F2A7/5F29565C" Ref="J3"  Part="1" 
F 0 "J3" H 7200 5200 50  0000 R CNN
F 1 "MOTOR (6V DC)" H 7700 5500 50  0000 R CNN
F 2 "" H 7100 5400 50  0001 C CNN
F 3 "~" H 7100 5400 50  0001 C CNN
	1    7100 5400
	-1   0    0    1   
$EndComp
Wire Wire Line
	6900 5400 6400 5400
Wire Wire Line
	6500 5300 6900 5300
Wire Wire Line
	4700 2550 4700 4300
$EndSCHEMATC
