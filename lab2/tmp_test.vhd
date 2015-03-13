--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:23:29 03/12/2015
-- Design Name:   
-- Module Name:   /home/rob/Documents/architecture/lab2/tmp_test.vhd
-- Project Name:  lab2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY tmp_test IS
END tmp_test;
 
ARCHITECTURE behavior OF tmp_test IS 
 
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
         Co : OUT  std_logic;
         overflow : OUT  std_logic
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
   signal overflow : std_logic;
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
          Co => Co,
          overflow => overflow
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		 A <= x"0000";
		 B <= x"0000";
		 S0 <= '0';
		 S1 <= '0';
		 S2 <= '0';
		 C <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
