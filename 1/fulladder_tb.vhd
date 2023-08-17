library ieee;
use ieee.std_logic_1164.all;


entity fulladder_tb is
end entity fulladder_tb;


architecture test of fulladder_tb is
  signal i0, i1, cin :std_logic;
  signal s, cout : std_logic;

begin
  -- connecting testbench signals with half_adder.vhd
  UUT : entity work.full_adder port map (i0 => i0, i1 => i1, cin => cin, s => s, cout => cout);
  
-- inputs
    -- 0000 at 0 ns
    -- at 20 ns, a is 0010, b is 0001, expected result: greater: 1, equal: 0, smaller: 0
    -- at 40 ns, a is 0010, b is 0011, expected result: greater: 0, equal: 0, smaller: 1
    -- at 60 ns, a is 0100, b is 0100, expected result: greater: 0, equal: 1, smaller: 0
    -- at 80 ns, a is 1000, b is 1001, expected result: greater: 0, equal: 0, smaller: 1
    i0 <= '0', '1' after 20 ns, '1' after 40 ns, '1' after 60 ns, '0' after 80 ns;
    i1 <= '0', '1' after 20 ns, '1' after 40 ns, '0' after 60 ns, '1' after 80 ns;
    cin <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '1' after 80 ns;
      
end test;
