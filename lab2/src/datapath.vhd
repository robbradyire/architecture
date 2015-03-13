library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity datapath is
port (
	control, constant_in, data_in : in std_logic_vector(15 downto 0);
	Clk : in std_logic;
	a_out, b_out, d_out : out std_logic_vector(15 downto 0);
	r0,r1,r2,r3,r4,r5,r6,r7 : out std_logic_vector(15 downto 0);
	V, N, Z, C : out std_logic
	);
end datapath;

architecture Behavioral of datapath is

	COMPONENT register_file
	PORT(
		A_source_select : IN std_logic_vector(2 downto 0);
		B_source_select : IN std_logic_vector(2 downto 0);
		dest_select : IN std_logic_vector(2 downto 0);
		Clk : IN std_logic;
		read_write : IN std_logic;
		data_in : IN std_logic_vector(15 downto 0);          
		reg0 : OUT std_logic_vector(15 downto 0);
		reg1 : OUT std_logic_vector(15 downto 0);
		reg2 : OUT std_logic_vector(15 downto 0);
		reg3 : OUT std_logic_vector(15 downto 0);
		reg4 : OUT std_logic_vector(15 downto 0);
		reg5 : OUT std_logic_vector(15 downto 0);
		reg6 : OUT std_logic_vector(15 downto 0);
		reg7 : OUT std_logic_vector(15 downto 0);
		A_output_data : OUT std_logic_vector(15 downto 0);
		B_output_data : OUT std_logic_vector(15 downto 0)
		);
	END COMPONENT;
	
	COMPONENT function_unit
	PORT(
		data_A : IN std_logic_vector(15 downto 0);
		data_B : IN std_logic_vector(15 downto 0);
		function_sel : IN std_logic_vector(6 downto 2);          
		data_out : OUT std_logic_vector(15 downto 0);
		V : OUT std_logic;
		carry_out : OUT std_logic;
		negative : OUT std_logic;
		zero : OUT std_logic
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
	
	signal bus_a, bus_b, func_mux, bus_d,
			bus_b_mux : std_logic_vector(15 downto 0);
	
begin
	
	Inst_register_file: register_file PORT MAP(
		A_source_select => control(13 downto 11),
		B_source_select => control(10 downto 8),
		dest_select => control(16 downto 14),
		Clk => Clk,
		read_write => control(0),
		data_in => bus_d,
		reg0 => r0,
		reg1 => r1,
		reg2 => r2,
		reg3 => r3,
		reg4 => r4,
		reg5 => r5,
		reg6 => r6,
		reg7 => r7,
		A_output_data => bus_a,
		B_output_data => bus_b_mux
	);
	
	Inst_function_unit: function_unit PORT MAP(
		data_A => bus_a,
		data_B => bus_b,
		function_sel => control(6 downto 2),
		data_out => func_mux,
		V => V,
		carry_out => C,
		negative => N,
		zero => Z
	);
	
	function_mux : mux2_16bit PORT MAP(
		In0 => func_mux,
		In1 => data_in,
		s => control(1),
		Z => bus_d
	);
	
	data_mux : mux2_16bit PORT MAP(
		In0 => bus_b_mux,
		In1 => constant_in,
		s => control(7),
		Z => bus_b
	);
	
	a_out <= bus_a;
	b_out <= bus_b_mux;
	d_out <= func_mux;
	
end Behavioral;













