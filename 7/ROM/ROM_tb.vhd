--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:50:02 09/14/2020
-- Design Name:   
-- Module Name:   C:/Users/Sepehr/Desktop/A/ROM/ROM_tb.vhd
-- Project Name:  ROM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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
USE ieee.numeric_std.ALL;
 
ENTITY ROM_tb IS
END ROM_tb;
 
ARCHITECTURE behavior OF ROM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
		 generic(
					w : INTEGER := 4; -- width of each data word
					c : INTEGER := 4 -- log2 of number of cells in memory. i.e. number of bits needed to address cells of memory.
				);
		 PORT(
				clk : IN  std_logic;
				addr : IN  std_logic_vector(c - 1 downto 0);
				
				rst : in std_logic; -- reset signal
				rd : in std_logic; -- read signal
				
				data_out : OUT  std_logic_vector(w - 1 downto 0)
			  );
    END COMPONENT;
	 
	 
	 -- constants
	constant MEMORY_WIDTH : integer := 4;
	constant ADDRESS_WIDTH : integer := 4;
    

   --Inputs
   signal clk : std_logic := '0';
   signal addr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := (others => '0');
	
	signal rd : std_logic := '0'; 
	signal rst : std_logic := '1'; -- reset is active low!

 	--Outputs
   signal data_out : std_logic_vector(MEMORY_WIDTH - 1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          clk => clk,
          addr => addr,
			 rst => rst,
			 rd => rd,
          data_out => data_out
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
		rd <= '1';
		for i in 0 to ( (2 ** ADDRESS_WIDTH) - 1 ) loop
            addr <= std_logic_vector(to_unsigned(i, ADDRESS_WIDTH));
				wait for 20 ns;
       end loop;
		 
		rd <= '0';
		rst <= '0';
		wait for 20 ns;
		
		
		rd <= '1';
		rst <= '1';
		
		for i in 0 to ( (2 ** ADDRESS_WIDTH) - 1 ) loop
            addr <= std_logic_vector(to_unsigned(i, ADDRESS_WIDTH));
				wait for 20 ns;
       end loop;
		
		

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
