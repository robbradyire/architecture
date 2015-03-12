library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_3to8 is
Port (
		S0 : in std_logic;
		S1 : in std_logic;
		S2 : in std_logic;
		Q0 : out std_logic;
		Q1 : out std_logic;
		Q2 : out std_logic;
		Q3 : out std_logic;
		Q4 : out std_logic;
		Q5 : out std_logic;
		Q6 : out std_logic;
		Q7 : out std_logic
	);
end decoder_3to8;

architecture Behavioral of decoder_3to8 is
begin
	Q0<= ((not S0) and (not S1) and (not S2)) after 1 ns;
	Q1<= (S0 and (not S1) and (not S2)) after 1 ns;
	Q2<= ((not S0) and S1 and (not S2)) after 1 ns;
	Q3<= (S0 and S1 and (not S2)) after 1 ns;
	Q4<= ((not S0) and (not S1) and S2) after 1 ns;
	Q5<= (S0 and (not S1) and S2) after 1 ns;
	Q6<= ((not S0) and S1 and S2) after 1 ns;
	Q7<= (S0 and S1 and S2) after 1 ns;
end Behavioral;
