EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 10
Title "Bus LEDs"
Date "2020-12-09"
Rev "1.02"
Comp ""
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 7150 4350 2    50   BiDi ~ 0
BUS0
Text HLabel 7150 4250 2    50   BiDi ~ 0
BUS1
Text HLabel 7150 4150 2    50   BiDi ~ 0
BUS2
Text HLabel 7150 4050 2    50   BiDi ~ 0
BUS3
Text HLabel 7150 3950 2    50   BiDi ~ 0
BUS4
Text HLabel 7150 3850 2    50   BiDi ~ 0
BUS5
Text HLabel 7150 3750 2    50   BiDi ~ 0
BUS6
Text HLabel 7150 3650 2    50   BiDi ~ 0
BUS7
$Comp
L power:+5V #PWR?
U 1 1 5F37FF5F
P 6500 3450
AR Path="/5F37FF5F" Ref="#PWR?"  Part="1" 
AR Path="/5F35645B/5F37FF5F" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 6500 3300 50  0001 C CNN
F 1 "+5V" V 6515 3578 50  0000 L CNN
F 2 "" H 6500 3450 50  0001 C CNN
F 3 "" H 6500 3450 50  0001 C CNN
	1    6500 3450
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F37FF65
P 6500 3350
AR Path="/5F37FF65" Ref="#PWR?"  Part="1" 
AR Path="/5F35645B/5F37FF65" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 6500 3100 50  0001 C CNN
F 1 "GND" V 6505 3222 50  0000 R CNN
F 2 "" H 6500 3350 50  0001 C CNN
F 3 "" H 6500 3350 50  0001 C CNN
	1    6500 3350
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F37FF6B
P 6000 4650
AR Path="/5F37FF6B" Ref="#PWR?"  Part="1" 
AR Path="/5F35645B/5F37FF6B" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 6000 4500 50  0001 C CNN
F 1 "+5V" H 6015 4823 50  0000 C CNN
F 2 "" H 6000 4650 50  0001 C CNN
F 3 "" H 6000 4650 50  0001 C CNN
	1    6000 4650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F37FF71
P 6000 3050
AR Path="/5F37FF71" Ref="#PWR?"  Part="1" 
AR Path="/5F35645B/5F37FF71" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 6000 2800 50  0001 C CNN
F 1 "GND" H 6005 2877 50  0000 C CNN
F 2 "" H 6000 3050 50  0001 C CNN
F 3 "" H 6000 3050 50  0001 C CNN
	1    6000 3050
	0    -1   -1   0   
$EndComp
Connection ~ 4700 4350
$Comp
L power:GND #PWR?
U 1 1 5F37FF78
P 4700 4350
AR Path="/5F37FF78" Ref="#PWR?"  Part="1" 
AR Path="/5F35645B/5F37FF78" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 4700 4100 50  0001 C CNN
F 1 "GND" H 4705 4177 50  0000 C CNN
F 2 "" H 4700 4350 50  0001 C CNN
F 3 "" H 4700 4350 50  0001 C CNN
	1    4700 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4250 4700 4350
Connection ~ 4700 4250
Wire Wire Line
	4700 4150 4700 4250
Connection ~ 4700 4150
Wire Wire Line
	4700 4050 4700 4150
Connection ~ 4700 4050
Wire Wire Line
	4700 3950 4700 4050
Connection ~ 4700 3950
Wire Wire Line
	4700 3850 4700 3950
Connection ~ 4700 3850
Wire Wire Line
	4700 3750 4700 3850
Connection ~ 4700 3750
Wire Wire Line
	4700 3650 4700 3750
$Comp
L Device:R R?
U 1 1 5F37FF8B
P 4850 3650
AR Path="/5F37FF8B" Ref="R?"  Part="1" 
AR Path="/5F35645B/5F37FF8B" Ref="R2"  Part="1" 
F 0 "R2" V 4850 3800 50  0000 C CNN
F 1 "200" V 4850 3650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4780 3650 50  0001 C CNN
F 3 "~" H 4850 3650 50  0001 C CNN
	1    4850 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F37FF91
P 4850 3750
AR Path="/5F37FF91" Ref="R?"  Part="1" 
AR Path="/5F35645B/5F37FF91" Ref="R3"  Part="1" 
F 0 "R3" V 4850 3900 50  0000 C CNN
F 1 "200" V 4850 3750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4780 3750 50  0001 C CNN
F 3 "~" H 4850 3750 50  0001 C CNN
	1    4850 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F37FF97
P 4850 3850
AR Path="/5F37FF97" Ref="R?"  Part="1" 
AR Path="/5F35645B/5F37FF97" Ref="R4"  Part="1" 
F 0 "R4" V 4850 4000 50  0000 C CNN
F 1 "200" V 4850 3850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4780 3850 50  0001 C CNN
F 3 "~" H 4850 3850 50  0001 C CNN
	1    4850 3850
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F37FF9D
P 4850 3950
AR Path="/5F37FF9D" Ref="R?"  Part="1" 
AR Path="/5F35645B/5F37FF9D" Ref="R5"  Part="1" 
F 0 "R5" V 4850 4100 50  0000 C CNN
F 1 "200" V 4850 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4780 3950 50  0001 C CNN
F 3 "~" H 4850 3950 50  0001 C CNN
	1    4850 3950
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F37FFA3
P 4850 4050
AR Path="/5F37FFA3" Ref="R?"  Part="1" 
AR Path="/5F35645B/5F37FFA3" Ref="R6"  Part="1" 
F 0 "R6" V 4850 4200 50  0000 C CNN
F 1 "200" V 4850 4050 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4780 4050 50  0001 C CNN
F 3 "~" H 4850 4050 50  0001 C CNN
	1    4850 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F37FFA9
P 4850 4150
AR Path="/5F37FFA9" Ref="R?"  Part="1" 
AR Path="/5F35645B/5F37FFA9" Ref="R7"  Part="1" 
F 0 "R7" V 4850 4300 50  0000 C CNN
F 1 "200" V 4850 4150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4780 4150 50  0001 C CNN
F 3 "~" H 4850 4150 50  0001 C CNN
	1    4850 4150
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F37FFAF
P 4850 4250
AR Path="/5F37FFAF" Ref="R?"  Part="1" 
AR Path="/5F35645B/5F37FFAF" Ref="R8"  Part="1" 
F 0 "R8" V 4850 4400 50  0000 C CNN
F 1 "200" V 4850 4250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4780 4250 50  0001 C CNN
F 3 "~" H 4850 4250 50  0001 C CNN
	1    4850 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5F37FFB5
P 4850 4350
AR Path="/5F37FFB5" Ref="R?"  Part="1" 
AR Path="/5F35645B/5F37FFB5" Ref="R17"  Part="1" 
F 0 "R17" V 4850 4500 50  0000 C CNN
F 1 "200" V 4850 4350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 4780 4350 50  0001 C CNN
F 3 "~" H 4850 4350 50  0001 C CNN
	1    4850 4350
	0    1    1    0   
$EndComp
$Comp
L Device:LED D?
U 1 1 5F37FFBB
P 5250 3650
AR Path="/5F37FFBB" Ref="D?"  Part="1" 
AR Path="/5F35645B/5F37FFBB" Ref="D1"  Part="1" 
F 0 "D1" H 5250 3650 50  0000 C CNN
F 1 "LED" H 5400 3600 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5250 3650 50  0001 C CNN
F 3 "~" H 5250 3650 50  0001 C CNN
	1    5250 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F37FFC1
P 5250 3750
AR Path="/5F37FFC1" Ref="D?"  Part="1" 
AR Path="/5F35645B/5F37FFC1" Ref="D2"  Part="1" 
F 0 "D2" H 5250 3750 50  0000 C CNN
F 1 "LED" H 5400 3900 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5250 3750 50  0001 C CNN
F 3 "~" H 5250 3750 50  0001 C CNN
	1    5250 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F37FFC7
P 5250 3850
AR Path="/5F37FFC7" Ref="D?"  Part="1" 
AR Path="/5F35645B/5F37FFC7" Ref="D3"  Part="1" 
F 0 "D3" H 5250 3850 50  0000 C CNN
F 1 "LED" H 5400 3900 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5250 3850 50  0001 C CNN
F 3 "~" H 5250 3850 50  0001 C CNN
	1    5250 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F37FFCD
P 5250 3950
AR Path="/5F37FFCD" Ref="D?"  Part="1" 
AR Path="/5F35645B/5F37FFCD" Ref="D4"  Part="1" 
F 0 "D4" H 5250 3950 50  0000 C CNN
F 1 "LED" H 5400 4000 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5250 3950 50  0001 C CNN
F 3 "~" H 5250 3950 50  0001 C CNN
	1    5250 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F37FFD3
P 5250 4050
AR Path="/5F37FFD3" Ref="D?"  Part="1" 
AR Path="/5F35645B/5F37FFD3" Ref="D5"  Part="1" 
F 0 "D5" H 5250 4050 50  0000 C CNN
F 1 "LED" H 5400 4100 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5250 4050 50  0001 C CNN
F 3 "~" H 5250 4050 50  0001 C CNN
	1    5250 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F37FFD9
P 5250 4150
AR Path="/5F37FFD9" Ref="D?"  Part="1" 
AR Path="/5F35645B/5F37FFD9" Ref="D6"  Part="1" 
F 0 "D6" H 5250 4150 50  0000 C CNN
F 1 "LED" H 5400 4200 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5250 4150 50  0001 C CNN
F 3 "~" H 5250 4150 50  0001 C CNN
	1    5250 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F37FFDF
P 5250 4250
AR Path="/5F37FFDF" Ref="D?"  Part="1" 
AR Path="/5F35645B/5F37FFDF" Ref="D7"  Part="1" 
F 0 "D7" H 5250 4250 50  0000 C CNN
F 1 "LED" H 5400 4300 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5250 4250 50  0001 C CNN
F 3 "~" H 5250 4250 50  0001 C CNN
	1    5250 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5F37FFE5
P 5250 4350
AR Path="/5F37FFE5" Ref="D?"  Part="1" 
AR Path="/5F35645B/5F37FFE5" Ref="D8"  Part="1" 
F 0 "D8" H 5250 4350 50  0000 C CNN
F 1 "LED" H 5400 4400 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5250 4350 50  0001 C CNN
F 3 "~" H 5250 4350 50  0001 C CNN
	1    5250 4350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC245 U?
U 1 1 5F37FFEB
P 6000 3850
AR Path="/5F37FFEB" Ref="U?"  Part="1" 
AR Path="/5F35645B/5F37FFEB" Ref="U2"  Part="1" 
F 0 "U2" H 5750 3200 50  0000 C CNN
F 1 "74HC245" H 6300 3200 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket" H 6000 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC245" H 6000 3850 50  0001 C CNN
	1    6000 3850
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 3650 7150 3650
Wire Wire Line
	6500 3850 7150 3850
Wire Wire Line
	6500 3950 7150 3950
Wire Wire Line
	6500 4050 7150 4050
Wire Wire Line
	6500 4150 7150 4150
Wire Wire Line
	6500 4250 7150 4250
Wire Wire Line
	6500 4350 7150 4350
Wire Wire Line
	5000 3650 5100 3650
Wire Wire Line
	5100 3750 5000 3750
Wire Wire Line
	5000 3850 5100 3850
Wire Wire Line
	5100 3950 5000 3950
Wire Wire Line
	5000 4050 5100 4050
Wire Wire Line
	5100 4150 5000 4150
Wire Wire Line
	5000 4250 5100 4250
Wire Wire Line
	5100 4350 5000 4350
Wire Wire Line
	5400 4350 5500 4350
Wire Wire Line
	5500 4250 5400 4250
Wire Wire Line
	5400 4150 5500 4150
Wire Wire Line
	5500 4050 5400 4050
Wire Wire Line
	5400 3950 5500 3950
Wire Wire Line
	5500 3850 5400 3850
Wire Wire Line
	5400 3750 5500 3750
Wire Wire Line
	5500 3650 5400 3650
Wire Wire Line
	6500 3750 7150 3750
$EndSCHEMATC
