LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TEST_ripple_adder IS
END TEST_ripple_adder;
 
ARCHITECTURE behavior OF TEST_ripple_adder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple_adder
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         A : IN  std_logic_vector(15 downto 0);
         C0 : IN  std_logic;
         S : OUT  std_logic_vector(15 downto 0);
         C16 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal C0 : std_logic := '0';

 	--Outputs
   signal S : std_logic_vector(15 downto 0);
   signal C16 : std_logic;
   -- No clocks detected in port list. Replace Clk below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ripple_adder PORT MAP (
          B => B,
          A => A,
          C0 => C0,
          S => S,
          C16 => C16
        );


   -- Stimulus process
   stim_proc: process
   begin		
      
      -- tests with no carry in
		
		C0 <= '0';
		A <= x"0000";
		B <= x"1111";
		
		wait for 85 ns;
      
		A <= x"1111";
		B <= x"FFFF";
		
		wait for 85 ns;
		
		A <= x"FFFE";
		B <= x"0001";
		
		wait for 85 ns;
		
		-- tests with a carry in
		
		C0 <= '1';
		A <= x"0000";
		B <= x"1111";
		
		wait for 85 ns;
      
		A <= x"1111";
		B <= x"FFFF";
		
		wait for 85 ns;
		
		A <= x"FFFE";
		B <= x"0001";
		
		wait for 85 ns;

		wait;
   end process;

END;
