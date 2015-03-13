LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY TEST_register_file IS
END TEST_register_file;
 
ARCHITECTURE behavior OF TEST_register_file IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file
    PORT(
         A_source_select : IN  std_logic_vector(2 downto 0);
         B_source_select : IN  std_logic_vector(2 downto 0);
         dest_select : IN  std_logic_vector(2 downto 0);
         Clk : IN  std_logic;
         read_write : IN  std_logic;
         data_in : IN  std_logic_vector(15 downto 0);
         reg0 : OUT  std_logic_vector(15 downto 0);
         reg1 : OUT  std_logic_vector(15 downto 0);
         reg2 : OUT  std_logic_vector(15 downto 0);
         reg3 : OUT  std_logic_vector(15 downto 0);
         reg4 : OUT  std_logic_vector(15 downto 0);
         reg5 : OUT  std_logic_vector(15 downto 0);
         reg6 : OUT  std_logic_vector(15 downto 0);
         reg7 : OUT  std_logic_vector(15 downto 0);
         A_output_data : OUT  std_logic_vector(15 downto 0);
         B_output_data : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A_source_select : std_logic_vector(2 downto 0) := (others => '0');
   signal B_source_select : std_logic_vector(2 downto 0) := (others => '0');
   signal dest_select : std_logic_vector(2 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
   signal read_write : std_logic := '0';
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal reg0 : std_logic_vector(15 downto 0);
   signal reg1 : std_logic_vector(15 downto 0);
   signal reg2 : std_logic_vector(15 downto 0);
   signal reg3 : std_logic_vector(15 downto 0);
   signal reg4 : std_logic_vector(15 downto 0);
   signal reg5 : std_logic_vector(15 downto 0);
   signal reg6 : std_logic_vector(15 downto 0);
   signal reg7 : std_logic_vector(15 downto 0);
   signal A_output_data : std_logic_vector(15 downto 0);
   signal B_output_data : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file PORT MAP (
          A_source_select => A_source_select,
          B_source_select => B_source_select,
          dest_select => dest_select,
          Clk => Clk,
          read_write => read_write,
          data_in => data_in,
          reg0 => reg0,
          reg1 => reg1,
          reg2 => reg2,
          reg3 => reg3,
          reg4 => reg4,
          reg5 => reg5,
          reg6 => reg6,
          reg7 => reg7,
          A_output_data => A_output_data,
          B_output_data => B_output_data
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		A_source_select <= "000";
		B_source_select <= "000";
		read_write <= '1';
		data_in <= x"FFFF";
		wait for Clk_period;
		
		-- test writing from data_in
		for i in 0 to 7 loop
			dest_select <= conv_std_logic_vector(i, 3);
			wait for Clk_period;
		end loop;
		
		data_in <= x"0000";
		wait for Clk_period;
		
		-- transfer from register to register
		for i in 1 to 7 loop
			A_source_select <= conv_std_logic_vector(7-(i-1), 3);
			dest_select <= conv_std_logic_vector(7-i, 3);
			wait for Clk_period;
		end loop;
		
      wait;
   end process;

END;
