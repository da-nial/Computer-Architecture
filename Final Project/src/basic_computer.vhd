library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity basic_computer is
  port(
    clk: in  STD_LOGIC
  );
end basic_computer;

architecture DATAFLOW of basic_computer is
  component counter 
    port (
		clk     : in  std_logic; -- clock of the system
		clr     : in  std_logic; -- clear, if set to 1, count wll be set to 0 in the next rising edge of the clock.
		inr     : in std_logic; -- increment, if set to 1, count will be incremented in the next rising edge of the clock.
		
		count : out std_logic_vector(3 downto 0)
	);
	end component;
	
	
	component decoder3to8
    port(
      din: in std_logic_vector(2 downto 0);
      dout: out std_logic_vector(7 downto 0)
    );
  end component;
  
	
	component decoder4to16
	  port(
      din: in std_logic_vector(3 downto 0);
      dout: out std_logic_vector(15 downto 0)
  );
  end component;
  
  
  component Reg12bit
    PORT ( 
     CLK    : IN STD_LOGIC ;
     CLEAR  : IN STD_LOGIC ;
     INC    : IN STD_LOGIC ;
     LOAD   : IN STD_LOGIC ;
     input  : IN std_logic_vector (11 DOWNTO 0) ;  
     output : OUT std_logic_vector (11 DOWNTO 0) := (others => '0')  
  );  
  end component;
  
  component Reg16bit
    PORT ( 
     CLK    : IN STD_LOGIC ;
     CLEAR  : IN STD_LOGIC ;
     INC    : IN STD_LOGIC ;
     LOAD   : IN STD_LOGIC ;
     input  : IN std_logic_vector (15 DOWNTO 0) ;  
     output : OUT std_logic_vector (15 DOWNTO 0) := (others => '0')  
  );  
  end component;
  
  
  component encoder8to3
    port(
    din : in STD_LOGIC_VECTOR(7 downto 0);
    dout : out STD_LOGIC_VECTOR(2 downto 0)
  );
  end component;
  
  component mux8to1 
    port(
      din0      : in  std_logic_vector(15 downto 0);
      din1      : in  std_logic_vector(15 downto 0);
      din2      : in  std_logic_vector(15 downto 0);
      din3      : in  std_logic_vector(15 downto 0);
      din4      : in  std_logic_vector(15 downto 0);
      din5      : in  std_logic_vector(15 downto 0);
      din6      : in  std_logic_vector(15 downto 0);
      din7      : in  std_logic_vector(15 downto 0);
       
      sel     : in  std_logic_vector(2 downto 0);
       
      dout       : out std_logic_vector(15 downto 0)
    );
  end component;
    
  
  component ALU 
	port(
    	command         : in std_logic ;
  	inputA , inputB : in std_logic_vector(15 downto 0);
  	carryin         : in std_logic;
  	result          : out std_logic_vector(15 downto 0)
);
  end component;
  
  
  component memory
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
  end component memory;
  
  -- constants
  constant MEMORY_WIDTH : integer := 16;
  constant ADDRESS_WIDTH : integer := 12;
	
	 
	signal SC_CLR : std_logic := '0';
	signal SC_COUNT : std_logic_vector(3 downto 0) := "0000";
	
	signal T : std_logic_vector(15 downto 0) := (others => '0');
	
	signal CMN_BUS : std_logic_vector(15 downto 0) := (others => '0');
	
	signal AR_LD : std_logic := '0';
	signal AR_OUT : std_logic_vector(11 downto 0) := (others => '0');
	
	signal PC_INC : std_logic := '0';
	signal PC_OUT : std_logic_vector(11 downto 0) := (others => '0');
	
	signal DR_LD : std_logic := '0';
	signal DR_out : std_logic_vector(15 downto 0) := (others => '0');

 	signal AC_LD : std_logic := '0';
 	signal AC_CLR : std_logic := '0';
	signal AC_out : std_logic_vector(15 downto 0) := (others => '0');	
	
	signal IR_LD : std_logic := '0';
	signal IR_out : std_logic_vector(15 downto 0) := (others => '0');
	
	signal D : std_logic_vector(7 downto 0);
	signal I : std_logic := '0'; -- Specifies whether the addressing method is Direct or Indirect.
	
	
	signal X : std_logic_vector(7 downto 0);
	
 	signal S : std_logic_vector(2 downto 0);
	
	signal ALU_COMMAND : std_logic := '0';
	signal ALU_RESULT : std_logic_vector(15 downto 0) := (others => '0');
	
	
	signal MM_OUT : std_logic_vector(15 downto 0);
	signal MM_RD : std_logic;
	signal MM_WR : std_logic;
	
	
begin
  sequence_counter: counter port map(clk => clk, clr => SC_CLR, inr => '1', count => SC_COUNT);
  sc_decoder : decoder4to16 port map(din => sc_count, dout => T);
  
  AR : Reg12bit port map(clk => clk, clear => '0', inc => '0', load => AR_LD, input => CMN_BUS(11 downto 0), output =>  AR_OUT);
  PC : Reg12bit port map(clk => clk, clear => '0', inc => PC_INC, load =>  '0', input => CMN_BUS(11 downto 0), output =>  PC_out);
    
  DR : Reg16bit port map(clk => clk, clear => '0', inc => '0', load => DR_LD, input => CMN_BUS, output =>  DR_OUT);
  AC : Reg16bit port map(clk => clk, clear => AC_CLR, inc => '0', load => AC_LD, input => ALU_RESULT, output =>  AC_OUT);
  
  IR : Reg16bit port map(clk => clk, clear => '0', inc => '0', load => IR_LD, input => CMN_BUS, output =>  IR_OUT);

    
  IR_decoder : decoder3to8 port map(din => IR_OUT(14 downto 12), dout => D);
  
  I <= IR_OUT(15);

  ALU_IN : ALU port map (command => ALU_COMMAND , inputA => DR_OUT , inputB => AC_OUT , carryin => '0' , result => ALU_RESULT);
  
  ALU_COMMAND <= ( T(4) and D(1) and (not I)) or
                 ( T(5) and D(1) and I) or
                 ( T(5) and D(2) and (not I)) or
                 ( T(6) and D(2) and I);
  
  AR_LD <= T(0) or
         ( T(3) and D(1) and I) or 
         ( T(3) and D(2) and I) or 
         ( T(3) and D(3) and I);
         
  
  DR_LD <= ( T(3) and D(1) and (not I) ) or
           ( T(4) and D(1) and I) or
           ( T(3) and D(2) and (not I) ) or
           ( T(4) and D(2) and I);
  
  AC_LD <= ( T(4) and D(1) and (not I) ) or
           ( T(5) and D(1) and I) or
           ( T(5) and D(2) and (not I) ) or
           ( T(6) and D(2) and I);
           
  IR_LD <= T(1);
  
  
  SC_CLR <= ( T(4) and D(1) and (not I) ) or
            ( T(5) and D(1) and I) or
            ( T(5) and D(2) and (not I)) or
            ( T(6) and D(2) and I) or
            ( T(3) and D(3) and (not I)) or
            ( T(4) and D(3) and I); 
  
  AC_CLR <= ( T(4) and D(2) and (not I)) or
            ( T(5) and D(2) and I); 
            
  
  PC_INC <= T(1);
  
  
  
  X(0) <= '0';
  X(1) <= '0';
  X(2) <= T(0);
  X(3) <= '0';
  X(4) <= ( T(3) and D(3) and (not I)) or
          ( T(4) and D(3) and I);
  X(5) <= T(2);
  X(6) <= '0';
  X(7) <= T(1) or
          ( T(3) and D(1) and (not I)) or
          ( T(3) and D(1) and I) or
          ( T(4) and D(1) and I) or
          ( T(3) and D(2) and (not I)) or
          ( T(3) and D(2) and I) or
          ( T(4) and D(2) and I) or
          ( T(3) and D(3) and I);
  
  
  X_to_S_encoder : encoder8to3 port map(din => X, dout => S);
   
  bus_mux : mux8to1 port map(din0 => (others => '0'),
                             din1(15 downto 12) => "0000",
			     din1(11 downto 0)  => AR_OUT, 
                             din2(15 downto 12) => "0000",
			     din2(11 downto 0)  => PC_OUT, 
                             din3 => DR_OUT,
                             din4 => AC_OUT,
                             din5 => IR_OUT,
                             din6 => (others => '0'),
                             din7 => MM_OUT,
                             sel => S,
                             dout => CMN_BUS
                            );
  
  MM : memory generic map(w=> MEMORY_WIDTH, c => ADDRESS_WIDTH)
                  port map(clk => clk,
                           rd => MM_RD,
                           wr => MM_WR,
                           rst => '0',
                           addr => AR_OUT,
                           data_in => CMN_BUS,
                           data_out => MM_OUT
                  );
                  
  MM_RD <= T(1) or
          ( T(3) and D(1) and (not I)) or
          ( (T(3) or T(4)) and D(1) and I) or
          ( T(3) and D(2) and (not I)) or
          ( (T(3) or T(4)) and D(2) and I) or
          ( T(3) and D(2) and (not I)); 
      
      
  MM_WR <= ( T(3) and D(3) and (not I)) or
           ( T(4) and D(3) and I);
           
  
end DATAFLOW;