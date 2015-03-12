library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter is
port (
		Ci, S0, S1 : in std_logic;
		i : in std_logic_vector(15 downto 0);
		Co : out std_logic;
		o : out std_logic_vector(15 downto 0)
	);
end shifter;

architecture Behavioral of shifter is

	COMPONENT mux3_1
	PORT(
		In0 : IN std_logic;
		In1 : IN std_logic;
		In2 : IN std_logic;
		S0 : IN std_logic;
		S1 : IN std_logic;          
		Z : OUT std_logic
		);
	END COMPONENT;
	
	signal inn : std_logic;

begin

	mux0: mux3_1 PORT MAP(
		In0 => i(0),
		In1 => i(1),
		In2 => Ci,
		S0 => S0,
		S1 => S1,
		Z => o(0)
	);
	
	mux1: mux3_1 PORT MAP(
		In0 => i(1),
		In1 => i(2),
		In2 => i(0),
		S0 => S0,
		S1 => S1,
		Z => o(1)
	);
	
	mux2: mux3_1 PORT MAP(
		In0 => i(2),
		In1 => i(3),
		In2 => i(1),
		S0 => S0,
		S1 => S1,
		Z => o(2)
	);
	
	mux3: mux3_1 PORT MAP(
		In0 => i(3),
		In1 => i(4),
		In2 => i(2),
		S0 => S0,
		S1 => S1,
		Z => o(3)
	);
	
	mux4: mux3_1 PORT MAP(
		In0 => i(4),
		In1 => i(5),
		In2 => i(3),
		S0 => S0,
		S1 => S1,
		Z => o(4)
	);
	
	mux5: mux3_1 PORT MAP(
		In0 => i(5),
		In1 => i(6),
		In2 => i(4),
		S0 => S0,
		S1 => S1,
		Z => o(5)
	);
	
	mux6: mux3_1 PORT MAP(
		In0 => i(6),
		In1 => i(7),
		In2 => i(5),
		S0 => S0,
		S1 => S1,
		Z => o(6)
	);
	
	mux7: mux3_1 PORT MAP(
		In0 => i(7),
		In1 => i(8),
		In2 => i(6),
		S0 => S0,
		S1 => S1,
		Z => o(7)
	);
	
	mux8: mux3_1 PORT MAP(
		In0 => i(8),
		In1 => i(9),
		In2 => i(7),
		S0 => S0,
		S1 => S1,
		Z => o(8)
	);
	
	mux9: mux3_1 PORT MAP(
		In0 => i(9),
		In1 => i(10),
		In2 => i(8),
		S0 => S0,
		S1 => S1,
		Z => o(9)
	);
	
	mux10: mux3_1 PORT MAP(
		In0 => i(10),
		In1 => i(11),
		In2 => i(9),
		S0 => S0,
		S1 => S1,
		Z => o(10)
	);
	
	mux11: mux3_1 PORT MAP(
		In0 => i(11),
		In1 => i(12),
		In2 => i(10),
		S0 => S0,
		S1 => S1,
		Z => o(11)
	);
	
	mux12: mux3_1 PORT MAP(
		In0 => i(12),
		In1 => i(13),
		In2 => i(11),
		S0 => S0,
		S1 => S1,
		Z => o(12)
	);
	
	mux13: mux3_1 PORT MAP(
		In0 => i(13),
		In1 => i(14),
		In2 => i(12),
		S0 => S0,
		S1 => S1,
		Z => o(13)
	);
	
	mux14: mux3_1 PORT MAP(
		In0 => i(14),
		In1 => i(15),
		In2 => i(13),
		S0 => S0,
		S1 => S1,
		Z => o(14)
	);
	
	mux15: mux3_1 PORT MAP(
		In0 => i(15),
		In1 => Ci,
		In2 => i(14),
		S0 => S0,
		S1 => S1,
		Z => o(15)
	);
	
	Co <= i(0) after 1 ns when S0='1' and S1='0' else
			i(15) after 1 ns when S0='0' and S1='1' else
			'0' after 1 ns;

end Behavioral;