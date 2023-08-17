library ieee;
use ieee.std_logic_1164.all;


entity decoder_tb is
end entity decoder_tb;


architecture test of decoder_tb is
  signal input :std_logic_vector(3 downto 0);
  signal output : std_logic_vector(15 downto 0);

begin
  -- connecting testbench signals with half_adder.vhd
  UUT : entity work.decoder port map (input => input, output => output);
  
    -- inputs
    -- 0000 at 0 ns, expected result: 0
    -- 0001 at 20 ns, expected result: 1
    -- 0010 at 40 ns, expected result: 2
    -- 0011 at 60 ns, expected result: 3
    -- 0110 at 80 ns, expected result: 6
    -- 1001 at 100 ns, expected result: 9
    -- 1010 at 120 ns, expected result: 10
    input <= "0000", "0001" after 20 ns, "0010" after 40 ns, "0011" after 60 ns, "0110" after 80 ns,
    "1001" after 100 ns, "1010" after 120 ns; 
end test;
