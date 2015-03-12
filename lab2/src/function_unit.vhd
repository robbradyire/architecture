library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity function_unit is
port (
	data_A, data_B : in std_logic_vector(15 downto 0);
	function_sel : in std_logic_vector(6 downto 2);
	data_out : out std_logic_vector(15 downto 0);
	V, carry_out, negative, zero : out std_logic
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
	
	COMPONENT shifter
	PORT(
		Ci : IN std_logic;
		S0 : IN std_logic;
		S1 : IN std_logic;
		i : IN std_logic_vector(15 downto 0);          
		Co : OUT std_logic;
		o : OUT std_logic_vector(15 downto 0)
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
	
	signal alu_carry, shifter_carry : std_logic;
	signal alu_out, shifter_out : std_logic_vector(15 downto 0);
	
begin
	
	Inst_ALU: ALU PORT MAP(
		A => data_A,
		B => data_B,
		S0 => function_sel(3),
		S1 => function_sel(4),
		S2 => function_sel(5),
		C => function_sel(2),
		Z => alu_out,
		Co => alu_carry,
		overflow => V
	);
	
	Inst_shifter: shifter PORT MAP(
		Ci => function_sel(2),
		S0 => function_sel(3),
		S1 => function_sel(4),
		i => data_B,
		Co => shifter_carry,
		o => shifter_out
	);
	
	Inst_mux2_16bit: mux2_16bit PORT MAP(
		In0 => alu_out,
		In1 => shifter_out,
		s => function_sel(6),
		Z => data_out
	);
	
	carry_out <= alu_carry after 1 ns when function_sel(5)='0' else
						shifter_carry after 1 ns;
	zero <= data_out = x"0000" after 1 ns;
	negative <= data_out(15) = '1' after 1 ns;
	
end Behavioral;