library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity function_unit is
port (
	data_A, data_B : in std_logic_vector(15 downto 0);
	operation_sel : in std_logic_vector(4 downto 0);
	data_out : out std_logic_vector(15 downto 0);
	overflow, carry_out, negative, zero : out std_logic
	);
end function_unit;

architecture Behavioral of function_unit is
begin
	data_out <= data_A after 20 ns;
	carry_out <= '1' after 20 ns;
	overflow <= '0' after 20 ns;
	negative <= '0' after 20 ns;
	zero <= '0' after 20 ns;
end Behavioral;