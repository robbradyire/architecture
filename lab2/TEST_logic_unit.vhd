LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TEST_logic_unit IS
END TEST_logic_unit;
 
ARCHITECTURE behavior OF TEST_logic_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT logic_unit
    PORT(
         A_input : IN  std_logic_vector(15 downto 0);
         B_input : IN  std_logic_vector(15 downto 0);
         sel0 : IN  std_logic;
         sel1 : IN  std_logic;
         output : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A_input : std_logic_vector(15 downto 0) := (others => '0');
   signal B_input : std_logic_vector(15 downto 0) := (others => '0');
   signal sel0 : std_logic := '0';
   signal sel1 : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: logic_unit PORT MAP (
          A_input => A_input,
          B_input => B_input,
          sel0 => sel0,
          sel1 => sel1,
          output => output
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	

		-- test S = "00"
		A_input<= x"1111";
		B_input<= x"FFFF";
		sel0 <= '0';
		sel1 <= '0';	
		wait for 100 ns;
		
		-- test S = "01"
		A_input<= x"1111";
		B_input<= x"EEEE";
		sel0 <= '1';
		sel1 <= '0';	
		wait for 100 ns;
		
		-- test S = "10"
		A_input<= x"1111";
		B_input<= x"FFFF";
		sel0 <= '0';
		sel1 <= '1';	
		wait for 100 ns;
		
		-- test S = "11"
		A_input<= x"1111";
		sel0 <= '1';
		sel1 <= '1';	
		wait for 100 ns;

      wait;
   end process;

END;
