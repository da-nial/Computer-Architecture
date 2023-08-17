LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Tb_carry_select_adder IS
END Tb_carry_select_adder;
 
ARCHITECTURE behavior OF Tb_carry_select_adder IS
 
 
 
COMPONENT carry_select_adder
PORT(
X : IN std_logic_vector(3 downto 0);
Y : IN std_logic_vector(3 downto 0);
CARRY_IN : IN std_logic;
SUM : OUT std_logic_vector(3 downto 0);
CARRY_OUT : OUT std_logic
);
END COMPONENT;
 

signal X : std_logic_vector(3 downto 0) := (others => '0');
signal Y : std_logic_vector(3 downto 0) := (others => '0');
signal CARRY_IN : std_logic := '0';
 

signal SUM : std_logic_vector(3 downto 0);
signal CARRY_OUT : std_logic;
 
BEGIN
 
 
uut: carry_select_adder PORT MAP (
X => X,
Y => Y,
CARRY_IN => CARRY_IN,
SUM => SUM,
CARRY_OUT => CARRY_OUT
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