library ieee;
use ieee.std_logic_1164.all;

entity FSM is
port (
   In1: in std_logic;
   RST: in std_logic; 
   CLK: in std_logic;
   Out1 : inout std_logic);
end FSM;


architecture Behavioral of FSM is

	type state_type is (A,B,C); 
	signal current_state , next_state : state_type;

-- Create the Process (note that they run concurrrently) 
begin
	process(CLK)   
	begin
    	if rising_edge(CLK) then
        	if RST = '1' then
  	          current_state <= A;
      		else
            	  current_state <= next_state;
        	end if;
    	end if;
	end process;

-- Note that in the code below, even though the output setting and next state checking fall 
-- under case current_state, you want to place them in different process blocks 
process(current_state, In1)

    begin

	case current_state is
	when A =>
            if In1 = '1' then
                next_state <= B;
            else
                next_state <= A;
            end if;

        when B =>
            if In1 = '1' then
                next_state <= B;
            else
                next_state <= C;
            end if;

        when C =>
            if In1 = '1' then
                next_state <= A;
            else
                next_state <= C;
            end if;
	end case; 
end process; 
 
process(current_state)
begin
	case current_state is
	when A => Out1 <= '0'; 
	when B => Out1 <= '0';
	when C => Out1 <= '1';
	end case; 
end process; 

end Behavioral; 