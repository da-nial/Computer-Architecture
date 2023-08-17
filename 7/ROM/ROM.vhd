----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:24 09/14/2020 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;



entity ROM is
  generic(
    w : INTEGER := 4; -- width of each data word
    c : INTEGER := 4 -- log2 of number of cells in memory. i.e. number of bits needed to address cells of memory.
  );
  
  port (
    clk : in std_logic; -- system clock    
    addr : in std_logic_vector(c-1 downto 0); -- address to write/read
	 
	 rst : in std_logic; -- reset signal
	 rd : in std_logic; -- read signal
    
    data_out : out std_logic_vector(w-1 downto 0)
    
  );
end entity;
  
  architecture behaviour of ROM is
    
    -- define variable type of ram, which is a 2d array. 
    type memory is array( (2 ** c) - 1 downto 0) of std_logic_vector(w-1 downto 0);
    
    -- create an instance from memory type
    signal rom: memory :=(
		5 => "0101",
		6 => "1010",
		7 => "0101",
		8 => "1010",
		9 => "1100",
		10 => "0011",
		others => "0000"
	 );
    
  begin
    process(clk, rst)
      begin
		
			if (rst = '0') then
				for i in 0 to ( (2 ** c) - 1) loop
					rom(i) <= (others => '0');
				end loop;
			end if;
        
        if (clk'event and clk = '1') then
				if (rd = '1') then
					data_out <= rom(to_integer(unsigned(addr)));
				end if;
        end if;
        
        
      end process;
      
end behaviour;