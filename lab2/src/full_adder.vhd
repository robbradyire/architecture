library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder is
port (
	in_carry, x, y : in std_logic;
	sum, out_carry : out std_logic
	);
end full_adder;

architecture Behavioral of full_adder is
begin
	
	sum <= in_carry xor x xor y after 1 ns;
	out_carry <= (in_carry and (x or y)) or (x and (in_carry or y)) after 1 ns;

end Behavioral;