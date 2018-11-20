-- 4 bit Lookahead incrementer

library ieee;
	use ieee.std_logic_1164.all;

entity inc4_la is 
	port (	
		input     : in std_logic_vector(3 downto 0);
        carry_in  : in std_logic;
		result    : out std_logic_vector(3 downto 0);
        carry_out : out std_logic
    );
end inc4_la;

architecture dataflow of inc4_la is

begin
      
    result(0) <= input(0) XOR carry_in;
    result(1) <= input(1) XOR (carry_in AND input(0));
    result(2) <= input(2) XOR (carry_in AND input(0) AND input(1));
    result(3) <= input(3) XOR (carry_in AND input(0) AND input(1) AND input(2));
    carry_out <= carry_in AND input(0) AND input(1) AND input(2) AND input(3);
    
end dataflow;
