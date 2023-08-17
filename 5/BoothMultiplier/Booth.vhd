LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY booth_multiplier IS

	GENERIC (x : INTEGER := 4;
		 y : INTEGER := 4);
	
	PORT(clk : IN STD_LOGIC;
	     m : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	     r : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	     result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
		  
END booth_multiplier;

ARCHITECTURE behavior OF booth_multiplier IS

signal state : std_logic_vector(x + y - 1 downto 0) := (others => '0') ;

BEGIN
	
	PROCESS(clk)
		
		CONSTANT X_ZEROS : STD_LOGIC_VECTOR(x - 1 DOWNTO 0) := (OTHERS => '0');
		CONSTANT Y_ZEROS : STD_LOGIC_VECTOR(y - 1 DOWNTO 0) := (OTHERS => '0');
		
		VARIABLE a, s, p : STD_LOGIC_VECTOR(x + y + 1 DOWNTO 0);
		VARIABLE mn      : STD_LOGIC_VECTOR(x - 1 DOWNTO 0);
	
	BEGIN
		
		a := (OTHERS => '0');
		s := (OTHERS => '0');
		p := (OTHERS => '0');
		
		IF (m /= X_ZEROS AND r /= Y_ZEROS) THEN
			
			a(x + y DOWNTO y + 1) := m;
			a(x + y + 1) := m(x - 1);
			
			mn := (NOT m) + 1;
			
			s(x + y DOWNTO y + 1) := mn;
			s(x + y + 1) := NOT(m(x - 1));
			
			p(y DOWNTO 1) := r;
			
			FOR i IN 1 TO y LOOP
				
				IF (p(1 DOWNTO 0) = "01") THEN
					p := p + a;
				ELSIF (p(1 DOWNTO 0) = "10") THEN
					p := p - a;
				END IF;
				
				-- Shift Right Arithmetic
				p(x + y DOWNTO 0) := p(x + y + 1 DOWNTO 1);
				--if(clk'event and clk = '1') then
				--	result <= p(x + y DOWNTO 1);
				--end if ;
				state <= p(x + y DOWNTO 1);
			
			END LOOP;
			
	
		END IF;
		
	END PROCESS;
	
	result <= state;
END behavior;