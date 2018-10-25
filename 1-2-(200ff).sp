******** Digital Electronics, Template code********

************ Library *************
.prot
.inc '32nm_bulk.pm'
.unprot

********* Params*******
.param			Lmin=32n
+beta=2
+Wp='2*Lmin*beta'
+Wn='2*Lmin'
+Vdd=1.1V
+cl =	200ff

.global Vdd
.temp	25
****** Sources ******
V 1 0 DC Vdd
Vin	    a		0		pulse	0	Vdd     0   10ps    10ps      20ns    100ns
***************Cap****************************************************
CL		out		0	cl    				  ** Capacitance of output node

***** Transistor ******
Mp				out		a		1	  1		pmos		l='Lmin'		w='Wp'	
Mn            out     a         0     0     nmos        l = 'Lmin'      w='Wn'

*************Type of Analysis********
.tran 	1p 200n 1p
.dc	Vin	0	Vdd	0.01

********Measurements******
.MEASURE TRAN to_rise
+ trig V(out) val = '0.1*Vdd'  rise = 1
+ targ V(out) val = '0.9*Vdd'  rise = 1

.MEASURE TRAN to_fall
+ trig V(out) val = '0.9*Vdd'  fall = 1
+ targ V(out) val = '0.1*Vdd'  fall = 1

.END