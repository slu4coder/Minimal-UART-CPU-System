EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5F8D4239
P 7600 5550
F 0 "A?" V 7600 5150 50  0000 R CNN
F 1 "Arduino_Nano_v3.x" V 7700 5750 50  0000 R CNN
F 2 "Module:Arduino_Nano" H 7600 5550 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 7600 5550 50  0001 C CNN
	1    7600 5550
	0    1    1    0   
$EndComp
$Comp
L 74xx:74HC595 U?
U 1 1 5F996795
P 7600 2950
F 0 "U?" V 7700 2700 50  0000 L CNN
F 1 "74HC595" V 7600 2700 50  0000 L CNN
F 2 "" H 7600 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 7600 2950 50  0001 C CNN
	1    7600 2950
	0    1    -1   0   
$EndComp
Text HLabel 4800 2550 1    50   Output ~ 0
D0
Text HLabel 5900 2550 1    50   Output ~ 0
A13
Text HLabel 6000 2550 1    50   Output ~ 0
A12
Text HLabel 6100 2550 1    50   Output ~ 0
A11
Text HLabel 6200 2550 1    50   Output ~ 0
A10
Text HLabel 6300 2550 1    50   Output ~ 0
A9
Text HLabel 6400 2550 1    50   Output ~ 0
A8
Text HLabel 7300 2550 1    50   Output ~ 0
A7
Text HLabel 7400 2550 1    50   Output ~ 0
A6
Text HLabel 7500 2550 1    50   Output ~ 0
A5
Text HLabel 7600 2550 1    50   Output ~ 0
A4
Text HLabel 7700 2550 1    50   Output ~ 0
A3
Text HLabel 7800 2550 1    50   Output ~ 0
A2
Text HLabel 7900 2550 1    50   Output ~ 0
A1
Text HLabel 8000 2550 1    50   Output ~ 0
A0
$Comp
L 74xx:74HC595 U?
U 1 1 5F9A8964
P 6000 2950
F 0 "U?" V 6100 2700 50  0000 L CNN
F 1 "74HC595" V 6000 2700 50  0000 L CNN
F 2 "" H 6000 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 6000 2950 50  0001 C CNN
	1    6000 2950
	0    1    -1   0   
$EndComp
$Comp
L 74xx:74HC595 U?
U 1 1 5F9A9CEF
P 4400 2950
F 0 "U?" V 4500 2700 50  0000 L CNN
F 1 "74HC595" V 4400 2700 50  0000 L CNN
F 2 "" H 4400 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 4400 2950 50  0001 C CNN
	1    4400 2950
	0    1    -1   0   
$EndComp
Wire Wire Line
	6400 3350 6750 3350
Wire Wire Line
	6750 3350 6750 2450
Wire Wire Line
	6750 2450 7100 2450
Wire Wire Line
	7100 2550 7100 2450
Wire Wire Line
	5500 2550 5500 2450
Wire Wire Line
	5500 2450 5150 2450
Wire Wire Line
	5150 2450 5150 3350
Wire Wire Line
	5150 3350 4800 3350
NoConn ~ 5700 2550
NoConn ~ 5800 2550
Text HLabel 4700 2550 1    50   Output ~ 0
D1
Text HLabel 4600 2550 1    50   Output ~ 0
D2
Text HLabel 4500 2550 1    50   Output ~ 0
D3
Text HLabel 4400 2550 1    50   Output ~ 0
D4
Text HLabel 4300 2550 1    50   Output ~ 0
D5
Text HLabel 4200 2550 1    50   Output ~ 0
D6
Text HLabel 4100 2550 1    50   Output ~ 0
D7
NoConn ~ 3900 2550
$Comp
L power:+5V #PWR?
U 1 1 5F9C36C6
P 4500 3350
F 0 "#PWR?" H 4500 3200 50  0001 C CNN
F 1 "+5V" V 4515 3523 50  0000 C CNN
F 2 "" H 4500 3350 50  0001 C CNN
F 3 "" H 4500 3350 50  0001 C CNN
	1    4500 3350
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F9C44F0
P 6100 3350
F 0 "#PWR?" H 6100 3200 50  0001 C CNN
F 1 "+5V" V 6115 3523 50  0000 C CNN
F 2 "" H 6100 3350 50  0001 C CNN
F 3 "" H 6100 3350 50  0001 C CNN
	1    6100 3350
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F9C4D60
P 7700 3350
F 0 "#PWR?" H 7700 3200 50  0001 C CNN
F 1 "+5V" V 7715 3523 50  0000 C CNN
F 2 "" H 7700 3350 50  0001 C CNN
F 3 "" H 7700 3350 50  0001 C CNN
	1    7700 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	7800 3350 7800 3750
Wire Wire Line
	7800 3750 6200 3750
Wire Wire Line
	6200 3750 6200 3350
Wire Wire Line
	6200 3750 4600 3750
Wire Wire Line
	4600 3750 4600 3350
Connection ~ 6200 3750
Wire Wire Line
	4200 3350 4200 3950
Wire Wire Line
	7400 3350 7400 3950
Wire Wire Line
	7400 3950 5800 3950
Wire Wire Line
	5800 3950 5800 3350
Wire Wire Line
	5800 3950 4200 3950
Connection ~ 5800 3950
Text HLabel 3800 3950 0    50   Input ~ 0
~DATA_ENABLE
Wire Wire Line
	3800 3950 4200 3950
Connection ~ 4200 3950
Wire Wire Line
	4300 3350 4300 3850
Wire Wire Line
	4300 3850 5900 3850
Wire Wire Line
	5900 3850 5900 3350
Wire Wire Line
	7500 3850 7500 3350
Wire Wire Line
	8000 5050 8000 3350
Connection ~ 7800 3750
Wire Wire Line
	7800 3750 7900 3750
Wire Wire Line
	7900 3750 7900 5050
Wire Wire Line
	5900 3850 7500 3850
Connection ~ 5900 3850
Text HLabel 7400 5050 1    50   Output ~ 0
PIXELCLOCK
Text Notes 6050 4800 0    50   ~ 0
RCLK happens during first half\nof VGA access, when 74595 is\nnot outputing.
Wire Wire Line
	7800 3850 7500 3850
Wire Wire Line
	7800 3850 7800 5050
Connection ~ 7500 3850
$EndSCHEMATC
