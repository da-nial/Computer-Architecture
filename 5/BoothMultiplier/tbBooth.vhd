LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Tb_Booth IS
END Tb_Booth;
 
ARCHITECTURE behavior OF Tb_Booth IS
 
 
 
COMPONENT booth_multiplier
PORT(
clk : IN std_logic ;
m : IN std_logic_vector(3 downto 0);
r : IN std_logic_vector(3 downto 0);

result : OUT std_logic_vector(7 downto 0)

);
END COMPONENT;
 
signal clk : std_logic := '0';
signal X : std_logic_vector(3 downto 0) := (others => '0');
signal Y : std_logic_vector(3 downto 0) := (others => '0');

 

signal SUM : std_logic_vector(7 downto 0);

 
BEGIN
 
 
uut: booth_multiplier PORT MAP (
clk => clk,
m => X,
r => Y,

result => SUM

);
 

stim_proc: process
begin

wait for 100 ns;
clk <= '1';

 
wait for 100 ns;
clk <= '0';

 
wait for 100 ns;
clk <= '1';

wait for 100 ns;
clk <= '0';

wait for 100 ns;
clk <= '1';

wait for 100 ns;
clk <= '0';

wait for 100 ns;
clk <= '1';

wait for 100 ns;
clk <= '0';


wait;
end process;
 
END;