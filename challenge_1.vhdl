LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity AAC2M2P1 is
    port (
        CP  : in std_logic;                       -- Clock
        SR  : in std_logic;                       -- Active low, synchronous reset
        P   : in std_logic_vector(3 downto 0);    -- Parallel input
        PE  : in std_logic;                       -- Parallel Enable (Load)
        CEP : in std_logic;                       -- Count enable parallel input
        CET : in std_logic;                       -- Count enable trickle input
        Q   : out std_logic_vector(3 downto 0);   -- Output
        TC  : out std_logic                       -- Terminal Count
    );
end AAC2M2P1;

architecture Behavioral of AAC2M2P1 is
    signal count : unsigned(3 downto 0) := (others => '0');
begin

    process(CP)
    begin
        if rising_edge(CP) then
            if SR = '0' then
                count <= (others => '0');
            elsif PE = '0' then
                count <= unsigned(P);
            elsif CET = '1' and CEP = '1' then
                count <= count + 1;
            end if;
        end if;
    end process;

    Q <= std_logic_vector(count);

    TC <= '1' when (CET = '1' and CEP = '1' and count = to_unsigned(15, 4)) else '0';

end Behavioral;