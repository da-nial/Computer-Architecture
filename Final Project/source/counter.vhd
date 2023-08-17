library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
	port (
		clk     : in  std_logic; -- clock of the system
		clr     : in  std_logic; -- clear, if set to 1, count wll be set to 0 in the next rising edge of the clock.
		inr     : in std_logic; -- increment, if set to 1, count will be incremented in the next rising edge of the clock.
		
		count : out std_logic_vector(3 downto 0)
	);
end counter;


architecture arch of counter is
  
  signal count_internal : std_logic_vector(3 downto 0) := "0000";
  
begin
  process(clk)
    begin
      if (rising_edge(clk)) then
        if (clr = '1') then
          count_internal <= "0000";
        elsif (inr = '1') then
          count_internal <= std_logic_vector(unsigned(count_internal) + 1);
        end if;
      end if;
      
      count <= count_internal;
    end process;
end arch;



