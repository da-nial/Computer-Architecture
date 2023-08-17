library ieee;
use ieee.std_logic_1164.all;

entity dff_tb is
end dff_tb;

architecture dff_tb_behaviour of dff_tb is
    signal clk, D: std_logic := '0';
    signal rst: std_logic := '1';
    signal Q, QB: std_logic;
    
    constant clk_period : time := 10 ns;
    
    component dff is
      port (
        clk  : in  std_logic;
        rst : in  std_logic;
        D    : in  std_logic;
        Q    : out std_logic;
        QB   : out std_logic
        );
    end component dff;
    
begin
  dff_instance : dff port map(clk => clk, D => D, rst => rst, Q => Q, QB => QB);
  
  
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
      rst <= '0';
      wait for 50 ns;
      
      rst <= '1';
      D <= '0';
      wait for 50 ns;
      
      rst <= '1';
      D <= '1';
      wait for 50 ns;
      
    end process;

end dff_tb_behaviour;