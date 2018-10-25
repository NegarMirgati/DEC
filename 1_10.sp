******** Digital Electronics, Template code********

************ Library *************
.inc '32nm_bulk.pm'

********* Params*******
.param			Lmin=32n
+beta= 10
+Wp='2*Lmin*beta'
+Wn='2*Lmin'
+Vdd=1.1V

****** temp ******
.temp	25
****** Sources ******
V			1		0		DC		Vdd
Vin				a		0		pulse	0	Vdd		5n	10p	10p	20n 100n


***** Transistor ******
Mp				out		a		1		1		pmos		l='Lmin'		w='Wp'	
Mn            out     a       0     0     nmos        l = 'lmin'      w='Wn'

*************Type of Analysis********
.tran 0.1ns	6u 	 
.dc	Vin	0	Vdd	0.01

********Measurements******
.MEASURE TRAN to_rise
+ trig V(out) val = '0.1*VDD'  rise = 1
+ targ V(out) val = '0.9*VDD'  rise = 1

.MEASURE TRAN to_fall
+ trig V(out) val = '0.9*VDD'  fall = 1
+ targ V(out) val = '0.1*VDD'  fall = 1

.END