

/*

Converts a four-bit binary number V = v3v2v1v0 into a two-digit decimal equivalent D = d1d0. 
For example, if the input (V = 1111), then we would get 15 as the output in the 7-segment display. 
Use a comparator to check when the value of V is greater than 9, 
and use the output of this comparator in the control of the 7-segment displays. 


*/ 


Library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity C4M1P2 is 
    port(

        SW : in std_logic_vector(3 downto 0); 
        HEX0 : out std_logic_vector(6 downto 0);
        HEX1 : out std_logic_vector(6 downto 0);
        Z : out std_logic -- dont input ; here


    ); 
end entity;

architecture Behavioral of C4M1P2 is 



    constant SEG_0 : std_logic_vector(6 downto 0) := "1000000"; 
    constant SEG_1 : std_logic_vector(6 downto 0) := "1111001"; 
    constant SEG_2 : std_logic_vector(6 downto 0) := "0100100";
    constant SEG_3 : std_logic_vector(6 downto 0) := "0110000";
    constant SEG_4 : std_logic_vector(6 downto 0) := "0011001";
    constant SEG_5 : std_logic_vector(6 downto 0) := "0010010";
    constant SEG_6 : std_logic_vector(6 downto 0) := "0000010";
    constant SEG_7 : std_logic_vector(6 downto 0) := "1111000";
    constant SEG_8 : std_logic_vector(6 downto 0) := "0000000";
    constant SEG_9 : std_logic_vector(6 downto 0) := "0010000"; 



    
    begin 
        

        Z <= '1' when unsigned(SW) > 9 else '0';
        process(SW)
				begin 
            HEX1 <= SEG_0; 

            case SW(3 downto 0) is 
                -- CNRL I for copilet 
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

                when "1010" => 
                    HEX1 <= SEG_1; 
                    HEX0 <= SEG_0; -- Displays 10

                when "1011" => 
                    HEX1 <= SEG_1; 
                    HEX0 <= SEG_1; -- 11 ... 

                when "1100" => 
                    HEX1 <= SEG_1;
                    HEX0 <= SEG_2;

                when "1101" =>
                    HEX1 <= SEG_1; 
                    HEX0 <= SEG_3;

                when "1110" => 
                    HEX1 <= SEG_1; 
                    HEX0 <= SEG_4;

                when "1111" => 
                HEX1 <= SEG_1; 
                HEX0 <= SEG_5;

            end case; 
        end process; 
    end Behavioral;
                
        
        
            -- z <= (v3v2v1v0 = "1010"); 


 

 