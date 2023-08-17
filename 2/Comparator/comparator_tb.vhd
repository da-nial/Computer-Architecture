library ieee;
use ieee.std_logic_1164.all;


entity comparator_tb is
end entity comparator_tb;


architecture test of comparator_tb is
  signal A, B :std_logic_vector(3 downto 0);
  signal greater, equal, smaller : std_logic;

begin
  -- connecting testbench signals with half_adder.vhd
  UUT : entity work.comparator_arith port map (A => A, B => B, greater => greater, equal => equal, smaller => smaller);
  
-- inputs
    -- 0000 at 0 ns
    -- at 20 ns, a is 0010, b is 0001, expected result: greater: 1, equal: 0, smaller: 0
    -- at 40 ns, a is 0010, b is 0011, expected result: greater: 0, equal: 0, smaller: 1
    -- at 60 ns, a is 0100, b is 0100, expected result: greater: 0, equal: 1, smaller: 0
    -- at 80 ns, a is 1000, b is 1001, expected result: greater: 0, equal: 0, smaller: 1
    A <= "0000", "0010" after 20 ns, "0010" after 40 ns, "0100" after 60 ns, "1000" after 80 ns;
    B <= "0000", "0001" after 20 ns, "0011" after 40 ns, "0100" after 60 ns, "1001" after 80 ns;     
end test;
