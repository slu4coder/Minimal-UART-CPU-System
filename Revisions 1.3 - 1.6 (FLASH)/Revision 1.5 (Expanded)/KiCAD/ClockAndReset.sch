EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 10 10
Title "Clock and Reset"
Date "2021-04-16"
Rev "1.5"
Comp ""
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 60B458FD
P 4250 4350
AR Path="/60B458FD" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/60B458FD" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/60B458FD" Ref="#PWR0192"  Part="1" 
F 0 "#PWR0192" H 4250 4100 50  0001 C CNN
F 1 "GND" H 4250 4200 50  0000 C CNN
F 2 "" H 4250 4350 50  0001 C CNN
F 3 "" H 4250 4350 50  0001 C CNN
	1    4250 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60B45903
P 5850 4350
AR Path="/60B45903" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/60B45903" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/60B45903" Ref="#PWR0193"  Part="1" 
F 0 "#PWR0193" H 5850 4200 50  0001 C CNN
F 1 "+5V" H 5900 4500 50  0000 C CNN
F 2 "" H 5850 4350 50  0001 C CNN
F 3 "" H 5850 4350 50  0001 C CNN
	1    5850 4350
	1    0    0    -1  
$EndComp
Text GLabel 5950 5500 2    50   Output ~ 0
CLOCK
$Comp
L power:GND #PWR?
U 1 1 60B45931
P 4450 3200
AR Path="/60B45931" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/60B45931" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/60B45931" Ref="#PWR0197"  Part="1" 
F 0 "#PWR0197" H 4450 2950 50  0001 C CNN
F 1 "GND" H 4450 3050 50  0000 C CNN
F 2 "" H 4450 3200 50  0001 C CNN
F 3 "" H 4450 3200 50  0001 C CNN
	1    4450 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60B45937
P 5050 3200
AR Path="/60B45937" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/60B45937" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/60B45937" Ref="#PWR0198"  Part="1" 
F 0 "#PWR0198" H 5050 3050 50  0001 C CNN
F 1 "+5V" H 5100 3350 50  0000 C CNN
F 2 "" H 5050 3200 50  0001 C CNN
F 3 "" H 5050 3200 50  0001 C CNN
	1    5050 3200
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:ACO-xxxMHz X?
U 1 1 60B4593D
P 4750 3200
AR Path="/60B4593D" Ref="X?"  Part="1" 
AR Path="/6026EA31/60B4593D" Ref="X?"  Part="1" 
AR Path="/60B12F32/60B4593D" Ref="X1"  Part="1" 
F 0 "X1" V 4900 3550 50  0000 R CNN
F 1 "3.6864MHz" V 4500 3400 50  0000 R CNN
F 2 "Oscillator:Oscillator_DIP-14" H 5200 2850 50  0001 C CNN
F 3 "http://www.conwin.com/datasheets/cx/cx030.pdf" H 4650 3200 50  0001 C CNN
	1    4750 3200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60B5FE1C
P 2350 3450
AR Path="/60B5FE1C" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/60B5FE1C" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/60B5FE1C" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/60B5FE1C" Ref="#PWR0199"  Part="1" 
F 0 "#PWR0199" H 2350 3200 50  0001 C CNN
F 1 "GND" H 2355 3277 50  0000 C CNN
F 2 "" H 2350 3450 50  0001 C CNN
F 3 "" H 2350 3450 50  0001 C CNN
	1    2350 3450
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW?
U 1 1 60B5FE22
P 2550 3450
AR Path="/60B5FE22" Ref="SW?"  Part="1" 
AR Path="/5EC57429/60B5FE22" Ref="SW?"  Part="1" 
AR Path="/6026EA31/60B5FE22" Ref="SW?"  Part="1" 
AR Path="/60B12F32/60B5FE22" Ref="SW1"  Part="1" 
F 0 "SW1" H 2550 3735 50  0000 C CNN
F 1 "RESET" H 2550 3644 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 2550 3650 50  0001 C CNN
F 3 "~" H 2550 3650 50  0001 C CNN
	1    2550 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60B5FE28
P 2750 3150
AR Path="/60B5FE28" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/60B5FE28" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/60B5FE28" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/60B5FE28" Ref="#PWR0200"  Part="1" 
F 0 "#PWR0200" H 2750 3000 50  0001 C CNN
F 1 "+5V" H 2765 3323 50  0000 C CNN
F 2 "" H 2750 3150 50  0001 C CNN
F 3 "" H 2750 3150 50  0001 C CNN
	1    2750 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60B5FE2E
P 2750 3300
AR Path="/60B5FE2E" Ref="R?"  Part="1" 
AR Path="/5EC57429/60B5FE2E" Ref="R?"  Part="1" 
AR Path="/6026EA31/60B5FE2E" Ref="R?"  Part="1" 
AR Path="/60B12F32/60B5FE2E" Ref="R1"  Part="1" 
F 0 "R1" H 2600 3300 50  0000 L CNN
F 1 "4.7k" V 2750 3200 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2680 3300 50  0001 C CNN
F 3 "~" H 2750 3300 50  0001 C CNN
	1    2750 3300
	-1   0    0    1   
$EndComp
Text GLabel 2900 3450 2    50   Output ~ 0
~RESET
Wire Wire Line
	2750 3450 2900 3450
Connection ~ 2750 3450
$Comp
L Device:LED D3
U 1 1 607E19DB
P 2800 4550
F 0 "D3" V 2839 4433 50  0000 R CNN
F 1 "5V" V 2748 4433 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 2800 4550 50  0001 C CNN
F 3 "~" H 2800 4550 50  0001 C CNN
	1    2800 4550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 607E2ECE
P 2800 4700
AR Path="/607E2ECE" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/607E2ECE" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/607E2ECE" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 2800 4450 50  0001 C CNN
F 1 "GND" H 2800 4550 50  0000 C CNN
F 2 "" H 2800 4700 50  0001 C CNN
F 3 "" H 2800 4700 50  0001 C CNN
	1    2800 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 607E36A3
P 2800 4250
AR Path="/607E36A3" Ref="R?"  Part="1" 
AR Path="/5EC57429/607E36A3" Ref="R?"  Part="1" 
AR Path="/6026EA31/607E36A3" Ref="R?"  Part="1" 
AR Path="/60B12F32/607E36A3" Ref="R13"  Part="1" 
F 0 "R13" H 2550 4250 50  0000 L CNN
F 1 "1k" V 2800 4200 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2730 4250 50  0001 C CNN
F 3 "~" H 2800 4250 50  0001 C CNN
	1    2800 4250
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 607E3CB0
P 2800 4100
AR Path="/607E3CB0" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/607E3CB0" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/607E3CB0" Ref="#PWR06"  Part="1" 
F 0 "#PWR06" H 2800 3950 50  0001 C CNN
F 1 "+5V" H 2850 4250 50  0000 C CNN
F 2 "" H 2800 4100 50  0001 C CNN
F 3 "" H 2800 4100 50  0001 C CNN
	1    2800 4100
	1    0    0    -1  
$EndComp
NoConn ~ 5050 4850
$Comp
L power:+5V #PWR?
U 1 1 6079A90A
P 4550 3850
AR Path="/6079A90A" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6079A90A" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/6079A90A" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 4550 3700 50  0001 C CNN
F 1 "+5V" V 4550 4050 50  0000 C CNN
F 2 "" H 4550 3850 50  0001 C CNN
F 3 "" H 4550 3850 50  0001 C CNN
	1    4550 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 3850 4750 3500
$Comp
L power:GND #PWR?
U 1 1 6079D5DC
P 5250 3850
AR Path="/6079D5DC" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6079D5DC" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/6079D5DC" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 5250 3600 50  0001 C CNN
F 1 "GND" V 5250 3650 50  0000 C CNN
F 2 "" H 5250 3850 50  0001 C CNN
F 3 "" H 5250 3850 50  0001 C CNN
	1    5250 3850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6079DDC4
P 5350 3850
AR Path="/6079DDC4" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6079DDC4" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/6079DDC4" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 5350 3600 50  0001 C CNN
F 1 "GND" V 5350 3650 50  0000 C CNN
F 2 "" H 5350 3850 50  0001 C CNN
F 3 "" H 5350 3850 50  0001 C CNN
	1    5350 3850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6079DF24
P 5450 3850
AR Path="/6079DF24" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6079DF24" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/6079DF24" Ref="#PWR0194"  Part="1" 
F 0 "#PWR0194" H 5450 3600 50  0001 C CNN
F 1 "GND" V 5450 3650 50  0000 C CNN
F 2 "" H 5450 3850 50  0001 C CNN
F 3 "" H 5450 3850 50  0001 C CNN
	1    5450 3850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6079DFFC
P 5550 3850
AR Path="/6079DFFC" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6079DFFC" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/6079DFFC" Ref="#PWR0195"  Part="1" 
F 0 "#PWR0195" H 5550 3600 50  0001 C CNN
F 1 "GND" V 5550 3650 50  0000 C CNN
F 2 "" H 5550 3850 50  0001 C CNN
F 3 "" H 5550 3850 50  0001 C CNN
	1    5550 3850
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6079E123
P 4850 3850
AR Path="/6079E123" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6079E123" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/6079E123" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 4850 3700 50  0001 C CNN
F 1 "+5V" V 4850 4050 50  0000 C CNN
F 2 "" H 4850 3850 50  0001 C CNN
F 3 "" H 4850 3850 50  0001 C CNN
	1    4850 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6079E4AF
P 4950 3850
AR Path="/6079E4AF" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6079E4AF" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/6079E4AF" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 4950 3700 50  0001 C CNN
F 1 "+5V" V 4950 4050 50  0000 C CNN
F 2 "" H 4950 3850 50  0001 C CNN
F 3 "" H 4950 3850 50  0001 C CNN
	1    4950 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6079E64B
P 5050 3850
AR Path="/6079E64B" Ref="#PWR?"  Part="1" 
AR Path="/6026EA31/6079E64B" Ref="#PWR?"  Part="1" 
AR Path="/60B12F32/6079E64B" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 5050 3700 50  0001 C CNN
F 1 "+5V" V 5050 4050 50  0000 C CNN
F 2 "" H 5050 3850 50  0001 C CNN
F 3 "" H 5050 3850 50  0001 C CNN
	1    5050 3850
	1    0    0    -1  
$EndComp
$Comp
L 8-Bit~CPU~32k:74HC161 U2
U 1 1 607952D3
P 5050 4350
F 0 "U2" V 5000 4300 50  0000 L CNN
F 1 "74HC161" V 5100 4200 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 5050 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 5050 4350 50  0001 C CNN
	1    5050 4350
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J2
U 1 1 60752DEF
P 5450 5300
F 0 "J2" V 5500 5650 50  0000 C CNN
F 1 "CPU CLOCK" V 5500 4800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 5450 5300 50  0001 C CNN
F 3 "~" H 5450 5300 50  0001 C CNN
	1    5450 5300
	0    1    -1   0   
$EndComp
Wire Wire Line
	5350 5500 5450 5500
Connection ~ 5450 5500
Wire Wire Line
	5450 5500 5550 5500
Connection ~ 5550 5500
Wire Wire Line
	5550 5500 5650 5500
Wire Wire Line
	5950 5500 5650 5500
Connection ~ 5650 5500
Wire Wire Line
	5250 5500 5350 5500
Connection ~ 5350 5500
Wire Wire Line
	5550 5000 5550 4850
Wire Wire Line
	5450 5000 5450 4850
Wire Wire Line
	5350 5000 5350 4850
Wire Wire Line
	5250 5000 5250 4850
Wire Wire Line
	4750 3500 6000 3500
Wire Wire Line
	6000 3500 6000 5000
Wire Wire Line
	6000 5000 5650 5000
Connection ~ 4750 3500
Text Notes 4550 2750 0    50   ~ 0
A 7.3728MHz crystal may also be\nused with a divider of 2 or higher.
$EndSCHEMATC
