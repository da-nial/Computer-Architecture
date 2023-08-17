library ieee;
use ieee.std_logic_1164.all;

entity dff is
	port (
		clk  : in  std_logic;
		rst : in  std_logic;
		D    : in  std_logic;
		Q    : out std_logic;
		QB   : out std_logic
	);
end dff;


architecture dff_arc of dff is
begin
  
  process(clk,rst)
  begin
    if (rst = '0' ) then
      Q <= '0';
      QB <= '1';
    elsif (clk'event and clk = '1') then
      Q <= D;
      QB <= not D;
    end if ;
end process ; 

end dff_arc;
