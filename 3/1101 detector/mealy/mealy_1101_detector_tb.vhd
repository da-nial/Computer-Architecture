library ieee;
use ieee.std_logic_1164.all;

entity mealy_1101_detector_tb is
end mealy_1101_detector_tb;
 
architecture behavior of mealy_1101_detector_tb is
 
    component mealy_1101_detector
    port(
        din : in  std_logic;
        clk : in  std_logic;
        detect : out  std_logic
        );
    end component mealy_1101_detector;
    

   signal clk : std_logic := '0';
   signal din : std_logic := '0';

   signal detect : std_logic;

   constant clk_period : time := 20 ns;
 
begin
   uut: mealy_1101_detector port map (
          clk => clk,
          din => din,
          detect => detect
        );

   -- Clock process definitions
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

end;
