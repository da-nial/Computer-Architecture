----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:28:00 09/08/2020 
-- Design Name: 
-- Module Name:    register_clock_divider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_clock_divider is 
  port(
    parallel_in: in std_logic_vector(3 downto 0);
    l_r : in std_logic_vector(1 downto 0);
    load: in std_logic;
    reset: in std_logic;
    clk: in std_logic;
    reg_out: out std_logic_vector(3 downto 0)
  );
end register_clock_divider;

architecture arch of register_clock_divider is
  signal internal_reg: std_logic_vector(3 downto 0);
  signal clk_divided  : std_logic := '0';
  
  component frequency_divider is
    port(
		clk_in : IN  std_logic;
		reset  : IN  std_logic;
		clk_out: OUT std_logic
	);
	end component;
  
begin
  freq_divider_0: frequency_divider port map (clk_in => clk, reset => reset, clk_out => clk_divided);
  process (clk_divided)
  begin
  if (clk_divided'event and clk_divided='1') then
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

