-------------------------------------
-- Title       : Registrered Multiplexer
-- Author      : Alan Bernal
-- Date        : 10/29/2025
-------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
PACKAGE my_data_types IS 
	CONSTANT N : INTEGER := 8;
	TYPE oneDoneD IS ARRAY (NATURAL RANGE <>) OF STD_LOGIC_VECTOR(N-1 DOWNTO 0);
END my_data_types;
-------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.my_data_types.all;
------------------------------------------------------------
ENTITY register_mux IS
GENERIC(
	M : INTEGER := 4
);
PORT (clk: IN STD_LOGIC;
		x: IN oneDoneD(0 TO M-1);
		sel: INTEGER RANGE 0 TO M-1;
		y: OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
		);
END ENTITY;
------------------------------------------------------------
ARCHITECTURE mux OF register_mux IS
 BEGIN
	PROCESS(clk)
	Begin
			IF rising_edge(clk) THEN
			y <= x(sel);
			end IF;
	END PROCESS;
END ARCHITECTURE;
------------------------------------------------------------