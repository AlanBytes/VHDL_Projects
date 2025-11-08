--FSM BENCHMARK
--Alan Bernal
--11/7/2025
--------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------
ENTITY fsm_bench IS
	PORT (clk, rst: IN STD_LOGIC;
			input: IN std_logic_vector(7 downto 0);
			output: OUT std_logic_vector(7 downto 0));
END fsm_bench;
--------------------------------------------
ARCHITECTURE bhv OF fsm_bench IS
	TYPE state IS (START, SA, SB, SE);
	SIGNAL pr_state, nx_state: state;
	ATTRIBUTE ENUM_ENCODING: STRING; --optional
	ATTRIBUTE ENUM_ENCODING OF state: TYPE IS "sequential";
BEGIN
------Lower section of FSM:-----------
PROCESS (clk, rst)
BEGIN
	IF (rst='1') THEN
		pr_state <= START;
	ELSIF (clk'EVENT AND clk='1') THEN
		pr_state <= nx_state;
	END IF;
END PROCESS;
------Upper section of FSM:-----------
PROCESS (pr_state, input)
BEGIN
	CASE pr_state IS
		WHEN START =>
			output <= x"00";
			IF (input= x"3C") THEN
			nx_state <= SA;
			output <= x"82";
			ELSE
				nx_state <= START;
			END IF;
			
		WHEN SA =>
			output <= x"04";
			IF (input= x"1F") THEN
			nx_state <= SB;
			output <= x"20";
			ELSE
				nx_state <= SA;
			END IF;
			
		WHEN SB =>
			output <= x"00";
			IF (input=x"AA") THEN
			nx_state <= SE;
			output <= x"11";
			ELSE
			nx_state <= SB;
			END IF;
		WHEN SE =>
			nx_state <= START;
			output <= x"40";
		END CASE;
END PROCESS;
END bhv;
