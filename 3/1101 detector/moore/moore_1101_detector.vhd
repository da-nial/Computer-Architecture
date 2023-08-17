library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 

entity moore_1101_detector is 
 
	port(   
		din : in std_logic ;
		detect : out std_logic;   
		clk : in std_logic  
	);
end moore_1101_detector;  

architecture behave of moore_1101_detector is 

type state_t is (s0,s1,s2,s3,s4);
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
					
				else
					next_state<=s0;
					
				end if;
			when s1=>
				if(din='1')then
					next_state<=s2;
					
				else
					next_state<=s0;
					
				end if;
			when s2=>
				if(din='1')then
					next_state<=s2;
	
				else
					next_state<=s3;
				
				end if;
			when s3=>
				if(din='1')then
					next_state<=s4;
				
				else
					next_state<=s0;

				end if;
			when s4=>
				if(din='1')then
					next_state<=s2;
				
				else
					next_state<=s0;

				end if;
		end  case;
	end process;
	reg:process (clk)
		begin
			if rising_edge(clk)then 
				state<=next_state;

			end if;
		
	end process;
				detect<='0' when state = s0   else
					'0' when state = s1   else
					'0' when state = s2   else
					'0' when state = s3   else
					'1' when state = s4   ;
end behave;