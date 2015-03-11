library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity arithmetic_unit is
port (
	A_in : in std_logic_vector(15 downto 0);
	B_in : in std_logic_vector(15 downto 0);
	sel0, sel1, carry_in : in std_logic;
	carry_out : in std_logic;
	result : out std_logic_vector(15 downto 0)
	);
end arithmetic_unit;

architecture Behavioral of arithmetic_unit is
	COMPONENT ripple_adder
	PORT(
		A : IN std_logic_vector(15 downto 0);
		B : IN std_logic_vector(15 downto 0);
		C0 : IN std_logic;          
		S : OUT std_logic_vector(15 downto 0);
		C16 : OUT std_logic
		);
	END COMPONENT;
	
	signal b_input : std_logic(15 downto 0);
	
begin
	-- Port Maps
	adder : ripple_adder PORT MAP (
		A => A_in,
		B => b_input,
		C0 => carry_in,
		S => result,
		C16 => carry_out
	);
	
	b_input <= x"0000" after 1 ns when sel0='0' and sel1='0' else
					B_in after 1 ns when sel0='1' and sel1='0' else
					not B_in after 1 ns when sel0='0' and sel1='1' else
					x"FFFF" after 1 ns when sel0='1' and sel1='1' else
					x"0000" after 1 ns;
	
end Behavioral;













