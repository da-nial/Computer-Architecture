library ieee;
use ieee.std_logic_1164.all;


entity pipo_register is 
  port(
    parallel_in: in std_logic_vector(3 downto 0);
    l_r : in std_logic_vector(1 downto 0);
    load: in std_logic;
    reset: in std_logic;
    clk: in std_logic;
    reg_out: out std_logic_vector(3 downto 0)
  );
end pipo_register;

architecture arch of pipo_register is
  signal internal_reg: std_logic_vector(3 downto 0);
  
begin
  process (clk)
  begin
  if (clk'event and clk='1') then
    if reset = '1' then
      internal_reg <= "0000";
    elsif load = '1' then
      internal_reg <= parallel_in;
    elsif l_r = "00" then
      internal_reg <= parallel_in;
    -- l_r = '01' represents shift left
    -- l_r = '10' represents logical shift right
    -- l_r = '11' represents arithmetic shift left
    elsif l_r = "01" then 
      internal_reg(3 downto 1) <= internal_reg(2 downto 0);
      internal_reg(0) <= '0';
    elsif l_r = "10" then
      internal_reg(2 downto 0) <= internal_reg(3 downto 1);
      internal_reg(3) <= '0';
    elsif l_r = "11" then
      internal_reg(2 downto 0) <= internal_reg(3 downto 1);
    end if;
  end if;
  
end process;
reg_out <= internal_reg;
end arch;