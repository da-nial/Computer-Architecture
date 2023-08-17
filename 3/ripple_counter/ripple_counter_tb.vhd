library ieee;
use ieee.std_logic_1164.all;

entity ripple_counter_tb is
end ripple_counter_tb;

architecture ripple_counter_tb_behaviour of ripple_counter_tb is
    signal clk, rst: std_logic := '0';
    signal count: std_logic_vector(3 downto 0);
    
    constant clk_period : time := 10 ns;
    
    component ripple_counter is
      port (
        clk  : in  std_logic;
        rst : in  std_logic;
       	count : out std_logic_vector(3 downto 0)
        );
    end component ripple_counter;
    
begin
  ripple_counter_0 : ripple_counter port map(clk => clk, rst => rst, count => count);
  
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
      rst <= '1';
      wait for 50 ns;
      
      rst <= '0';
      wait for 100 ns;
      
    end process;

end ripple_counter_tb_behaviour;

