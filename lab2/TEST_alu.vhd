LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TEST_alu IS
END TEST_alu;
 
ARCHITECTURE behavior OF TEST_alu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         S0 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         C : IN  std_logic;
         Z : OUT  std_logic_vector(15 downto 0);
         Co : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S0 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal C : std_logic := '0';

 	--Outputs
   signal Z : std_logic_vector(15 downto 0);
   signal Co : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          S0 => S0,
          S1 => S1,
          S2 => S2,
          C => C,
          Z => Z,
          Co => Co
        );

   -- Stimulus process
   stim_proc: process
   begin		

		-- G <= A
		A <= x"FFFF";
		B <= x"0001";
		S0 <= '0';
		S1 <= '0';
		S2 <= '0';
		C <= '0';
		wait for 80 ns;
		-- G <= A + 1
		S0 <= '0';
		S1 <= '0';
		S2 <= '0';
		C <= '1';
		wait for 80 ns;
		-- G <= A + B
		S0 <= '1';
		S1 <= '0';
		S2 <= '0';
		C <= '0';
		wait for 80 ns;
		-- G <= A + B + 1
		S0 <= '1';
		S1 <= '0';
		S2 <= '0';
		C <= '1';
		wait for 80 ns;
		-- G <= A + !B
		S0 <= '0';
		S1 <= '1';
		S2 <= '0';
		C <= '0';
		wait for 80 ns;
		-- G <= A + !B + 1
		S0 <= '0';
		S1 <= '1';
		S2 <= '0';
		C <= '1';
		wait for 80 ns;
		-- G <= A - 1
		S0 <= '1';
		S1 <= '1';
		S2 <= '0';
		C <= '0';
		wait for 80 ns;
		-- G <= A
		S0 <= '1';
		S1 <= '1';
		S2 <= '0';
		C <= '1';
		wait for 80 ns;
		-- G <= A and B
		S0 <= '0';
		S1 <= '0';
		S2 <= '1';
		wait for 80 ns;
		-- G <= A or B
		S0 <= '1';
		S1 <= '0';
		S2 <= '1';
		wait for 80 ns;
		-- G <= A xor B
		S0 <= '0';
		S1 <= '1';
		S2 <= '1';
		wait for 80 ns;
		-- G <= !A
		S0 <= '1';
		S1 <= '1';
		S2 <= '1';
		wait for 80 ns;
		
      wait;
   end process;

END;
