----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:27:16 09/14/2020 
-- Design Name: 
-- Module Name:    CAM - Behavioral 
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

entity CAM is
	generic (
		w : integer := 8; -- width of each data word
		c : integer := 4 -- width of address, i.e. log(#cells)
		);
	
	port (
		clk : in std_logic; -- memory clock
		rst : in std_logic; -- reset signal. if set to 0, it will assign content of each cell its address.
		
		wr : in std_logic; -- signal to write data_in in memory, if data_in isn't already there.
		rd : in std_logic; -- signal to read address of data_in from memory.
		
		data_in : in std_logic_vector(w - 1 downto 0); -- input data
		hit_out : out std_logic; -- indicates whether a data was found in memory or not
		addr_out : out std_logic_vector(c - 1 downto 0) -- address of the found data in memory
		);
end CAM;

architecture Behavioral of CAM is
	-- define variable type of ram, which is a 2d array. 
    type memory is array( (2 ** c) - 1 downto 0) of std_logic_vector(w-1 downto 0);
    
    -- create an instance from memory type
    signal cam: memory;
	 
	 -- writeptr is where each new data is going to be written in
	 signal writeptr : integer := 0;
	 
	 -- hit_out internal signal
	 signal hit_internal : std_logic := '0';

begin
	process (clk, rst)
	
	begin
		if (rst = '0') then
			for i in 0 to ( (2 ** c) - 1 ) loop
				cam(i) <= std_logic_vector(to_unsigned(i, w));
			end loop;
		end if;
		
		if (clk'event and clk = '1') then
			if (wr = '1') then
				hit_internal <= '0';
				for i in 0 to ( (2 ** c) - 1) loop
					if (cam(i) = data_in) then
						hit_internal <= '1';
						addr_out <= std_logic_vector(to_unsigned(i, c));
						exit;
					end if;
				end loop;
				
				if (hit_internal = '0') then
					cam(writeptr) <= data_in;
					
					writeptr <= writeptr + 1;
					if (writeptr = ( (2 ** c) - 1)) then 
						writeptr <= 0;
					end if;
					
				end if;
			end if;
			
			else if (rd = '1') then
				hit_internal <= '0';
				for i in 0 to ( (2 ** c) - 1) loop
					if (cam(i) = data_in) then
						hit_internal <= '1';
						addr_out <= std_logic_vector(to_unsigned(i, c));
						exit;
					end if;
				end loop;
				
			end if;
			
			hit_out <= hit_internal;
			
		end if;
			
	end process;



end Behavioral;

