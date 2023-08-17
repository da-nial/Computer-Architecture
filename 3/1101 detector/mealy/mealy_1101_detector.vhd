library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

entity mealy_1101_detector is 
 
	port(   
		din : in std_logic ;  
		clk : in std_logic  ;
		detect : out std_logic
	);
end mealy_1101_detector;  

architecture behave of mealy_1101_detector is 

type state_t is (s0,s1,s2,s3);
signal state: state_t:=s0;
signal next_state: state_t:=s0;
signal o: std_logic;


begin
	cmb:process(din,state)	
	begin 
		case state is 
			when s0=>
				if(din='1')then
					next_state<=s1;
					o<='0';
				else
					next_state<=s0;
					o<='0';
				end if;
			when s1=>
				if(din='1')then
					next_state<=s2;
					o<='0';
				else
					next_state<=s0;
					o<='0';
				end if;
			when s2=>
				if(din='1')then
					next_state<=s2;
					o<='0';
				else
					next_state<=s3;
					o<='0';
				end if;
			when s3=>
				if(din='1')then
					next_state<=s1;
					o<='1';
				else
					next_state<=s0;
					o<='0';
				end if;
		end  case;
	end process;
	reg:process (clk)
		begin
			if rising_edge(clk)then 
				state<=next_state;
				detect<=o;
			end if;
	end process;
end behave;

















