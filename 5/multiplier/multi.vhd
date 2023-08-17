library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplier is
Port (X : in STD_LOGIC_VECTOR(3 downto 0);
Y : in STD_LOGIC_VECTOR(3 downto 0);
result : out STD_LOGIC_VECTOR(7 downto 0)
);
end multiplier;

architecture Behavioral of multiplier is

component full_adder
 port(A, B, CIN: in  STD_LOGIC;
       SUM, COUT: out STD_LOGIC);
end component;

component half_adder
port(
i_bit1  : in std_logic;
    i_bit2  : in std_logic;
    
    o_sum   : out std_logic;
    o_carry : out std_logic
);
end component;

signal and_gate : STD_LOGIC_VECTOR( 15 DOWNTO 0);
signal c1, c2, c3 : std_logic_vector( 3 downto 0);
signal s1, s2, s3 : std_logic_vector(3 downto 0);




begin

and_gate(0) <= x(0) and y(0);
and_gate(1) <= x(0) and y(1);
and_gate(2) <= x(0) and y(2);
and_gate(3) <= x(0) and y(3);
and_gate(4) <= x(1) and y(0);
and_gate(5) <= x(1) and y(1);
and_gate(6) <= x(1) and y(2);
and_gate(7) <= x(1) and y(3);
and_gate(8) <= x(2) and y(0);
and_gate(9) <= x(2) and y(1);
and_gate(10) <= x(2) and y(2);
and_gate(11) <= x(2) and y(3);
and_gate(12) <= x(3) and y(0);
and_gate(13) <= x(3) and y(1);
and_gate(14) <= x(3) and y(2);
and_gate(15) <= x(3) and y(3);

HA1 : half_adder port map(and_gate(1) , and_gate(4) , s1(0) , c1(0));
FA1 : full_adder port map(and_gate(2) , and_gate(5) , c1(0) , s1(1) , c1(1));
FA2 : full_adder port map(and_gate(3) , and_gate(6) , c1(1) , s1(2) , c1(2));
HA2 : half_adder port map(c1(2) , and_gate(7) , s1(3) , c1(3));

HA3 : half_adder port map(and_gate(8) , s1(1) , s2(0) , c2(0));
FA3 : full_adder port map(and_gate(9) , s1(2) , c2(0) , s2(1) , c2(1));
FA4 : full_adder port map(and_gate(10) , s1(3) , c2(1) , s2(2) , c2(2));
FA5 : full_adder port map(and_gate(11) , c1(3) , c2(2) , s2(3) , c2(3));

HA4 : half_adder port map(and_gate(12) , s2(1) , s3(0) , c3(0));
FA6 : full_adder port map(and_gate(13) , s2(2) , c3(0) , s3(1) , c3(1));
FA7 : full_adder port map(and_gate(14) , s2(3) , c3(1) , s3(2) , c3(2));
FA8 : full_adder port map(and_gate(15) , c2(3) , c3(2) , s3(3) , c3(3));


result(0) <= and_gate(0);
result(1) <= s1(0);
result(2) <= s2(0);
result(3) <= s3(0);
result(4) <= s3(1);
result(5) <= s3(2);
result(6) <= s3(3);
result(7) <= c3(3);




end Behavioral;
