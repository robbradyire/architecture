LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TEST_arithmetic_unit IS
END TEST_arithmetic_unit;
 
ARCHITECTURE behavior OF TEST_arithmetic_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT arithmetic_unit
    PORT(
         A_in : IN  std_logic_vector(15 downto 0);
         B_in : IN  std_logic_vector(15 downto 0);
         sel0 : IN  std_logic;
         sel1 : IN  std_logic;
         carry_in : IN  std_logic;
         carry_out : OUT  std_logic;
         result : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A_in : std_logic_vector(15 downto 0) := (others => '0');
   signal B_in : std_logic_vector(15 downto 0) := (others => '0');
   signal sel0 : std_logic := '0';
   signal sel1 : std_logic := '0';
   signal carry_in : std_logic := '0';
   signal carry_out : std_logic := '0';

 	--Outputs
   signal result : std_logic_vector(15 downto 0);
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: arithmetic_unit PORT MAP (
          A_in => A_in,
          B_in => B_in,
          sel0 => sel0,
          sel1 => sel1,
          carry_in => carry_in,
          carry_out => carry_out,
          result => result
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	
		
		-- test S = "00"
		A_in <= x"FFFF";
		B_in <= x"0000";
		sel0 <= '0';
		sel1 <= '0';
		carry_in <= '0';	
		wait for 100 ns;
	
		-- test carry_in
		carry_in <= '1';
		wait for 100 ns;
		
		-- test S = "11"
		carry_in <= '0';
		sel0 <= '1';
		sel1 <= '1';
		wait for 100 ns;
		
		-- test carry_in
		carry_in <= '1';
		wait for 100 ns;
		
		-- test S = "01"
		carry_in <= '0';
		A_in <= x"FFFE";
		B_in <= x"0002";
		sel0 <= '1';
		sel1 <= '0';
		wait for 100 ns;
		
		-- test carry_in
		carry_in <= '1';
		wait for 100 ns;
		
		-- test S = "10"
		carry_in <= '0';
		A_in <= x"FFFE";
		B_in <= x"FFFE";
		sel0 <= '0';
		sel1 <= '1';
		wait for 100 ns;
		
		-- test carry_in
		carry_in <= '1';
		wait for 100 ns;
		
      wait;
   end process;

END;
