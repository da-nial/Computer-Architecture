library ieee;
use ieee.std_logic_1164.all;

entity tff is
	port (
		clk  : in  std_logic;
		rst : in  std_logic;
		T    : in  std_logic;
		Q    : out std_logic;
		QB   : out std_logic
	);
end tff;


architecture tff_arc of tff is
  signal Q_signal, QB_signal : std_logic;
begin
  process(clk,rst)
  begin
    if (rst = '1' ) then
      Q_signal <= '0';
      QB_signal <= '1';
    elsif (clk'event and clk = '1') then
      if  (T = '1') then
        Q_signal <= not Q_signal;
        QB_signal <= not QB_signal;
      
      end if;  
      if (T = '0') then
        Q_signal <= Q_signal;
        QB_signal <= QB_signal;
      end if;
      
    end if ;
    
  end process ; 
  
  Q <= Q_signal;
  QB <= QB_signal;

end tff_arc;

