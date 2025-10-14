-------------------------------------
-- Title       :adder_timing
-- Author      :Alan Bernal
-- Date        :9/26/2025
-- Description : 8 bit adder
-------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
-------------------------------------
ENTITY adder_timing IS
	PORT (clk	  : IN STD_LOGIC;
			a, b, c : IN INTEGER RANGE 0 TO 255;
			sum	  : OUT INTEGER RANGE 0 TO 1023);
END ENTITY adder_timing;
-------------------------------------
ARCHITECTURE fpga OF adder_timing IS
	--Registers:
	SIGNAL reg_a, reg_b, reg_c : INTEGER RANGE 0 TO 255;
	SIGNAL reg_sum					: INTEGER RANGE 0 TO 1023;
	ATTRIBUTE keep					: BOOLEAN;
	ATTRIBUTE keep OF reg_a, reg_b, reg_c, reg_sum: SIGNAL IS true;
	
BEGIN
	PROCESS(clk)
	BEGIN
		IF rising_edge(clk) THEN
			reg_a <= a;
			reg_b <= b;
			reg_c <= c;
			reg_sum <= reg_a + reg_b + reg_c;
		END IF;
	END PROCESS;
   
	sum <= reg_sum;
	
END ARCHITECTURE fpga;