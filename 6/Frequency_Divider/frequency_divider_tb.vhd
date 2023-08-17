--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:18:19 09/08/2020
-- Design Name:   
-- Module Name:   C:/Users/Sepehr/Desktop/A/frequency_divider_v2/frequency_divider_tb.vhd
-- Project Name:  frequency_divider_v2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: frequency_divider
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 

entity frequency_divider_tb is
end frequency_divider_tb;

architecture behavior OF frequency_divider_tb is 
	component frequency_divider
	port(
		clk_in : IN  std_logic;
		reset  : IN  std_logic;
		clk_out: OUT std_logic
	);
	end component;

	-- Inputs
	signal clk_in  : std_logic := '0';
	signal reset   : std_logic := '0';
	
	-- Outputs
	signal clk_out : std_logic;
	constant clk_in_t : time := 25 ns; 
	
begin 
	-- Instance of unit under test.
	uut: frequency_divider port map (
		clk_in  => clk_in,
		reset   => reset,
		clk_out => clk_out
	);

	-- Clock definition.
	entrada_process :process
		begin
		clk_in <= '0';
		wait for clk_in_t / 2;
		clk_in <= '1';
		wait for clk_in_t / 2;
	end process;

	-- Processing.
	stimuli: process
	begin
		reset <= '1'; -- Initial conditions.
		wait for 100 ns;
		reset <= '0'; -- Down to work!
        wait;
	end process;
end;