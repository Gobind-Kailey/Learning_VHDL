LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std

ENTITY ALU IS
PORT( 
Op_code : IN STD_LOGIC_VECTOR( 2 DOWNTO 0 );
A, B : IN STD_LOGIC_VECTOR( 31 DOWNTO 0 );
Y : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 ) );
END ALU;

ARCHITECTURE Behavioral OF ALU IS
BEGIN 
process(A,B, Op_code) -- the process will run when either of the sensitivy list signals change. 

begin 
case Op_code is

when "000" => -- Gets value of A
	y <=A;
when "001" => -- Addition 
	Y <= std_logic_vector(unsigned(A) + unsigned(B));
when "010" => -- Subtraction
	Y <= std_logic_vector(unsigned(A) - unsigned(B));
when "011" => -- AND
	y <= A AND B; 
when "100" => -- OR
	y <= A OR B; 
when "101" => -- Increment A 
	Y <= std_logic_vector(unsigned(A) + 1);
when "110" => -- Decrement A 
	Y <= std_logic_vector(unsigned(A) - 1); 
when "111" => -- Gets value of B 
	y <= B; 
end case; 

end process; 

end Behavioral; 