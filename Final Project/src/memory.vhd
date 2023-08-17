library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity memory is
  generic(
    w : INTEGER := 16; -- width of each data word
    c : INTEGER := 12 -- log2 of number of cells in memory. i.e. number of bits needed to address cells of memory.
  );
  
  port (
    clk : in std_logic; -- clock
    rd : in std_logic; -- read signal
    wr : in std_logic; -- write signal
    rst : in std_logic; -- reset signal. if set to 1, write in each cell of memory its address
    
    addr : in std_logic_vector(c-1 downto 0); -- address to write/read
    
    data_in : in std_logic_vector(w-1 downto 0);
    data_out : out std_logic_vector(w-1 downto 0)
  );
end entity;
  
  architecture behaviour of memory is
    
    -- define variable type of memory, which is a 2d array. 
    type memory_block is array( (2 ** c) - 1 downto 0) of std_logic_vector(w-1 downto 0);
    
    -- create an instance from memory type
    signal memory: memory_block;
    
    
  begin
      memory(0) <= "0010000000001010"; -- load block 10
      memory(1) <= "0001000000010100"; -- add block 20
      memory(2) <= "0011000000011110"; -- store to block 30
    
     memory(10) <= "0000000000000001"; -- block 10 value: 1
     memory(20) <= "0000000000000010"; -- block 20 value: 2
     
    process(clk)
      begin
        if (clk'event and clk = '1') then
        
          if(rst = '1') then -- active high
            for i in 0 to ( (2 ** c) - 1 ) loop
              memory(i) <= std_logic_vector(to_unsigned(i, w));
            end loop;
          end if;
          
          if (rd = '1') then
              data_out <= memory(to_integer(unsigned(addr)));
          elsif (wr = '1') then
              memory(to_integer(unsigned(addr))) <= data_in;
          end if;
          
          
        end if;
        
      end process;
    
end behaviour;