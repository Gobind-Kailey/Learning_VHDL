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
    
    BEGIN
    -- Note that VHDL uses () not []
    -- Comparing is with "=" not "==" in VHDL
    -- When assinging use := not = - that is comparison 
    -- Use := inside a process block 
    -- "1000000" lights up 0 (segment a..g: on, on, on, on, on, on, off).
    -- Note that in the above statement it reads right to left 
    process(SW)
        begin
        -- Display 0 
        if (SW(3 downto 0) = "0000") then
            HEX0 <= "1000000"; -- Active low for "0"
        
        -- Display 1
        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 0 AND SW(3) = 1)
        HEX0 <= "1111100";  

        -- Display 2
        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 1 AND SW(3) = 0)
        HEX0 <= "0100100";  

        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 0 AND SW(3) = 1)
        HEX0 <= "1000000";  

        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 0 AND SW(3) = 1)
        HEX0 <= "1000000"; 

        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 0 AND SW(3) = 1)
        HEX0 <= "1000000";  

        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 0 AND SW(3) = 1)
        HEX0 <= "1000000";  

        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 0 AND SW(3) = 1)
        HEX0 <= "1000000";  

        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 0 AND SW(3) = 1)
        HEX0 <= "1000000"; 

        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 0 AND SW(3) = 1)
        HEX0 <= "1000000";  

        elsif (SW(0) = 0 AND SW(1) = 0 AND SW(2) = 0 AND SW(3) = 1)
        HEX0 <= "1000000";  

        else
            HEX0 <= "1111111"; -- all off (blank)

        end if; 
    end process
    end Behavioral; 

