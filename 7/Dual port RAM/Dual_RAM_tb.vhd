--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:21:08 09/14/2020
-- Design Name:   
-- Module Name:   C:/Users/Sepehr/Desktop/A/Dual_RAM/Dual_RAM_tb.vhd
-- Project Name:  Dual_RAM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Dual_RAM
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
 
ENTITY Dual_RAM_tb IS
END Dual_RAM_tb;
 
ARCHITECTURE behavior OF Dual_RAM_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Dual_RAM
		 generic(
			 w : INTEGER := 4; -- width of each data word
			 c : INTEGER := 4 -- log2 of number of cells in memory. i.e. number of bits needed to address cells of memory.
	  );
  
    PORT(
         clk : IN  std_logic;
         rd : IN  std_logic;
         wr : IN  std_logic;
         rst : IN  std_logic;
         addr_rd : IN  std_logic_vector(c - 1 downto 0);
         addr_wr : IN  std_logic_vector(c - 1 downto 0);
         data_in : IN  std_logic_vector(w - 1 downto 0);
         data_out : OUT  std_logic_vector(w - 1 downto 0)
        );
    END COMPONENT;
    
	 
	-- constants
	constant MEMORY_WIDTH : integer := 4;
	constant ADDRESS_WIDTH : integer := 4;

   --Inputs
   signal clk : std_logic := '0';
   signal rd : std_logic := '0';
   signal wr : std_logic := '0';
   signal rst : std_logic := '0';
   signal addr_rd : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := (others => '0');
   signal addr_wr : std_logic_vector(ADDRESS_WIDTH - 1 downto 0) := (others => '0');
   signal data_in : std_logic_vector(MEMORY_WIDTH - 1 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(MEMORY_WIDTH - 1 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dual_RAM PORT MAP (
          clk => clk,
          rd => rd,
          wr => wr,
          rst => rst,
          addr_rd => addr_rd,
          addr_wr => addr_wr,
          data_in => data_in,
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
     -- hold reset state for 20 ns.
		rst <= '0';
		wait for 20 ns;
		
		
		rst <= '1';
		rd <= '1';
		for i in 0 to ( (2 ** ADDRESS_WIDTH) - 1 ) loop
            addr_rd <= std_logic_vector(to_unsigned(i, ADDRESS_WIDTH));
				wait for 20 ns;
       end loop;
		 
		 rd <= '0';
		 wr <= '1';
		 addr_wr <= "0000";
		 data_in <= "1100";
		 wait for 20 ns;
		 
		 
		 addr_wr <= "0001";
		 data_in <= "0101";
		 
		 addr_rd <= "0000";
		 rd <= '1';
		 wr <= '1';
		 wait for 20 ns;
		 

		 rd <= '1';
		 wr <= '0';
		 addr_rd <= "0001";
		 wait for 20 ns;

		
		 
--		 rd <= '0';
--		 wr <= '1';
--		 for i in 0 to ( (2 ** ADDRESS_WIDTH) - 1) loop
--				  addr <= std_logic_vector(to_unsigned(i, ADDRESS_WIDTH));
--            data_in <= std_logic_vector(to_unsigned(2 ** ADDRESS_WIDTH - 1 - i, MEMORY_WIDTH));
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
