library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FULL_ADDER is
  port(A, B, CIN: in  STD_LOGIC;
       SUM, COUT: out STD_LOGIC);
end FULL_ADDER;

architecture DATAFLOW of FULL_ADDER is
begin
  SUM <=  ((not CIN) and (not A) and      B ) or
          ((not CIN) and      A  and (not B)) or
          (     CIN  and (not A) and (not B)) or
          (     CIN  and      A  and      B );

  COUT <= ((not CIN) and      A  and      B ) or
          (     CIN  and (not A) and      B ) or
          (     CIN  and      A  and (not B)) or
          (     CIN  and      B  and      B );
end DATAFLOW;