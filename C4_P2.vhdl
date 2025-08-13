

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

        SW : in std_logic_vector(3 downto 0), 
        HEX0 : out std_logic_vector(7 downto 0),
        HEX1 : out std_logic_vector(7 downto 0),

    ); 


architecture Behavioral of C4M1P2 is 

    begin 



 