library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoder4to16 is
  Port (
    din : in STD_LOGIC_VECTOR (3 downto 0);
    dout : out STD_LOGIC_VECTOR (15 downto 0)
  );
end decoder4to16;

architecture bhv of decoder4to16 is
begin
    dout(0) <= '1' when din="0000" else '0';
    dout(1) <= '1' when din="0001" else '0';
    dout(2) <= '1' when din="0010" else '0';
    dout(3) <= '1' when din="0011" else '0';
    dout(4) <= '1' when din="0100" else '0';
    dout(5) <= '1' when din="0101" else '0';
    dout(6) <= '1' when din="0110" else '0';
    dout(7) <= '1' when din="0111" else '0';
    dout(8) <= '1' when din="1000" else '0';
    dout(9) <= '1' when din="1001" else '0';
    dout(10) <= '1' when din="1010" else '0';
    dout(11) <= '1' when din="1011" else '0';
    dout(12) <= '1' when din="1100" else '0';
    dout(13) <= '1' when din="1101" else '0';
    dout(14) <= '1' when din="1110" else '0';
    dout(15) <= '1' when din="1111" else '0';  
end bhv;
