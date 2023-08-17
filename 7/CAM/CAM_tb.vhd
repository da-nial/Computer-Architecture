--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:18:41 09/14/2020
-- Design Name:   
-- Module Name:   C:/Users/Sepehr/Desktop/A/CAM/CAM_tb.vhd
-- Project Name:  CAM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CAM
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
 
ENTITY CAM_tb IS
END CAM_tb;
 
ARCHITECTURE behavior OF CAM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAM
	 generic (
		w : integer := 8; -- width of each data word
		c : integer := 4 -- number of cells in CAM
		);
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         wr : IN  std_logic;
         rd : IN  std_logic;
         data_in : IN  std_logic_vector(w - 1 downto 0);
         hit_out : OUT  std_logic;
         addr_out : OUT  std_logic_vector(c - 1 downto 0)
        );
    END COMPONENT;
	 
	 
    -- constants
	 constant MEMORY_WIDTH : integer := 8;
	 constant ADDRESS_WIDTH : integer := 4;

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal wr : std_logic := '0';
   signal rd : std_logic := '0';
   signal data_in : std_logic_vector(MEMORY_WIDTH - 1 downto 0) := (others => '0');

 	--Outputs
   signal hit_out : std_logic;
   signal addr_out : std_logic_vector(ADDRESS_WIDTH - 1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAM PORT MAP (
          clk => clk,
          rst => rst,
          wr => wr,
          rd => rd,
          data_in => data_in,
          hit_out => hit_out,
          addr_out => addr_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		rst <= '0';
      wait for 100 ns;
		
--		rst <= '0';
--		wr <= '1';
--		data_in <= "11111111";
--		wait for 20 ns;
--		
--		wr <= '0';
--		rd <= '1';
--		data_in <= "11111111";
--		wait for 20 ns;

		rst <= '1';
		wr <= '1';
		data_in <= "00000011";
		wait for 20 ns;
		
		
		data_in <= "10000000";
		wait for 20 ns;
		
		wr <= '0';
		rd <= '1';
		data_in <= "11000000";
		wait for 20 ns;
		
		data_in <= "00000011";
		wait for 20 ns;
		
		data_in <= "10000000";
		wait for 20 ns;
		
		
		rd <= '0';
      wait for clk_period*10;
		

      -- insert stimulus here 
		
      wait;
   end process;

END;
