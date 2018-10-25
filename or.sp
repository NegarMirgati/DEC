************OR*******************
************ Library *************
.prot
.inc '32nm_bulk.pm'
.unprot

********* Params*******
.param			Lmin=32n
+Vdd=1.1V

****** Sources ******
Vdd	    1	0  	1.1
Vin1	3	0	DC 1
Vin2	2	0	DC 1

*****************INVERTER****************************
.SUBCKT MYinverter in GND  NODE OUT
Mp5	OUT	        IN		NODE    NODE    pmos 	    l='Lmin'  w='4*Lmin'	
Mn6 OUT         IN      GND     GND     nmos        l='Lmin'  w='2*Lmin'
.ENDS MYinverter
*****************NOR GATE****************
Mp1			  5	   2	   1	 1	  pmos		 l='Lmin'	  w='8*Lmin'	
Mp2           4    3       5     5    pmos       l='Lmin'     w='8*Lmin'

Mn3			  4	   3	   0	0     nmos		 l='Lmin'	  w='2*Lmin'	
Mn4           4    2       0    0     nmos       l='Lmin'     w='2*Lmin'

X 4 0 1  6 MYinverter
*************Type of Analysis******** 
.tran	1s	20s  
.op
.end
