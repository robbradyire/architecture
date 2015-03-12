library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity function_unit is
port (
	data_A, data_B : in std_logic_vector(15 downto 0);
	operation_sel : in std_logic_vector(6 downto 2);
	data_out : out std_logic_vector(15 downto 0);
	overflow, carry_out, negative, zero : out std_logic
	);
end function_unit;

architecture Behavioral of function_unit is
	
	COMPONENT ALU
	PORT(
		A : IN std_logic_vector(15 downto 0);
		B : IN std_logic_vector(15 downto 0);
		S0 : IN std_logic;
		S1 : IN std_logic;
		S2 : IN std_logic;
		C : IN std_logic;          
		Z : OUT std_logic_vector(15 downto 0);
		Co : OUT std_logic;
		overflow : OUT std_logic
		);
	END COMPONENT;
	
begin
	
	Inst_ALU: ALU PORT MAP(
		A => ,
		B => ,
		S0 => ,
		S1 => ,
		S2 => ,
		C => ,
		Z => ,
		Co => ,
		overflow => 
	);
	
end Behavioral;