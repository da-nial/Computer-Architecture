LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Tb_multiplier IS
END Tb_multiplier;
 
ARCHITECTURE behavior OF Tb_multiplier IS
 
 
 
COMPONENT multiplier
PORT(
X : IN std_logic_vector(3 downto 0);
Y : IN std_logic_vector(3 downto 0);
result : out STD_LOGIC_VECTOR(7 downto 0)

);
END COMPONENT;
 

signal X : std_logic_vector(3 downto 0) := (others => '0');
signal Y : std_logic_vector(3 downto 0) := (others => '0');
signal result : std_logic_vector(7 downto 0) := (others => '0');
 
 
BEGIN
 
 
uut: multiplier PORT MAP (
X => X,
Y => Y,
result => result

);
 

stim_proc: process
begin

wait for 100 ns;
X <= "1011";
Y <= "1111";
 
wait for 100 ns;
X <= "0001";
Y <= "1010";
 
wait for 100 ns;
X <= "0111";
Y <= "1111";

wait for 100 ns;
X <= "0001";
Y <= "1011";

wait for 100 ns;
X <= "0111";
Y <= "1111";

wait for 100 ns;
X <= "0101";
Y <= "1001";


wait;
end process;
 
END;