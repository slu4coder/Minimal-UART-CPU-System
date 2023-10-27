EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 9
Title "Control Logic"
Date "2020-12-16"
Rev "1.2"
Comp "by Carsten Herting (2020)"
Comment1 ""
Comment2 "creativecommons.org/licenses/by-nc-sa/3.0/deed.en"
Comment3 "License: CC BY-NC-SA 3.0"
Comment4 "Author: Carsten Herting (Slu4)"
$EndDescr
Text HLabel 7100 1650 1    50   Input ~ 0
BUS0
Text HLabel 7000 1650 1    50   Input ~ 0
BUS1
Text HLabel 6900 1650 1    50   Input ~ 0
BUS2
Text HLabel 6800 1650 1    50   Input ~ 0
BUS3
Text HLabel 4900 1650 1    50   Input ~ 0
BUS4
Text HLabel 4800 1650 1    50   Input ~ 0
BUS5
Text HLabel 5500 3850 1    50   Output ~ 0
~CO
Text HLabel 5400 3850 1    50   Output ~ 0
~CI
Text HLabel 8150 3850 1    50   Output ~ 0
HI
Text HLabel 8550 3850 1    50   Output ~ 0
~AI
Text HLabel 8450 5350 3    50   Output ~ 0
~AO
Text HLabel 8350 5350 3    50   Output ~ 0
~BI
Text HLabel 8250 5350 3    50   Output ~ 0
~BO
Text HLabel 8250 3850 1    50   Output ~ 0
~MI
Text HLabel 5500 5400 3    50   Output ~ 0
~EO
Text HLabel 5600 5400 3    50   Output ~ 0
ES
Text HLabel 5700 5400 3    50   Output ~ 0
EC
Text HLabel 8350 3850 1    50   Output ~ 0
~RI
Text HLabel 8450 3850 1    50   Output ~ 0
~RO
Text HLabel 5600 3850 1    50   Output ~ 0
CE
Text HLabel 2700 1750 1    50   Input ~ 0
FLAG_C
Text HLabel 2600 1750 1    50   Input ~ 0
FLAG_N
Text HLabel 2800 1750 1    50   Input ~ 0
FLAG_Z
$Comp
L power:GND #PWR?
U 1 1 5F96FA36
P 3400 2300
AR Path="/5EC573DA/5F96FA36" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA36" Ref="#PWR030"  Part="1" 
F 0 "#PWR030" H 3400 2050 50  0001 C CNN
F 1 "GND" H 3500 2150 50  0000 R CNN
F 2 "" H 3400 2300 50  0001 C CNN
F 3 "" H 3400 2300 50  0001 C CNN
	1    3400 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F96FA3C
P 5200 2300
AR Path="/5EC573DA/5F96FA3C" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA3C" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 5200 2150 50  0001 C CNN
F 1 "+5V" V 5215 2428 50  0000 L CNN
F 2 "" H 5200 2300 50  0001 C CNN
F 3 "" H 5200 2300 50  0001 C CNN
	1    5200 2300
	1    0    0    -1  
$EndComp
Text GLabel 6100 1800 1    50   Input ~ 0
CLOCK
Text GLabel 3900 1800 1    50   Input ~ 0
CLOCK
Wire Wire Line
	4000 1800 4100 1800
$Comp
L power:GND #PWR?
U 1 1 5F96FA4C
P 4300 1750
AR Path="/5EC573DA/5F96FA4C" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA4C" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 4300 1500 50  0001 C CNN
F 1 "GND" V 4305 1577 50  0000 C CNN
F 2 "" H 4300 1750 50  0001 C CNN
F 3 "" H 4300 1750 50  0001 C CNN
	1    4300 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	4100 1800 4100 1300
Wire Wire Line
	6300 1300 6300 1800
$Comp
L power:GND #PWR?
U 1 1 5F96FA8F
P 5600 2300
AR Path="/5EC573DA/5F96FA8F" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA8F" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 5600 2050 50  0001 C CNN
F 1 "GND" H 5700 2150 50  0000 R CNN
F 2 "" H 5600 2300 50  0001 C CNN
F 3 "" H 5600 2300 50  0001 C CNN
	1    5600 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F96FAA0
P 7400 2300
AR Path="/5EC573DA/5F96FAA0" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FAA0" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 7400 2150 50  0001 C CNN
F 1 "+5V" H 7450 2400 50  0000 L CNN
F 2 "" H 7400 2300 50  0001 C CNN
F 3 "" H 7400 2300 50  0001 C CNN
	1    7400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 1800 6300 1800
Wire Wire Line
	6500 1800 6600 1800
$Comp
L power:GND #PWR?
U 1 1 5F9762E3
P 1300 2300
AR Path="/5EC573DA/5F9762E3" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F9762E3" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 1300 2050 50  0001 C CNN
F 1 "GND" H 1400 2150 50  0000 R CNN
F 2 "" H 1300 2300 50  0001 C CNN
F 3 "" H 1300 2300 50  0001 C CNN
	1    1300 2300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5F97666F
P 3100 2300
AR Path="/5EC573DA/5F97666F" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F97666F" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 3100 2150 50  0001 C CNN
F 1 "+5V" V 3115 2428 50  0000 L CNN
F 2 "" H 3100 2300 50  0001 C CNN
F 3 "" H 3100 2300 50  0001 C CNN
	1    3100 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F996FBD
P 2200 1800
AR Path="/5EC573DA/5F996FBD" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F996FBD" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 2200 1550 50  0001 C CNN
F 1 "GND" V 2205 1672 50  0000 R CNN
F 2 "" H 2200 1800 50  0001 C CNN
F 3 "" H 2200 1800 50  0001 C CNN
	1    2200 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 1750 2800 1800
Wire Wire Line
	2600 1750 2600 1800
Wire Wire Line
	1900 1800 2000 1800
Text GLabel 1800 1800 1    50   Input ~ 0
CLOCK
NoConn ~ 2500 2800
NoConn ~ 4600 2800
NoConn ~ 4700 2800
Wire Wire Line
	7750 5100 7750 5850
Wire Wire Line
	7100 5850 7100 2800
Wire Wire Line
	7650 5100 7650 5900
Wire Wire Line
	7000 5900 7000 2800
Wire Wire Line
	6900 2800 6900 5950
Wire Wire Line
	7450 5100 7450 6000
Wire Wire Line
	6800 6000 6800 2800
Wire Wire Line
	7750 4100 7750 3250
Wire Wire Line
	7550 4100 7550 3350
Wire Wire Line
	4900 1800 4900 1650
Wire Wire Line
	4800 1800 4800 1650
Wire Wire Line
	7100 1800 7100 1650
Wire Wire Line
	7000 1800 7000 1650
Wire Wire Line
	6900 1800 6900 1650
Wire Wire Line
	6800 1800 6800 1650
Wire Wire Line
	5400 5650 8150 5650
Connection ~ 8150 5650
Wire Wire Line
	8150 5650 8150 5100
Wire Wire Line
	8050 5700 5300 5700
Connection ~ 8050 5700
Wire Wire Line
	8050 5700 8050 5100
Wire Wire Line
	5200 5750 7950 5750
Connection ~ 7950 5750
Wire Wire Line
	7950 5750 7950 5100
Wire Wire Line
	7850 5800 5100 5800
Connection ~ 7850 5800
Wire Wire Line
	7850 5800 7850 5100
Wire Wire Line
	7650 5900 7000 5900
Wire Wire Line
	7550 5950 7550 5100
Wire Wire Line
	7450 6000 6800 6000
Wire Wire Line
	7350 6050 7350 5100
Wire Wire Line
	4800 3350 7550 3350
Wire Wire Line
	7650 3300 4900 3300
Wire Wire Line
	7650 3300 7650 4100
Wire Wire Line
	5200 3200 7950 3200
Wire Wire Line
	7950 3200 7950 4100
Wire Wire Line
	7750 3250 5000 3250
$Comp
L power:+5V #PWR?
U 1 1 5FA1E152
P 7250 4100
AR Path="/5EC573DA/5FA1E152" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA1E152" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 7250 3950 50  0001 C CNN
F 1 "+5V" V 7265 4228 50  0000 L CNN
F 2 "" H 7250 4100 50  0001 C CNN
F 3 "" H 7250 4100 50  0001 C CNN
	1    7250 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA36417
P 8550 5100
AR Path="/5EC573DA/5FA36417" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA36417" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 8550 4850 50  0001 C CNN
F 1 "GND" V 8555 4972 50  0000 R CNN
F 2 "" H 8550 5100 50  0001 C CNN
F 3 "" H 8550 5100 50  0001 C CNN
	1    8550 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 5700 9650 5700
Connection ~ 7100 5850
Wire Wire Line
	7100 5850 7750 5850
Connection ~ 7000 5900
Connection ~ 6900 5950
Wire Wire Line
	6900 5950 7550 5950
Connection ~ 6800 6000
Wire Wire Line
	5000 3250 2700 3250
Connection ~ 5000 3250
Wire Wire Line
	5200 3200 2800 3200
Connection ~ 5200 3200
Wire Wire Line
	5000 5850 7100 5850
Wire Wire Line
	7000 5900 4900 5900
Wire Wire Line
	4800 5950 6900 5950
Wire Wire Line
	6800 6000 4700 6000
Wire Wire Line
	4600 6050 7350 6050
Wire Wire Line
	4900 5900 4900 5100
Wire Wire Line
	4800 5100 4800 5950
Wire Wire Line
	4700 6000 4700 5100
$Comp
L power:+5V #PWR?
U 1 1 5FA1DAD5
P 4500 4100
AR Path="/5EC573DA/5FA1DAD5" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA1DAD5" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 4500 3950 50  0001 C CNN
F 1 "+5V" V 4515 4228 50  0000 L CNN
F 2 "" H 4500 4100 50  0001 C CNN
F 3 "" H 4500 4100 50  0001 C CNN
	1    4500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4100 4800 3350
Wire Wire Line
	4900 3300 4900 4100
Wire Wire Line
	5000 3250 5000 4100
Wire Wire Line
	5200 4100 5200 3200
Wire Wire Line
	4600 5100 4600 5200
Wire Wire Line
	5400 5100 5400 5650
Wire Wire Line
	5300 5100 5300 5700
Wire Wire Line
	5200 5100 5200 5750
Wire Wire Line
	5100 5100 5100 5800
Wire Wire Line
	5000 5100 5000 5850
Wire Wire Line
	2800 2800 2800 3200
Wire Wire Line
	2700 2800 2700 3250
Wire Wire Line
	4800 2800 4900 2900
Wire Wire Line
	4900 2900 4900 3300
Connection ~ 4900 3300
Wire Wire Line
	4900 2800 4800 2900
Wire Wire Line
	4800 2900 4800 3350
Connection ~ 4800 3350
$Comp
L power:GND #PWR?
U 1 1 5FB90580
P 5800 5100
AR Path="/5EC573DA/5FB90580" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FB90580" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 5800 4850 50  0001 C CNN
F 1 "GND" V 5805 4972 50  0000 R CNN
F 2 "" H 5800 5100 50  0001 C CNN
F 3 "" H 5800 5100 50  0001 C CNN
	1    5800 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5100 5500 5300
Connection ~ 5500 5300
Wire Wire Line
	5500 5300 5500 5400
Wire Wire Line
	2700 1800 2700 1750
NoConn ~ 4500 5100
NoConn ~ 7250 5100
$Comp
L power:GND #PWR?
U 1 1 5F030AD8
P 1600 1800
AR Path="/5EC573DA/5F030AD8" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F030AD8" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 1600 1550 50  0001 C CNN
F 1 "GND" V 1605 1627 50  0000 C CNN
F 2 "" H 1600 1800 50  0001 C CNN
F 3 "" H 1600 1800 50  0001 C CNN
	1    1600 1800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR055
U 1 1 5F0344C4
P 8050 4100
F 0 "#PWR055" H 8050 3850 50  0001 C CNN
F 1 "GND" V 8055 3927 50  0000 C CNN
F 2 "" H 8050 4100 50  0001 C CNN
F 3 "" H 8050 4100 50  0001 C CNN
	1    8050 4100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR041
U 1 1 5F03518A
P 5300 4100
F 0 "#PWR041" H 5300 3850 50  0001 C CNN
F 1 "GND" V 5305 3927 50  0000 C CNN
F 2 "" H 5300 4100 50  0001 C CNN
F 3 "" H 5300 4100 50  0001 C CNN
	1    5300 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 1750 4300 1800
Wire Wire Line
	2200 1800 2300 1800
Wire Wire Line
	4300 1800 4400 1800
$Comp
L 8-Bit~CPU~32k:74HC173 U5
U 1 1 5F10528C
P 2200 2300
F 0 "U5" V 2300 2200 50  0000 L CNN
F 1 "74HC173" V 2200 2200 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 2200 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 2200 2300 50  0001 C CNN
	1    2200 2300
	0    1    1    0   
$EndComp
Connection ~ 2200 1800
Connection ~ 2000 1800
$Comp
L 8-Bit~CPU~32k:74HC173 U6
U 1 1 5F107679
P 4300 2300
F 0 "U6" V 4400 2200 50  0000 L CNN
F 1 "74HC173" V 4300 2150 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 4300 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 4300 2300 50  0001 C CNN
	1    4300 2300
	0    1    1    0   
$EndComp
Connection ~ 4300 1800
Connection ~ 4100 1800
$Comp
L 8-Bit~CPU~32k:74HC173 U8
U 1 1 5F108392
P 6500 2300
F 0 "U8" V 6650 2250 50  0000 L CNN
F 1 "74HC173" V 6500 2200 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6500 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS173" H 6500 2300 50  0001 C CNN
	1    6500 2300
	0    1    1    0   
$EndComp
Connection ~ 6500 1800
Connection ~ 6300 1800
Wire Wire Line
	2300 1800 2500 1800
Connection ~ 2300 1800
$Comp
L 8-Bit~CPU~32k:AT28C64B U7
U 1 1 5EFCD843
P 5200 4600
F 0 "U7" V 5100 4650 50  0000 R CNN
F 1 "AT28C64B CTRL MSB" V 5200 5050 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 5200 4600 50  0001 C CNN
F 3 "" H 5200 4600 50  0001 C CNN
	1    5200 4600
	0    -1   -1   0   
$EndComp
$Comp
L 8-Bit~CPU~32k:AT28C64B U9
U 1 1 5EFCFC1B
P 7950 4600
F 0 "U9" V 7850 4600 50  0000 R CNN
F 1 "AT28C64B CTRL LSB" V 7950 5000 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket" H 7950 4600 50  0001 C CNN
F 3 "" H 7950 4600 50  0001 C CNN
	1    7950 4600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 5300 5500 5300
Wire Wire Line
	5700 5100 5700 5400
Wire Wire Line
	5600 5100 5600 5400
Wire Wire Line
	5400 3850 5400 4100
Wire Wire Line
	5500 3850 5500 4100
Wire Wire Line
	8350 5100 8350 5350
Wire Wire Line
	8250 5100 8250 5350
Wire Wire Line
	8550 3850 8550 4100
Wire Wire Line
	8450 3850 8450 4100
Wire Wire Line
	8350 3850 8350 4100
Wire Wire Line
	8250 3850 8250 4100
Wire Wire Line
	2000 1300 1150 1300
Wire Wire Line
	2000 1300 2000 1800
Wire Wire Line
	1150 1300 1150 5300
Wire Wire Line
	4100 1300 5450 1300
$Comp
L power:GND #PWR038
U 1 1 5F47098C
P 5100 4100
F 0 "#PWR038" H 5100 3850 50  0001 C CNN
F 1 "GND" V 5105 3927 50  0000 C CNN
F 2 "" H 5100 4100 50  0001 C CNN
F 3 "" H 5100 4100 50  0001 C CNN
	1    5100 4100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR053
U 1 1 5F470BD8
P 7850 4100
F 0 "#PWR053" H 7850 3850 50  0001 C CNN
F 1 "GND" V 7855 3927 50  0000 C CNN
F 2 "" H 7850 4100 50  0001 C CNN
F 3 "" H 7850 4100 50  0001 C CNN
	1    7850 4100
	-1   0    0    1   
$EndComp
Text HLabel 6150 4000 2    50   Output ~ 0
ME
$Comp
L power:+5V #PWR?
U 1 1 5FACDD15
P 7350 4100
AR Path="/5EC573DA/5FACDD15" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FACDD15" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 7350 3950 50  0001 C CNN
F 1 "+5V" V 7365 4228 50  0000 L CNN
F 2 "" H 7350 4100 50  0001 C CNN
F 3 "" H 7350 4100 50  0001 C CNN
	1    7350 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FACDF02
P 4600 4100
AR Path="/5EC573DA/5FACDF02" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FACDF02" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 4600 3950 50  0001 C CNN
F 1 "+5V" V 4615 4228 50  0000 L CNN
F 2 "" H 4600 4100 50  0001 C CNN
F 3 "" H 4600 4100 50  0001 C CNN
	1    4600 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3E4A91
P 4600 1800
AR Path="/5EC573DA/5F3E4A91" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F3E4A91" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 4600 1550 50  0001 C CNN
F 1 "GND" V 4605 1627 50  0000 C CNN
F 2 "" H 4600 1800 50  0001 C CNN
F 3 "" H 4600 1800 50  0001 C CNN
	1    4600 1800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3E4E5B
P 4700 1800
AR Path="/5EC573DA/5F3E4E5B" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F3E4E5B" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 4700 1550 50  0001 C CNN
F 1 "GND" V 4705 1627 50  0000 C CNN
F 2 "" H 4700 1800 50  0001 C CNN
F 3 "" H 4700 1800 50  0001 C CNN
	1    4700 1800
	-1   0    0    1   
$EndComp
Text HLabel 9200 4000 2    50   Output ~ 0
~HI
Connection ~ 5450 1300
Wire Wire Line
	5450 1300 6300 1300
Wire Wire Line
	5600 3850 5600 4000
Wire Wire Line
	5600 4000 6150 4000
Connection ~ 5600 4000
Wire Wire Line
	5600 4000 5600 4100
Wire Wire Line
	8150 4000 8600 4000
Connection ~ 8150 4000
Wire Wire Line
	8150 4000 8150 4100
Wire Wire Line
	8150 3850 8150 4000
Wire Wire Line
	5450 3100 5450 1300
Wire Wire Line
	5700 3100 5700 4100
Wire Wire Line
	5700 3100 5450 3100
Wire Wire Line
	5800 3100 5800 4100
Wire Wire Line
	5800 3100 8150 3100
$Comp
L 74xx:74HC04 U1
U 1 1 5F4FBC20
P 8900 4000
F 0 "U1" H 8850 4050 50  0000 C CNN
F 1 "74HC04" H 8900 3950 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8900 4000 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/74HC_HCT04.pdf" H 8900 4000 50  0001 C CNN
	1    8900 4000
	1    0    0    -1  
$EndComp
Connection ~ 9150 1800
Wire Wire Line
	9050 1800 9150 1800
Connection ~ 9250 1800
Wire Wire Line
	9150 1800 9250 1800
$Comp
L 8-Bit~CPU~32k:74HC161 U11
U 1 1 5F109570
P 9250 2300
F 0 "U11" V 9350 2250 50  0000 L CNN
F 1 "74HC161" V 9250 2200 50  0000 L CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 9250 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS161" H 9250 2300 50  0001 C CNN
	1    9250 2300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5FA53785
P 9250 1800
AR Path="/5EC573DA/5FA53785" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA53785" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 9250 1650 50  0001 C CNN
F 1 "+5V" V 9265 1928 50  0000 L CNN
F 2 "" H 9250 1800 50  0001 C CNN
F 3 "" H 9250 1800 50  0001 C CNN
	1    9250 1800
	1    0    0    -1  
$EndComp
NoConn ~ 9250 2800
$Comp
L power:+5V #PWR?
U 1 1 5FA37491
P 10050 2300
AR Path="/5EC573DA/5FA37491" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA37491" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 10050 2150 50  0001 C CNN
F 1 "+5V" V 10065 2428 50  0000 L CNN
F 2 "" H 10050 2300 50  0001 C CNN
F 3 "" H 10050 2300 50  0001 C CNN
	1    10050 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FA36B57
P 8450 2300
AR Path="/5EC573DA/5FA36B57" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FA36B57" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 8450 2050 50  0001 C CNN
F 1 "GND" H 8500 2150 50  0000 R CNN
F 2 "" H 8450 2300 50  0001 C CNN
F 3 "" H 8450 2300 50  0001 C CNN
	1    8450 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 2800 9450 5800
Wire Wire Line
	9550 2800 9550 5750
Wire Wire Line
	9650 2800 9650 5700
Wire Wire Line
	9750 2800 9750 5650
Text GLabel 8950 1800 1    50   Input ~ 0
~CLOCK
$Comp
L power:GND #PWR?
U 1 1 5F96FAA6
P 5900 1800
AR Path="/5EC573DA/5F96FAA6" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FAA6" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 5900 1550 50  0001 C CNN
F 1 "GND" H 5905 1627 50  0000 C CNN
F 2 "" H 5900 1800 50  0001 C CNN
F 3 "" H 5900 1800 50  0001 C CNN
	1    5900 1800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F96FA9A
P 6500 1800
AR Path="/5EC573DA/5F96FA9A" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA9A" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 6500 1550 50  0001 C CNN
F 1 "GND" H 6505 1627 50  0000 C CNN
F 2 "" H 6500 1800 50  0001 C CNN
F 3 "" H 6500 1800 50  0001 C CNN
	1    6500 1800
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F96FA46
P 3700 1800
AR Path="/5EC573DA/5F96FA46" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F96FA46" Ref="#PWR031"  Part="1" 
F 0 "#PWR031" H 3700 1550 50  0001 C CNN
F 1 "GND" V 3705 1627 50  0000 C CNN
F 2 "" H 3700 1800 50  0001 C CNN
F 3 "" H 3700 1800 50  0001 C CNN
	1    3700 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	9450 5800 7850 5800
Wire Wire Line
	9550 5750 7950 5750
Wire Wire Line
	9750 5650 8150 5650
Wire Wire Line
	2600 5200 4600 5200
Connection ~ 4600 5200
Wire Wire Line
	4600 5200 4600 6050
Wire Wire Line
	2600 2800 2600 5200
Text HLabel 8150 1700 0    50   Input ~ 0
~RESET
$Comp
L 8-Bit~CPU~32k-cache:8-Bit_CPU_32k_74HC08 U19
U 3 1 5F350308
P 8450 1800
F 0 "U19" H 8400 1850 50  0000 C CNN
F 1 "74HC08" H 8450 1750 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 8450 1800 50  0001 C CNN
F 3 "" H 8450 1800 50  0001 C CNN
	3    8450 1800
	1    0    0    -1  
$EndComp
NoConn ~ 9750 1800
NoConn ~ 9650 1800
NoConn ~ 9550 1800
NoConn ~ 9450 1800
$Comp
L Device:C_Small C?
U 1 1 5F4EC4DE
P 3100 2400
AR Path="/5F645851/5F4EC4DE" Ref="C?"  Part="1" 
AR Path="/5EC57429/5F4EC4DE" Ref="C5"  Part="1" 
F 0 "C5" H 3100 2500 50  0000 L CNN
F 1 "100nF" H 3100 2300 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3100 2400 50  0001 C CNN
F 3 "~" H 3100 2400 50  0001 C CNN
	1    3100 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F4EC4E4
P 3100 2500
AR Path="/5F645851/5F4EC4E4" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F4EC4E4" Ref="#PWR029"  Part="1" 
F 0 "#PWR029" H 3100 2250 50  0001 C CNN
F 1 "GND" H 3105 2327 50  0000 C CNN
F 2 "" H 3100 2500 50  0001 C CNN
F 3 "" H 3100 2500 50  0001 C CNN
	1    3100 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F4F188D
P 5200 2400
AR Path="/5F645851/5F4F188D" Ref="C?"  Part="1" 
AR Path="/5EC57429/5F4F188D" Ref="C7"  Part="1" 
F 0 "C7" H 5200 2500 50  0000 L CNN
F 1 "100nF" H 5200 2300 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5200 2400 50  0001 C CNN
F 3 "~" H 5200 2400 50  0001 C CNN
	1    5200 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F4F1893
P 5200 2500
AR Path="/5F645851/5F4F1893" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F4F1893" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 5200 2250 50  0001 C CNN
F 1 "GND" H 5205 2327 50  0000 C CNN
F 2 "" H 5200 2500 50  0001 C CNN
F 3 "" H 5200 2500 50  0001 C CNN
	1    5200 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F4F68A6
P 7400 2400
AR Path="/5F645851/5F4F68A6" Ref="C?"  Part="1" 
AR Path="/5EC57429/5F4F68A6" Ref="C9"  Part="1" 
F 0 "C9" H 7400 2500 50  0000 L CNN
F 1 "100nF" H 7400 2300 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7400 2400 50  0001 C CNN
F 3 "~" H 7400 2400 50  0001 C CNN
	1    7400 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F4F68AC
P 7400 2500
AR Path="/5F645851/5F4F68AC" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F4F68AC" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 7400 2250 50  0001 C CNN
F 1 "GND" H 7405 2327 50  0000 C CNN
F 2 "" H 7400 2500 50  0001 C CNN
F 3 "" H 7400 2500 50  0001 C CNN
	1    7400 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F4FBBAE
P 4300 4200
AR Path="/5F645851/5F4FBBAE" Ref="C?"  Part="1" 
AR Path="/5EC57429/5F4FBBAE" Ref="C6"  Part="1" 
F 0 "C6" H 4150 4300 50  0000 L CNN
F 1 "100nF" H 4050 4100 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4300 4200 50  0001 C CNN
F 3 "~" H 4300 4200 50  0001 C CNN
	1    4300 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F4FBBB4
P 4300 4300
AR Path="/5F645851/5F4FBBB4" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F4FBBB4" Ref="#PWR032"  Part="1" 
F 0 "#PWR032" H 4300 4050 50  0001 C CNN
F 1 "GND" H 4305 4127 50  0000 C CNN
F 2 "" H 4300 4300 50  0001 C CNN
F 3 "" H 4300 4300 50  0001 C CNN
	1    4300 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4100 4500 4100
Connection ~ 4500 4100
$Comp
L Device:C_Small C?
U 1 1 5F509E87
P 6650 4200
AR Path="/5F645851/5F509E87" Ref="C?"  Part="1" 
AR Path="/5EC57429/5F509E87" Ref="C8"  Part="1" 
F 0 "C8" H 6500 4300 50  0000 L CNN
F 1 "100nF" H 6400 4100 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6650 4200 50  0001 C CNN
F 3 "~" H 6650 4200 50  0001 C CNN
	1    6650 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F509E8D
P 6650 4300
AR Path="/5F645851/5F509E8D" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F509E8D" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 6650 4050 50  0001 C CNN
F 1 "GND" H 6655 4127 50  0000 C CNN
F 2 "" H 6650 4300 50  0001 C CNN
F 3 "" H 6650 4300 50  0001 C CNN
	1    6650 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4100 7250 4100
Connection ~ 7250 4100
$Comp
L Device:C_Small C?
U 1 1 5F6E291C
P 10050 2400
AR Path="/5F645851/5F6E291C" Ref="C?"  Part="1" 
AR Path="/5EC57429/5F6E291C" Ref="C11"  Part="1" 
F 0 "C11" H 10050 2500 50  0000 L CNN
F 1 "100nF" H 10050 2300 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10050 2400 50  0001 C CNN
F 3 "~" H 10050 2400 50  0001 C CNN
	1    10050 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F6E2922
P 10050 2500
AR Path="/5F645851/5F6E2922" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5F6E2922" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 10050 2250 50  0001 C CNN
F 1 "GND" H 10055 2327 50  0000 C CNN
F 2 "" H 10050 2500 50  0001 C CNN
F 3 "" H 10050 2500 50  0001 C CNN
	1    10050 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 5350 8450 5100
Text Notes 5800 3100 0    50   ~ 0
~IC
Text Notes 5650 3100 0    50   ~ 0
~II
Text Notes 5500 5300 0    50   ~ 0
~FI
Text Notes 2000 1300 0    50   ~ 0
~FI
$Comp
L Device:C_Small C?
U 1 1 5FC2AF22
P 8050 1900
AR Path="/5F645851/5FC2AF22" Ref="C?"  Part="1" 
AR Path="/5EC57429/5FC2AF22" Ref="C10"  Part="1" 
F 0 "C10" V 7950 1600 50  0000 L CNN
F 1 "100pF" V 7950 1800 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8050 1900 50  0001 C CNN
F 3 "~" H 8050 1900 50  0001 C CNN
	1    8050 1900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FC30053
P 7950 1900
AR Path="/5F645851/5FC30053" Ref="#PWR?"  Part="1" 
AR Path="/5EC57429/5FC30053" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 7950 1650 50  0001 C CNN
F 1 "GND" H 7850 1800 50  0000 C CNN
F 2 "" H 7950 1900 50  0001 C CNN
F 3 "" H 7950 1900 50  0001 C CNN
	1    7950 1900
	1    0    0    -1  
$EndComp
Connection ~ 3100 2300
Connection ~ 5200 2300
Connection ~ 7400 2300
Connection ~ 10050 2300
Wire Wire Line
	8150 3100 8150 2200
Connection ~ 8150 1900
$Comp
L Device:R R?
U 1 1 5FC2A84D
P 8150 2050
AR Path="/5FC2A84D" Ref="R?"  Part="1" 
AR Path="/5EC57429/5FC2A84D" Ref="R10"  Part="1" 
F 0 "R10" H 8200 2200 50  0000 L CNN
F 1 "wire" V 8150 1950 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8080 2050 50  0001 C CNN
F 3 "~" H 8150 2050 50  0001 C CNN
	1    8150 2050
	-1   0    0    1   
$EndComp
$EndSCHEMATC
