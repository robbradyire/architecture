library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
port (
		A, B : in std_logic_vector(15 downto 0);
		S0, S1, S2, C : in std_logic;
		Z : out std_logic_vector(15 downto 0);
		Co : out std_logic
	);
end ALU;

architecture Behavioral of ALU is

	COMPONENT arithmetic_unit
	PORT(
		A_in : IN std_logic_vector(15 downto 0);
		B_in : IN std_logic_vector(15 downto 0);
		sel0 : IN std_logic;
		sel1 : IN std_logic;
		carry_in : IN std_logic;          
		carry_out : OUT std_logic;
		result : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT logic_unit
	PORT(
		A_input : IN std_logic_vector(15 downto 0);
		B_input : IN std_logic_vector(15 downto 0);
		sel0 : IN std_logic;
		sel1 : IN std_logic;          
		output : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT mux2_16bit
	PORT(
		In0 : IN std_logic_vector(15 downto 0);
		In1 : IN std_logic_vector(15 downto 0);
		s : IN std_logic;          
		Z : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	signal arith_out, logic_out : std_logic_vector(15 downto 0);
	
begin

	Inst_arithmetic_unit: arithmetic_unit PORT MAP(
		A_in => A,
		B_in => B,
		sel0 => S0,
		sel1 => S1,
		carry_in => C,
		carry_out => Co,
		result => arith_out
	);
	
	Inst_logic_unit: logic_unit PORT MAP(
		A_input => A,
		B_input => B,
		sel0 => S0,
		sel1 => S1,
		output => logic_out
	);
	
	Inst_mux2_16bit: mux2_16bit PORT MAP(
		In0 => arith_out,
		In1 => logic_out,
		s => S2,
		Z => Z
	);
	
end Behavioral;