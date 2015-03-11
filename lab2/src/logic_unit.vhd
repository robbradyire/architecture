library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity logic_unit is
port (
		A_input, B_input : in std_logic_vector(15 downto 0);
		sel0, sel1 : in std_logic;
		output : out std_logic_vector(15 downto 0)
	);
end logic_unit;

architecture Behavioral of logic_unit is

COMPONENT mux4_16
	PORT(
		In0 : IN std_logic_vector(15 downto 0);
		In1 : IN std_logic_vector(15 downto 0);
		In2 : IN std_logic_vector(15 downto 0);
		In3 : IN std_logic_vector(15 downto 0);
		S0 : IN std_logic;
		S1 : IN std_logic;          
		Z : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	signal and_out,
			or_out, xor_out, not_out : std_logic_vector(15 downto 0);
	
begin
	--port map
	
	mux : mux4_16 PORT MAP(
		In0 => and_out,
		In1 => or_out,
		In2 => xor_out,
		In3 => not_out,
		S0 => sel0,
		S1 => sel1,
		Z => output
	);
	
	and_out <= A_input and B_input;
	or_out <= A_input or B_input;
	xor_out <= A_input xor B_input;
	not_out <= not A_input;	
	
end Behavioral;