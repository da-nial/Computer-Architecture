Library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity comparator_arith is
  port (
    A, B: in std_logic_vector(3 downto 0);
    greater, equal, smaller : out std_logic
    );
end comparator_arith ;
 
architecture behavioral of comparator_arith is
begin
greater <= '1' when (A > B)
else '0';
equal <= '1' when (A = B)
else '0';
smaller <= '1' when (A < B)
else '0';
end behavioral;

