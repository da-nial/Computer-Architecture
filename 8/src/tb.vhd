
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY tb_divider IS
END tb_divider;
 
ARCHITECTURE behavior OF tb_divider IS 
 
    
 
    COMPONENT divider
    PORT(
         m : IN  std_logic_vector(7 downto 0);
         n : IN  std_logic_vector(3 downto 0);
         remainder : OUT  std_logic_vector(3 downto 0);
         quotient : OUT  std_logic_vector(3 downto 0);
         overflow : OUT  std_logic
        );
    END COMPONENT;
    

   
   signal m : std_logic_vector(7 downto 0) := (others => '0');
   signal n : std_logic_vector(3 downto 0) := (others => '0');
  

 	
   signal remainder : std_logic_vector(3 downto 0);
   signal quotient : std_logic_vector(3 downto 0);
	signal overflow : std_logic;

 
BEGIN
 
	
   uut: divider PORT MAP (
          m => m,
          n => n,
          remainder => remainder,
          quotient => quotient,
	  overflow => overflow
        );


 

   
   stim_proc: process
   begin		
		 
      wait for 100 ns;	
		m <= "00011000";
       		n <= "1001";
      
		wait for 100 ns;
		m <= "01101111";
        	n <= "1001";
		
		wait for 100 ns;
		m <= "00010100";
       		n <= "0011";
		
		wait for 100 ns;
		m <= "10100101";
       		n <= "1000";
		
		wait for 100 ns;
		m <= "01101100";
       		n <= "1001";
		
		wait for 100 ns;
		m <= "01011111";
       		n <= "1101";
		 
		 wait for 100 ms;
		m <= "01101111";
       		n <= "0101";
     
      wait;
   end process;

END;
