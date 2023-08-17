library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY REGISTER12BIT IS 
  PORT ( 
     CLK    : IN STD_LOGIC ;
     CLEAR  : IN STD_LOGIC ;
     INC    : IN STD_LOGIC ;
     LOAD   : IN STD_LOGIC ;
     input  : IN std_logic_vector (11 DOWNTO 0) ;  
     output : OUT std_logic_vector (11 DOWNTO 0) := (others => '0')  
  );  
END REGISTER12BIT;


ARCHITECTURE dataflow OF REGISTER12BIT IS 

signal internal_reg : std_logic_vector(11 downto 0) := (others => '0');

BEGIN 
 PROCESS (CLK) BEGIN 

 
IF (clk'event and clk='1') THEN
  	IF (LOAD = '1' ) THEN 
    	  internal_reg <= input; 
  
  	END IF; 
  
  	IF (INC = '1' ) THEN 
 
    	  internal_reg <= internal_reg + 1;
  
  	END IF; 

 	 IF (CLEAR = '1' ) THEN 
    	  internal_reg <= (others => '0') ; 
  	END IF;
  	
END IF ;


END PROCESS; 

output <= internal_reg ;


END ;