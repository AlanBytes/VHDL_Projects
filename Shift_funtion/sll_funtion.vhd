--SLL Function
--Alan Bernal
--11/17/2025
---------Package:------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
-----------------------------------------------------------------------------
PACKAGE my_package IS
	FUNCTION shift_left (a: STD_LOGIC_VECTOR; n : INTEGER) RETURN STD_LOGIC_VECTOR;
END PACKAGE;
-----------------------------------------------------------------------------
PACKAGE BODY my_package IS
	FUNCTION shift_left (a: STD_LOGIC_VECTOR; n : INTEGER) RETURN STD_LOGIC_VECTOR IS
		VARIABLE result: STD_LOGIC_VECTOR(a'RANGE) := (OTHERS => '0');
		VARIABLE source: INTEGER;
	BEGIN
		FOR i IN a'RANGE LOOP
			source := i - n;
			
			IF (source >= a'LOW) AND (source <= a'HIGH) Then
				result(i) := a(source);
			END IF;
		END LOOP;
		RETURN result;
	END FUNCTION shift_left;
END PACKAGE BODY;
-----------------------------------------------------------------------------
---------Maincode:----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.my_package.all;
-----------------------------------------------------------------------------
ENTITY sll_funtion IS
PORT(x:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	  shift: in INTEGER;
	  y: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ENTITY;
-----------------------------------------------------------------------------
ARCHITECTURE shift_logical OF sll_funtion IS
BEGIN
	y <= shift_left(x,shift);
END ARCHITECTURE;
-----------------------------------------------------------------------------
