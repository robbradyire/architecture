--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:04:31 03/11/2015
-- Design Name:   
-- Module Name:   /home/rob/Documents/architecture/lab2/TEST_arithmetic_unit.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: arithmetic_unit
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
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
		
		

      wait;
   end process;

END;
