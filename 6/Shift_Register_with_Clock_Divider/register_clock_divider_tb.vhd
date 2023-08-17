--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:28:47 09/08/2020
-- Design Name:   
-- Module Name:   C:/Users/Sepehr/Desktop/A/register_clock_divider/register_clock_divider_tb.vhd
-- Project Name:  register_clock_divider
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_clock_divider
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
 

entity register_clock_divider_tb is
end register_clock_divider_tb;

architecture behaviour of register_clock_divider_tb is
    signal clk, reset, load: std_logic := '0';
    signal l_r: std_logic_vector(1 downto 0);
    signal parallel_in: std_logic_vector(3 downto 0);
    signal reg_out: std_logic_vector(3 downto 0);
    
    constant clk_period : time := 25 ns;
    
    component register_clock_divider is
      port(
      parallel_in: in std_logic_vector(3 downto 0);
      l_r : in std_logic_vector(1 downto 0);
      load: in std_logic;
      reset: in std_logic;
      clk: in std_logic;
      reg_out: out std_logic_vector(3 downto 0)
      );
    end component register_clock_divider;
    
begin
  register_clock_divider_0 : register_clock_divider port map(parallel_in => parallel_in, l_r => l_r, load => load, reset => reset, clk => clk, reg_out => reg_out);
  
  clk_process: process
    begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      
      wait for clk_period/2;
      clk <= '0';
      
  end process;
  
  
  simulation_process: process
    begin
      reset <= '1';
      load <= '0';
      l_r <= "00";
      parallel_in <= "0000";
      wait for 1 sec;
      
      reset <= '0';
      parallel_in <= "1010";
      load <= '1';
      wait for 1 sec;
      
      -- shift left
      load <= '0';
      l_r <= "01";
      wait for 1 sec;
      
      -- logical shift right
      l_r <= "10";
      wait for 1 sec;

      -- arithmetic shift right
      l_r <= "11";
      wait for 1 sec;      
      
      reset <= '1';
      wait for 1 sec;
      
      reset <= '0';
      parallel_in <= "0011";
      load <= '1';
      wait for 1 sec;
      
      -- shift left
      load <= '0';
      l_r <= "01";
      wait for 1 sec;
      
      -- logical shift right
      l_r <= "10";
      wait for 1 sec;

      -- arithmetic shift right
      l_r <= "11";
      wait for 1 sec;      
      
    end process;

end behaviour;

