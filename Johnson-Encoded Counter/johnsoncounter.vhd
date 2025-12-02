--Johnson Counter
--Alan Bernal
--12/1/2025 
--0-to-8 counter with Johnson-encoded outputs.
-------------------------------------------- 
LIBRARY ieee; 
USE ieee.std_logic_1164.ALL; 
-------------------------------------------- 
ENTITY johnsoncounter IS 
 PORT ( 
  clk, rst : IN STD_LOGIC; 
  output : OUT std_logic_vector(4 DOWNTO 0) 
 ); 
END johnsoncounter; 
-------------------------------------------- 
ARCHITECTURE bhv OF johnsoncounter IS 
 TYPE state IS (S0, S1, S2, S3, S4, S5, S6, S7, S8); 
 SIGNAL pr_state, nx_state : state; 
 ATTRIBUTE ENUM_ENCODING : STRING; --optional 
 ATTRIBUTE ENUM_ENCODING OF state : TYPE IS "sequential"; 
BEGIN 
 ------Lower section of FSM:----------- 
 PROCESS (clk, rst) 
 BEGIN 
  IF (rst = '1') THEN 
   pr_state <= S0; 
  ELSIF (clk'EVENT AND clk = '1') THEN 
   pr_state <= nx_state; 
  END IF; 
 END PROCESS; 
 ------Upper section of FSM:----------- 
 PROCESS (pr_state) 
  BEGIN 
   CASE pr_state IS 
    WHEN S0 =>  
    output <= b"00000"; 
    nx_state <= S1; 
    
	  
    WHEN S1 =>  
    output <= b"10000"; 
    nx_state <= S2;  
	 
	 WHEN S2 =>  
    output <= b"11000"; 
    nx_state <= S3; 

	 
	 WHEN S3 =>  
    output <= b"11100"; 
    nx_state <= S4; 
 
	 
	 WHEN S4 =>  
    output <= b"11110"; 
    nx_state <= S5; 

	 
	 WHEN S5 =>  
    output <= b"11111"; 
    nx_state <= S6; 

	 
	 WHEN S6 =>  
    output <= b"01111"; 
    nx_state <= S7; 

	 
	 WHEN S7 =>  
    output <= b"00111"; 
    nx_state <= S8; 

     
    WHEN S8 =>  
	 output <= b"00011";
    nx_state <= S0;  
   END CASE; 
  END PROCESS; 
END bhv; 