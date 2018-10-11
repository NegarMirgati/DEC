******** Digital Electronics, Template code********

************ Library *************
.inc '32nm_bulk.pm'

********* Params*******
.param			Lmin=32n
+beta=2
+Wp='2*Lmin*beta'
+Wn='2*Lmin'
+Vdd=1.1V

****** Sources ******
VSupply			Vs		gnd		DC		Vdd
Vin				a		gnd		pulse	0	Vdd		5n	10p	10p	20n 100n


***** Transistor ******
Mp				out		a		Vs		Vs		pmos		l='Lmin'		w='Wp'	
Mn            out     a       gnd     gnd     nmos        l = 'lmin'      w='Wn'

*** Cap ******
CL				out		gnd		50f

*************Type of Analysis********
.tran 	1p 200n 1p	
.dc	vin	0	Vdd	0.01

*******************Measurements*************************************

.meas		tran	AVGpower avg	Power	from=0		to=6u

.meas tran tpHL
+trig V(a) td=100n val='Vdd/2'	rise=1
+targ V(out) td=100n val='Vdd/2' fall=1

.meas tran tpLH
+trig V(a) td=20n val='Vdd/2'	fall=1
+targ V(out) td=20n val='Vdd/2' rise=1

.meas	tran tpd	PARAM=('(tpHL+tpLH)/2')

.END