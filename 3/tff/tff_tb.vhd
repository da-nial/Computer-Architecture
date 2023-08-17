library ieee;
use ieee.std_logic_1164.all;

entity tff_tb is
end tff_tb;

architecture tff_tb_behaviour of tff_tb is
    signal clk, T: std_logic := '0';
    signal rst: std_logic := '0';
    signal Q, QB: std_logic;
    
    constant clk_period : time := 10 ns;
    
    component tff is
      port (
        clk  : in  std_logic;
        rst : in  std_logic;
        T    : in  std_logic;
        Q    : out std_logic;
        QB   : out std_logic
        );
    end component tff;
    
begin
  tff_instance : tff port map(clk => clk, T => T, rst => rst, Q => Q, QB => QB);
  
  
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
      T <= '0';
      wait for 50 ns;
      
      rst <= '0';
      T <= '1';
      wait for 50 ns;
      
    end process;

end tff_tb_behaviour;
