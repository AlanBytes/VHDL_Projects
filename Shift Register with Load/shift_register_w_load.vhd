-------------------------------------
-- Title       : Shift Register with load
-- Author      : Alan Bernal
-- Date        : 10/29/2025
-------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
------------------------------------------------------------
ENTITY shift_register IS
PORT (clk: 	IN STD_LOGIC;
		load: IN STD_LOGIC;
		d: 	IN STD_LOGIC;
		din: 	IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		dout: OUT STD_LOGIC
		);
END ENTITY;
------------------------------------------------------------
ARCHITECTURE mux OF shift_register IS
Signal q: STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
	PROCESS(clk)
	Begin
		IF rising_edge(clk) THEN
			IF load = '1' then
				q <= din;
			else 
				q <= d & q(3 downto 1);
			end if;
		end IF;
	END PROCESS;
	dout <= q(0);
END ARCHITECTURE mux;
------------------------------------------------------------