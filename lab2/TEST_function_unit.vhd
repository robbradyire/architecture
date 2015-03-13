LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TEST_function_unit IS
END TEST_function_unit;
 
ARCHITECTURE behavior OF TEST_function_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT function_unit
    PORT(
         data_A : IN  std_logic_vector(15 downto 0);
         data_B : IN  std_logic_vector(15 downto 0);
         function_sel : IN  std_logic_vector(6 downto 2);
         data_out : OUT  std_logic_vector(15 downto 0);
         V : OUT  std_logic;
         carry_out : OUT  std_logic;
         negative : OUT  std_logic;
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data_A : std_logic_vector(15 downto 0) := (others => '0');
   signal data_B : std_logic_vector(15 downto 0) := (others => '0');
   signal function_sel : std_logic_vector(6 downto 2) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(15 downto 0);
   signal V : std_logic;
   signal carry_out : std_logic;
   signal negative : std_logic;
   signal zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: function_unit PORT MAP (
          data_A => data_A,
          data_B => data_B,
          function_sel => function_sel,
          data_out => data_out,
          V => V,
          carry_out => carry_out,
          negative => negative,
          zero => zero
        );
 

   -- Stimulus process
   stim_proc: process
   begin		

      data_A <= x"1111";
		data_B <= x"FFFF";
		function_sel <= "00000";
		wait for 100 ns;
		
		function_sel <= "00001";
		wait for 100 ns;
		
		function_sel <= "00010";
		wait for 100 ns;
		
		function_sel <= "00011";
		wait for 100 ns;
		
		function_sel <= "00100";
		wait for 100 ns;
		
		function_sel <= "00101";
		wait for 100 ns;
		
		function_sel <= "00110";
		wait for 100 ns;
		
		function_sel <= "00111";
		wait for 100 ns;
		
		function_sel <= "01000";
		wait for 100 ns;
		
		function_sel <= "01010";
		wait for 100 ns;
		
		function_sel <= "01100";
		wait for 100 ns;
		
		function_sel <= "01110";
		wait for 100 ns;
		
		function_sel <= "10000";
		wait for 100 ns;
		
		function_sel <= "10100";
		wait for 100 ns;
		
		function_sel <= "11000";
		wait for 100 ns;
		
      wait;
   end process;

END;
