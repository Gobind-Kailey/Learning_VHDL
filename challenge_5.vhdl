library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FIFO8x9 is
   port(
      clk, rst:		in std_logic;
      RdPtrClr, WrPtrClr:	in std_logic;    
      RdInc, WrInc:	in std_logic;
      DataIn:	 in std_logic_vector(8 downto 0);
      DataOut: out std_logic_vector(8 downto 0);
      rden, wren: in std_logic
	);
end entity FIFO8x9;

architecture RTL of FIFO8x9 is
	--signal declarations
	type fifo_array is array(7 downto 0) of std_logic_vector(8 downto 0);  -- makes use of VHDLâs enumerated type
	signal fifo:  fifo_array;
	signal wrptr, rdptr: unsigned(2 downto 0):= (others => '0');
	signal en: std_logic_vector(7 downto 0);
	signal dmuxout: std_logic_vector(8 downto 0);

    begin -- Note that only one begin is allowed in an architecture
    -- rdptr <= "000"; -- initialize read pointer to 0
    -- wrptr <= "000"; -- initialize write pointer to 0

    DataOut <= fifo(to_integer(rdptr)) when rden = '1' else (others => 'Z');
    
    -- process declarations  
    process(clk, rst)
        begin -- typically state this after declarations are done in architecture
            if rising_edge(clk) then
                if rst = '1' then
                    wrptr <= (others => '0'); -- reset write pointer to 0
                    rdptr <= (others => '0'); -- reset read pointer to 0
                else
                    if wren = '1' then
                        fifo(to_integer(wrptr)) <= DataIn;
                    end if;
                end if;
                   
        
            
            if RdInc = '1' then
                rdptr <= rdptr + 1; -- increment read pointer
            end if;
            if WrInc = '1' then
                wrptr <= wrptr + 1; -- increment write pointer
            end if;  
            
            if RdPtrClr = '1' then 
                rdptr <= (others => '0'); -- I think this will reset the read pointer to point to first 
            end if;
            if WrPtrClr = '1' then 
                wrptr <= (others => '0'); -- I think this will reset the write pointer to point to first 
            end if;
	end if; 
    end process;  
end RTL; 


    
-- Note: you cannot use if statements in the architecture body, only in processes.