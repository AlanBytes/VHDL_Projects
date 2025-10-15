---Title: digitseparator 
-- Name: Alan Bernal 
-- Semester: Fall 2025 
-- Section 0002 
-- 10/14/2025 
-----------------------------------------
Library ieee;
USE ieee.STD_LOGIC_1164.all;
USE ieee.STD_LOGIC_ARITH.all;
-----------------------------------------
ENTITY digitseparator IS
	PORT( abc : IN INTEGER;
			a, b, c : OUT INTEGER
	);
END ENTITY digitseparator;
-----------------------------------------
ARCHITECTURE behaviour of digitseparator is
begin
		a <= abc / 100;
		b <= (abc / 10 ) MOD 10;
		c <= abc MOD 10;
END ARCHITECTURE behaviour;