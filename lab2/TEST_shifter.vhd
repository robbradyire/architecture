LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TEST_shifter IS
END TEST_shifter;
 
ARCHITECTURE behavior OF TEST_shifter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shifter
    PORT(
         Ci : IN  std_logic;
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         i : IN  std_logic_vector(15 downto 0);
         Co : out  std_logic;
         o : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Ci : std_logic := '0';
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal i : std_logic_vector(15 downto 0) := (others => '0');
   signal Co : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shifter PORT MAP (
          Ci => Ci,
          S0 => S0,
          S1 => S1,
          i => i,
          Co => Co,
          o => o
        );
 

   -- Stimulus process
   stim_proc: process
   begin
		
		Ci <= '0';
		S0 <= '0';
		S1 <= '1';
		i <= x"1111";
		wait for 100 ns;
		
		Ci <= '0';
		S0 <= '1';
		S1 <= '0';
		i <= x"1111";
		wait for 100 ns;
		
		Ci <= '1';
		S0 <= '0';
		S1 <= '1';
		i <= x"1111";
		wait for 100 ns;
		
		Ci <= '1';
		S0 <= '1';
		S1 <= '0';
		i <= x"1111";
		wait for 100 ns;
		
      wait;
   end process;

END;
