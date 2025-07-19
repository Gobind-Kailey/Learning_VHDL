LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 

ENTITY RAM128_32 IS
	PORT
	(
		address	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
		clock	: IN STD_LOGIC  := '1';
		data	: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
		wren	: IN STD_LOGIC;
		q	: OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
	);
END RAM128_32;

architecture Behavioral of RAM128_32 is
	type ram_type is array (0 to 127) of std_logic_vector(31 downto 0);
	signal memory : ram_type;
begin
	process(clock) 
	begin 
		if rising_edge(clock) then
			if wren = '1' then 
				memory(to_integer(unsigned(address))) <= data;
			end if;
		end if;
	end process;

	-- Asynchronous read
	q <= memory(to_integer(unsigned(address)));

end Behavioral;
