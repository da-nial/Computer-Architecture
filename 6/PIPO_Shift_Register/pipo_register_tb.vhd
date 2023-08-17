library ieee;
use ieee.std_logic_1164.all;

entity pipo_register_tb is
end pipo_register_tb;

architecture pipo_register_tb_behaviour of pipo_register_tb is
    signal clk, reset, load: std_logic := '0';
    signal l_r: std_logic_vector(1 downto 0);
    signal parallel_in: std_logic_vector(3 downto 0);
    signal reg_out: std_logic_vector(3 downto 0);
    
    constant clk_period : time := 100 ns;
    
    component pipo_register is
      port(
      parallel_in: in std_logic_vector(3 downto 0);
      l_r : in std_logic_vector(1 downto 0);
      load: in std_logic;
      reset: in std_logic;
      clk: in std_logic;
      reg_out: out std_logic_vector(3 downto 0)
      );
    end component pipo_register;
    
begin
  pipo_register_0 : pipo_register port map(parallel_in => parallel_in, l_r => l_r, load => load, reset => reset, clk => clk, reg_out => reg_out);
  
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
      wait for 50 ns;
      
      reset <= '0';
      parallel_in <= "1010";
      load <= '1';
      wait for 100 ns;
      
      -- shift left
      load <= '0';
      l_r <= "01";
      wait for 100 ns;
      
      -- logical shift right
      l_r <= "10";
      wait for 100 ns;

      -- arithmetic shift right
      l_r <= "11";
      wait for 100 ns;      
      
      reset <= '1';
      wait for 100 ns;
      
      reset <= '0';
      parallel_in <= "0011";
      load <= '1';
      wait for 100 ns;
      
      -- shift left
      load <= '0';
      l_r <= "01";
      wait for 100 ns;
      
      -- logical shift right
      l_r <= "10";
      wait for 100 ns;

      -- arithmetic shift right
      l_r <= "11";
      wait for 100 ns;      
      
    end process;

end pipo_register_tb_behaviour;
