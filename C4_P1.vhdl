LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

/*
HEX1 and HEX0 displays the values from SW(7-0) 

HEX0 - SW(3-0)
HEX1 - SW(7-4)

I should be able to display 0 - 9

1010 and 1111 are dont care's 

Requirements: 

Aync code 


*/


entity C4M1P1 is 
    port (
        -- Below are signals 
        HEX0 : out std_logic_vector(6 downto 0);
        HEX1 : out std_logic_vector(6 downto 0); 
                
        SW : in std_logic_vector(7 downto 0); 
    
        


    ); 

end C4M1P1; 

architecture Behavioral of C4M1P1 is 
    -- Declaring constants in advance for neatness. 
    constant SEG_0     : std_logic_vector(6 downto 0) := "1000000";
    constant SEG_1     : std_logic_vector(6 downto 0) := "1111001";
    constant SEG_2     : std_logic_vector(6 downto 0) := "0100100";
    constant SEG_3     : std_logic_vector(6 downto 0) := "0110000";
    constant SEG_4     : std_logic_vector(6 downto 0) := "0011001";
    constant SEG_5     : std_logic_vector(6 downto 0) := "0010010";
    constant SEG_6     : std_logic_vector(6 downto 0) := "0000010";
    constant SEG_7     : std_logic_vector(6 downto 0) := "1111000";
    constant SEG_8     : std_logic_vector(6 downto 0) := "0000000";
    constant SEG_9     : std_logic_vector(6 downto 0) := "0010000";
    constant SEG_BLANK : std_logic_vector(6 downto 0) := "1111111";


    BEGIN
    -- Note that VHDL uses () not []
    -- Comparing is with "=" not "==" in VHDL
    -- When assinging use := not = - that is comparison 
    -- Use := inside a process block 
    -- "1000000" lights up 0 (segment a..g: on, on, on, on, on, on, off).
    -- Note that in the above statement it reads right to left 
    process(SW)
         -- HEX0 handles SW(3 downto 0)
    process(SW)
    begin
        case SW(3 downto 0) is
            when "0000" => HEX0 <= SEG_0;
            when "0001" => HEX0 <= SEG_1;
            when "0010" => HEX0 <= SEG_2;
            when "0011" => HEX0 <= SEG_3;
            when "0100" => HEX0 <= SEG_4;
            when "0101" => HEX0 <= SEG_5;
            when "0110" => HEX0 <= SEG_6;
            when "0111" => HEX0 <= SEG_7;
            when "1000" => HEX0 <= SEG_8;
            when "1001" => HEX0 <= SEG_9;
            when others => HEX0 <= SEG_BLANK; -- invalid → blank
        end case;
    end process;

    -- HEX1 handles SW(7 downto 4)
    process(SW)
    begin
        case SW(7 downto 4) is
            when "0000" => HEX1 <= SEG_0;
            when "0001" => HEX1 <= SEG_1;
            when "0010" => HEX1 <= SEG_2;
            when "0011" => HEX1 <= SEG_3;
            when "0100" => HEX1 <= SEG_4;
            when "0101" => HEX1 <= SEG_5;
            when "0110" => HEX1 <= SEG_6;
            when "0111" => HEX1 <= SEG_7;
            when "1000" => HEX1 <= SEG_8;
            when "1001" => HEX1 <= SEG_9;
            when others => HEX1 <= SEG_BLANK; -- invalid → blank
        end case;
    end process;
end Behavioral;