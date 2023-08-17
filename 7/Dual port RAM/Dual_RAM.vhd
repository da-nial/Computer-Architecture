----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:01:10 09/14/2020 
-- Design Name: 
-- Module Name:    Dual_RAM - Behavioral 
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



entity Dual_RAM is
  generic(
    w : INTEGER := 4; -- width of each data word
    c : INTEGER := 4 -- log2 of number of cells in memory. i.e. number of bits needed to address cells of memory.
  );
  
  port (
    clk : in std_logic; -- system clock
    rd : in std_logic; -- read signal
    wr : in std_logic; -- write signal
    rst : in std_logic; -- reset signal. write in each cell of memory its address
    
    addr_rd : in std_logic_vector(c-1 downto 0); -- address to read
    addr_wr : in std_logic_vector(c-1 downto 0); -- address to write
    
    data_in : in std_logic_vector(w-1 downto 0);
    data_out : out std_logic_vector(w-1 downto 0)
    
  );
end entity;
  
  architecture behaviour of Dual_RAM is
    
    -- define variable type of ram, which is a 2d array. 
    type memory is array( (2 ** c) - 1 downto 0) of std_logic_vector(w-1 downto 0);
    
    -- create an instance from memory type
    signal ram: memory;
    
  begin
    process(clk, rst)
      begin
        
        if(rst = '0') then
          for i in 0 to ( (2 ** c) - 1 ) loop
            ram(i) <= std_logic_vector(to_unsigned(i, w));
          end loop;
        end if;
        
        if (clk'event and clk = '1') then
          if (wr = '1') then
            ram(to_integer(unsigned(addr_wr))) <= data_in;
			 end if;
          if (rd = '1') then
            data_out <= ram(to_integer(unsigned(addr_rd)));
          end if;
        end if;
        
        
      end process;
      
end behaviour;