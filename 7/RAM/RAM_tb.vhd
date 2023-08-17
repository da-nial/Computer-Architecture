--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:53:02 09/14/2020
-- Design Name:   
-- Module Name:   C:/Users/Sepehr/Desktop/A/RAM/RAM_tb.vhd
-- Project Name:  RAM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM
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


 
ENTITY RAM_tb IS
END RAM_tb;
 
ARCHITECTURE behavior OF RAM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RAM
			generic(
				w : INTEGER := 8; -- width of each data word
				c : INTEGER := 64 -- log2 of number of cells in memory. i.e. number of bits needed to address cells of memory.
			);
			
			PORT(
				clk : IN  std_logic;
				rd : IN  std_logic;
				wr : IN  std_logic;
				rst : IN  std_logic;
				addr : IN  std_logic_vector(c-1 downto 0);
				data : INOUT  std_logic_vector(w-1 downto 0)
        );
    END COMPONENT;
	 
	 
   -- constants
	constant MEMORY_WIDTH : integer := 4;
	constant ADDRESS_WIDTH : integer := 4;

   --Inputs
   signal clk : std_logic := '0';
   signal rd : std_logic := '0';
   signal wr : std_logic := '0';
   signal rst : std_logic := '1';
   signal addr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := (others => '0');
	
	

 	--Input and Output:
   signal data : std_logic_vector(MEMORY_WIDTH - 1 downto 0) := (others => 'Z');
	

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RAM
		generic map ( w => MEMORY_WIDTH, c => ADDRESS_WIDTH)
		PORT MAP (
          clk => clk,
          rd => rd,
          wr => wr,
          rst => rst,
          addr => addr,
          data => data
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
      -- hold reset state for 20 ns.
		rst <= '0';
		wait for 20 ns;
		
		
		rst <= '1';
		rd <= '1';
		for i in 0 to ( (2 ** ADDRESS_WIDTH) - 1 ) loop
				data <= (others => 'Z');
            addr <= std_logic_vector(to_unsigned(i, ADDRESS_WIDTH));
				wait for 20 ns;
       end loop;
		 
		 data <= (others => 'Z');
		 wait for 20 ns;
		 
		 
		 addr <= "0000";
		 data <= "0101";
		 rd <= '0';
		 wr <= '1';
		 wait for 20 ns;
		 
		 
		 
		 addr <= "0000";
		 rd <= '1';
		 wr <= '0';
		 wait for 20 ns;
		 
		 
		 data <= (others => 'Z');
		 wait for 20 ns;

		 
--		 rd <= '0';
--		 wr <= '1';
--		 for i in 0 to ( (2 ** ADDRESS_WIDTH) - 1) loop
--				  addr <= std_logic_vector(to_unsigned(i, ADDRESS_WIDTH));
--            data <= std_logic_vector(to_unsigned(2 ** ADDRESS_WIDTH - 1 - i, MEMORY_WIDTH));
--				wait for 20 ns;
--		  end loop;
--			
--		data_in <= (others => 'Z');
--		rd <= '1';
--		wr <= '0';
--		for i in 0 to ( (2 ** ADDRESS_WIDTH) - 1 ) loop
--				addr <= std_logic_vector(to_unsigned(i, ADDRESS_WIDTH));
--				wait for 20 ns;
--       end loop;

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
