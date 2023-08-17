Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity bit_comparator is
  port (
    A, B: in std_logic;
    A_GT_B, A_EQ_B, A_LT_B : out std_logic
    );
end bit_comparator ;
 
architecture behavioral of bit_comparator is
begin
A_GT_B <= '1' when (A > B)
else '0';
A_EQ_B <= '1' when (A = B)
else '0';
A_LT_B <= '1' when (A < B)
else '0';
end behavioral;

