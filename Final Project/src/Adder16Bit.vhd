library IEEE;
use IEEE.std_logic_1164.all;


entity adder16 is 
generic (n : integer := 16);

 port(
  command         : in std_logic ;
  inputA , inputB : in std_logic_vector(n - 1 downto 0);
  carryin         : in std_logic;
  result          : out std_logic_vector(n - 1 downto 0));
end entity;


architecture instance of adder16 is   
component adder is port(
  a , b , cin : in std_logic;
  s , cout : out std_logic);
end component;
signal c      : std_logic_vector(n downto 0) := (others => '0');
signal output : std_logic_vector(n - 1 downto 0) := (others => '0');
begin 

	
	c(0) <= carryin;
	halghe: for i in 0 to n - 1 generate
	   fAdder:  adder port map(a => inputA(i) , b => inputB(i) , cin => c(i) , s => output(i) , cout => c(i + 1)); 
  end generate halghe;

process(command) begin
	if (command = '1') then
		result <= output ;
	end if;
end process;  
  
end architecture;