library ieee;
use ieee.std_logic_1164.all;

entity ripple_counter is

	port (
		clk     : in  std_logic;
		rst     : in  std_logic;
		count : out std_logic_vector(3 downto 0)
	);
end ripple_counter;


architecture comprator_arc of ripple_counter is
  component tff is 
    port (
		clk  : in  std_logic;
		rst : in  std_logic;
		T    : in  std_logic;
		Q    : out std_logic;
		QB   : out std_logic
	);
	end component tff;
	
  signal wires : std_logic_vector(3 downto 0);
  
begin
  first_tff: tff port map(clk => clk , rst => rst,T => '1', Q => count(3),QB => wires(0) );
  second_tff :  tff port map(clk => wires(0) , rst => rst,T => '1', Q => count(2),QB => wires(1));
  third_tff :  tff port map(clk => wires(1) , rst => rst,T => '1', Q => count(1),QB => wires(2));
  fourth_tff :  tff port map(clk => wires(2) , rst => rst,T => '1', Q => count(0),QB => wires(3));
end comprator_arc;


