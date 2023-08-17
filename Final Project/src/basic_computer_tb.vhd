library ieee;
use ieee.std_logic_1164.all;

entity basic_computer_tb is
end basic_computer_tb;

architecture behavior OF basic_computer_tb is 
	component basic_computer
	port(
		clk : in  std_logic
	);
	end component;

	-- Inputs
	signal clk  : std_logic := '0';
	
	-- Outputs
	
	--constants
	constant clk_t : time := 50 ns; 
	
	
begin 
	-- Instance of unit under test.
	uut: basic_computer port map (
		clk  => clk
	);

	-- Clock definition.
	entrada_process :process
		begin
		clk <= '0';
		wait for clk_t / 2;
		clk <= '1';
		wait for clk_t / 2;
	end process;

	---- Processing.
--	stimuli: process
--	begin
--		reset <= '1'; -- Initial conditions.
--		wait for 100 ns;
--		reset <= '0'; -- Down to work!
--        wait;
--	end process;
end;
