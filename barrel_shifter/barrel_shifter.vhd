-- Parity Detector
-- Alan Bernal
-- 10/21/2025
---------------------------
Library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.numeric_bit.all;

-----------------------------
ENTITY hw6 IS
	generic (
		n : integer := 8;
		m : integer := 3
		);
	
	PORT(
		x		: in bit_vector(n-1 DOWNTO 0);
		shift : in integer range -(N-1) to N-1;
		y		: out bit_vector(n-1 DOWNTO 0)
	);
END ENTITY hw6;
------------------------------
architecture behaviour of hw6 is
begin
process(x, shift)
begin
		if shift >= 0 then
			y <= x SLL shift;
		else
			y <= x SRL (-shift);
		end if;
end process;
end architecture behaviour;