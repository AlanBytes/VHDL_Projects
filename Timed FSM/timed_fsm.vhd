--Timed FSM
--Alan Bernal
--12/1/2025
--A certain machine has two states, called A and B. If in A and x = '1' occurs, and x = '1' lasts T1 clock cycles, 
--then the machine must move to B (x triggers the transition and must remain high during the whole time interval). 
--When in B, it must return to A unconditionally after T2 clock cycles. Recall that, as in any other design, 
--it might be necessary to add to the original states (A, B) other states (wait states, for example) in order to fulfill the specifications.
-------------------------------------------- 
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
-------------------------------------------- 
ENTITY timedfsm IS 
	GENERIC (
		T1: INTEGER := 3;
		T2: INTEGER := 4
	);
 PORT ( 
  clk, rst, x : IN STD_LOGIC;
  y : OUT STD_LOGIC 
 ); 
END timedfsm; 
-------------------------------------------- 
ARCHITECTURE bhv OF timedfsm IS 
 TYPE state IS (A, W1, B, W2); 
 SIGNAL pr_state, nx_state : state; 
 ATTRIBUTE ENUM_ENCODING : STRING; --optional attribute
 ATTRIBUTE ENUM_ENCODING OF state : TYPE IS "sequential"; 
 SIGNAL timer: INTEGER RANGE 0 To T2; 
 SIGNAL count: INTEGER RANGE 0 To T2;
BEGIN 
 ------Lower section of FSM:----------- 
 PROCESS (clk, rst) 
 BEGIN 
  IF (rst = '1') THEN 
   pr_state <= A; 
	count <= 0;
  ELSIF (clk'EVENT AND clk = '1') THEN 
    pr_state <= nx_state;
    
    IF (nx_state = W1 AND pr_state /= W1) THEN
      count <= 0;  
    ELSIF (nx_state = W2 AND pr_state /= W2) THEN
      count <= 0; 
    ELSIF (nx_state = W1 OR nx_state = W2) THEN
      count <= count + 1; 
    ELSE
      count <= 0;
    END IF; 
  END IF; 
 END PROCESS; 
------Upper section of FSM (Combinational Logic):----------- 
PROCESS (pr_state, x, count) 
BEGIN 
  CASE pr_state IS 
    WHEN A =>
      y <= '0';
      timer <= 0;  -- No timer needed in state A
      IF (x = '1') THEN
        nx_state <= W1;
      ELSE
        nx_state <= A;
      END IF;
    
    WHEN W1 =>
      y <= '0';
      timer <= T1;  -- Timer value for this wait state
      IF (x = '1') THEN
		  IF (count = (T1 - 1)) THEN
				nx_state <= B;
		  END IF;
      ELSIF (x = '0') THEN
        nx_state <= A;  -- Abort if x goes low
      ELSE
        nx_state <= W1;  -- Stay in W1, keep counting
      END IF;
    
    WHEN B =>
      y <= '1';  -- Output is high in state B
      timer <= T2;  -- Prepare timer for next wait state
      nx_state <= W2;  -- Unconditional transition
    
    WHEN W2 =>
      y <= '1';  -- Output stays high
      timer <= T2;  -- Timer value for this wait state
      IF (count = (T2 - 1)) THEN
        nx_state <= A;
      ELSE 
        nx_state <= W2;  -- Stay in W2, keep counting
      END IF;
   END CASE; 
  END PROCESS; 
END bhv; 