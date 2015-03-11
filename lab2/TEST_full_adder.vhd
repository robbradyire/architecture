library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY TEST_full_adder IS
END TEST_full_adder;
 
ARCHITECTURE behavior OF TEST_full_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         in_carry : IN  std_logic;
         x : IN  std_logic;
         y : IN  std_logic;
         sum : OUT  std_logic;
         out_carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in_carry : std_logic := '0';
   signal x : std_logic := '0';
   signal y : std_logic := '0';

 	--Outputs
   signal sum : std_logic;
   signal out_carry : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          in_carry => in_carry,
          x => x,
          y => y,
          sum => sum,
          out_carry => out_carry
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
   
	-- tests with in_carry of 0
   
   x <= '0';
	y <= '0';
	in_carry <= '0';
	
	wait for 100 ns;
	
	x <= '0';
	y <= '1';
	
	wait for 100 ns;
	
	x <= '1';
	y <= '1';
	
	wait for 100 ns;
	
	-- tests with in_carry of 0
	
	x <= '0';
	y <= '0';
	in_carry <= '1';

	wait for 100 ns;
	
	x <= '1';
	y <= '0';
	
	wait for 100 ns;
	
	x <= '1';
	y <= '1';
	
	wait for 100 ns;

      wait;
   end process;

END;
