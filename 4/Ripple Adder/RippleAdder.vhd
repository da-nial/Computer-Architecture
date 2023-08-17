library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
Y : in STD_LOGIC_VECTOR (3 downto 0);
CARRY_IN : in STD_LOGIC;
SUM : out STD_LOGIC_VECTOR (3 downto 0);
CARRY_OUT : out STD_LOGIC);
end ripple_adder;

architecture Behavioral of ripple_adder is

component full_adder
 port(A, B, CIN: in  STD_LOGIC;
       SUM, COUT: out STD_LOGIC);
end component;


signal A,B,C0,C1: STD_LOGIC_VECTOR( 3 DOWNTO 0);
begin

FA1: full_adder PORT MAP(X(0),Y(0),CARRY_IN ,SUM(0),C0(0));
FA2: full_adder PORT MAP(X(1),Y(1),C0(0),SUM(1),C0(1));
FA3: full_adder PORT MAP(X(2),Y(2),C0(1),SUM(2),C0(2));
FA4: full_adder PORT MAP(X(3),Y(3),C0(2),SUM(3),CARRY_OUT);




end Behavioral;
