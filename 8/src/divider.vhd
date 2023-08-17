library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;




entity divider is
    Port ( m : in  STD_LOGIC_VECTOR (7 downto 0);
           n : in  STD_LOGIC_VECTOR (3 downto 0);
           remainder : out  STD_LOGIC_VECTOR (3 downto 0);
	   quotient : out  STD_LOGIC_VECTOR (3 downto 0);
	   overflow : out std_logic
	);
end divider;

architecture Behavioral of divider is
begin

process(m , n)is

variable E : std_logic := '0';
variable A : std_logic_vector(3 downto 0) := others'0';
variable R : std_logic_vector(3 downto 0) := others'0';

begin 

A := m(7 downto 4);
R := m(3 downto 0);

if(A >= n) then
	overflow <= '1';
	 

else
	overflow <= '0';
	
	for i in 0 to 3 loop
		E := A(3);
		A(3 downto 0) := A(2 downto 0) & R(3);
		R(3 downto 0) := R(2 downto 0) & '0';
		

		if(E ='1') then
			A := A - n;
			R(0):='1';
		elsif(E= '0') then
			if(A >= n) then
				A := A - n;
				R(0) := '1';
			end if;
		end if;
		
	end loop;
end if;

remainder <= A;
quotient <= R;

end process;
end ;