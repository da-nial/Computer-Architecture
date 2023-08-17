library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity mux2_1 is
port(
 
A,B : in STD_LOGIC;
Sel: in STD_LOGIC;
Z: out STD_LOGIC
);
end mux2_1;
 
architecture bhv of mux2_1 is
begin
    Z <= ((A and (not Sel)) or ( B and Sel ));
end bhv;
