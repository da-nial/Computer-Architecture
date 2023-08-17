library ieee;
use ieee.std_logic_1164.all;
 
entity moore_1011_detector_tb is
end moore_1011_detector_tb;
 
architecture behavior of moore_1011_detector_tb is 

    component moore_1101_detector
    port(
         clk : in  std_logic;
         din : in  std_logic;
         detect : out  std_logic
        );
    end component;
    
   signal clk : std_logic := '0';
   signal din : std_logic := '0';

   signal detect : std_logic;

   constant clk_period : time := 20 ns;
 
begin
   uut: moore_1101_detector port map (din => din, detect => detect, clk => clk);

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
   
   -- din: 0 0 0 1 1 0 0 1 0 1 0 1 1 1 0 1 1
 
   stim_proc: process
   begin		
		din <= '0';
		wait for 20 ns;
		din <= '0';
		wait for 20 ns;   
		din <= '0';
		wait for 20 ns;   
		din <= '1';
		wait for 20 ns;   
		din <= '1';
		wait for 20 ns;   
		din <= '0';
		wait for 20 ns;   
		din <= '0';
		wait for 20 ns;   
		din <= '1';
		wait for 20 ns;   
		din <= '0';
		wait for 20 ns;   
		din <= '1';
		wait for 20 ns;   
		din <= '0';
		wait for 20 ns;   
		din <= '1';
		wait for 20 ns;   
		din <= '1';
		wait for 20 ns;  
		din <= '1';
		wait for 20 ns;   
		din <= '0';
		wait for 20 ns;   
		din <= '1';
		wait for 20 ns;   
		din <= '1';
		wait for 20 ns;
   end process;

END;
