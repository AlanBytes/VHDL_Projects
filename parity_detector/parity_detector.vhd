-- Parity Detector
-- Alan Bernal
-- 10/21/2025
---------------------------
Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
-----------------------------
ENTITY parityDetector IS
	PORT(
		x		: in std_logic_vector(3 DOWNTO 0);
		and_x : out std_logic;
		nand_x: out std_logic
	);
END ENTITY;
------------------------------
ARCHITECTURE behaviour of parityDetector is
	constant n : integer := x'length;
	SIGNAL t: std_logic_vector(n-1 DOWNTO 0);
	SIGNAL p: std_logic_vector(n-1 DOWNTO 0);
BEGIN
	t(0) <= x(0);
	p(0) <= x(0);

	gen: FOR i IN 1 to n-1 generate
		t(i) <= t(i-1) AND X(i);
		p(i) <= not t(i);
	END GENERATE;
	
	and_x <= t(n-1);
	nand_x <= p(n-1);

END ARCHITECTURE behaviour;