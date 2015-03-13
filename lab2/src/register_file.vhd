library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file is
Port (
		A_source_select : in std_logic_vector(2 downto 0);
		B_source_select : in std_logic_vector(2 downto 0);
		dest_select : in std_logic_vector(2 downto 0);
		Clk : in std_logic;
		read_write : in std_logic;
		data_in : in std_logic_vector(15 downto 0);
		reg0 : out std_logic_vector(15 downto 0);
		reg1 : out std_logic_vector(15 downto 0);
		reg2 : out std_logic_vector(15 downto 0);
		reg3 : out std_logic_vector(15 downto 0);
		reg4 : out std_logic_vector(15 downto 0);
		reg5 : out std_logic_vector(15 downto 0);
		reg6 : out std_logic_vector(15 downto 0);
		reg7 : out std_logic_vector(15 downto 0);
		A_output_data : out std_logic_vector(15 downto 0);
		B_output_data : out std_logic_vector(15 downto 0)
	);
end register_file;

architecture Behavioral of register_file is
-- components
	-- 16 bit Register for register file
	COMPONENT reg16
	PORT(
			D : IN std_logic_vector(15 downto 0);
			load_A : IN std_logic;
			load_B : IN std_logic;
			Clk : IN std_logic;
			Q : OUT std_logic_vector(15 downto 0)
			);
	END COMPONENT;
	
	-- 3 to 8 Decoder for destination
	COMPONENT decoder_3to8
	PORT(
			S0 : IN std_logic;
			S1 : IN std_logic;
			S2 : IN std_logic;
			Q0 : OUT std_logic;
			Q1 : OUT std_logic;
			Q2 : OUT std_logic;
			Q3 : OUT std_logic;
			Q4 : OUT std_logic;
			Q5 : OUT std_logic;
			Q6 : OUT std_logic;
			Q7 : OUT std_logic
			);
	END COMPONENT;
	
	-- 8 to 1 line multiplexer for sources
	COMPONENT mux8_16bit
	PORT(
			In0 : IN std_logic_vector(15 downto 0);
			In1 : IN std_logic_vector(15 downto 0);
			In2 : IN std_logic_vector(15 downto 0);
			In3 : IN std_logic_vector(15 downto 0);
			In4 : IN std_logic_vector(15 downto 0);
			In5 : IN std_logic_vector(15 downto 0);
			In6 : IN std_logic_vector(15 downto 0);
			In7 : IN std_logic_vector(15 downto 0);
			S0 : IN std_logic;
			S1 : IN std_logic;
			S2 : IN std_logic;
			Z : OUT std_logic_vector(15 downto 0)
			);
	END COMPONENT;
	
	-- signals
	signal load_reg0, load_reg1, load_reg2, load_reg3,
			load_reg4, load_reg5, load_reg6, load_reg7 : std_logic;

	signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q,reg5_q,reg6_q,reg7_q,
			A_out, B_out : std_logic_vector(15 downto 0);
	begin
	-- port maps ;-)

	-- register 0
	reg00: reg16 PORT MAP(
		D => data_in,
		load_A => load_reg0,
		load_B => read_write,
		Clk => Clk,
		Q => reg0_q
	);
	-- register 1
	reg01: reg16 PORT MAP(
		D => data_in,
		load_A => load_reg1,
		load_B => read_write,
		Clk => Clk,
		Q => reg1_q
	);
	-- register 2
	reg02: reg16 PORT MAP(
		D => data_in,
		load_A => load_reg2,
		load_B => read_write,
		Clk => Clk,
		Q => reg2_q
	);
	-- register 3
	reg03: reg16 PORT MAP(
		D => data_in,
		load_A => load_reg3,
		load_B => read_write,
		Clk => Clk,
		Q => reg3_q
	);
	-- register 4
	reg04: reg16 PORT MAP(
		D => data_in,
		load_A => load_reg4,
		load_B => read_write,
		Clk => Clk,
		Q => reg4_q
	);
	-- register 5
	reg05: reg16 PORT MAP(
		D => data_in,
		load_A => load_reg5,
		load_B => read_write,
		Clk => Clk,
		Q => reg5_q
	);
	-- register 6
	reg06: reg16 PORT MAP(
		D => data_in,
		load_A => load_reg6,
		load_B => read_write,
		Clk => Clk,
		Q => reg6_q
	);
	-- register 7
	reg07: reg16 PORT MAP(
		D => data_in,
		load_A => load_reg7,
		load_B => read_write,
		Clk => Clk,
		Q => reg7_q
	);

	-- Destination register decoder
	des_decoder_3to8: decoder_3to8 PORT MAP(
		S0 => dest_select(0),
		S1 => dest_select(1),
		S2 => dest_select(2),
		Q0 => load_reg0,
		Q1 => load_reg1,
		Q2 => load_reg2,
		Q3 => load_reg3,
		Q4 => load_reg4,
		Q5 => load_reg5,
		Q6 => load_reg6,
		Q7 => load_reg7
	);

	-- 8 to 1 source register multiplexer for A
	A_mux8_16bit: mux8_16bit PORT MAP(
		In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
		S0 => A_source_select(0),
		S1 => A_source_select(1),
		S2 => A_source_select(2),
		Z => A_out
	);

	-- 8 to 1 source register multiplexer for B
	B_mux8_16bit: mux8_16bit PORT MAP(
		In0 => reg0_q,
		In1 => reg1_q,
		In2 => reg2_q,
		In3 => reg3_q,
		In4 => reg4_q,
		In5 => reg5_q,
		In6 => reg6_q,
		In7 => reg7_q,
		S0 => B_source_select(0),
		S1 => B_source_select(1),
		S2 => B_source_select(2),
		Z => B_out
	);

	reg0 <= reg0_q after 1 ns;
	reg1 <= reg1_q after 1 ns;
	reg2 <= reg2_q after 1 ns;
	reg3 <= reg3_q after 1 ns;
	reg4 <= reg4_q after 1 ns;
	reg5 <= reg5_q after 1 ns;
	reg6 <= reg6_q after 1 ns;
	reg7 <= reg7_q after 1 ns;
	A_output_data <= A_out after 1 ns;
	B_output_data <= B_out after 1 ns;

end Behavioral;