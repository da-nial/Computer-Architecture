library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

entity moore_0101_0110_detector_tb is 
end moore_0101_0110_detector_tb;  

architecture behave of moore_0101_0110_detector_tb is 
	component moore_0101_0110_detector is
		Port(
			input: in std_logic;
			clk: in std_logic;
			output : out std_logic
		);
	End component moore_0101_0110_detector;
signal clock:std_logic;
signal result:std_logic:='1';
signal inp:std_logic;
begin 
test: moore_0101_0110_detector port map(input=>inp,output=>result,clk=>clock);
  
  

process
	begin 
	inp<='1';
	wait for 150 ns;
	inp<='1';
	wait for 150 ns;
	inp<='0';
	wait for 150 ns;
	inp<='1';
	wait for 150 ns;
	inp<='1';
	wait for 150 ns;
	inp<='0';
	wait for 150 ns;
	inp<='1';
	wait for 150 ns;
	inp<='1';
	wait for 150 ns;
	inp<='1';
	wait for 150 ns;
	inp<='0';
	wait for 150 ns;
	inp<='1';
	wait for 150 ns;
	inp<='0';
	wait for 150 ns;
	inp<='1';
	wait for 150 ns;
	inp<='0';
	wait for 150 ns;
	inp<='1';
	wait for 150 ns;

	inp<='0';
	wait for 150 ns;



end process;
process 
	begin 
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
	clock<='1';
	wait for 100 ns;
	clock<='0';
	wait for 100 ns;
end process;
	

end behave;