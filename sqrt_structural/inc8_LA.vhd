-- 8 bit Lookahead incrementer

library ieee;
	use ieee.std_logic_1164.all;

entity inc8_la is 
	port (	
		A     : in std_logic_vector(7 downto 0);
		S    : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
end inc8_la;

architecture dataflow of inc8_la is

begin
      
    result(0) <= NOT input(0);
    result(1) <= input(1) XOR (input(0));
    result(2) <= input(2) XOR (input(0) AND input(1));
    result(3) <= input(3) XOR (input(0) AND input(1) AND input(2));
	result(4) <= input(4) XOR (input(0) AND input(1) AND input(2) AND input(3));
	result(5) <= input(5) XOR (input(0) AND input(1) AND input(2) AND input(3) AND input(4));
	result(6) <= input(6) XOR (input(0) AND input(1) AND input(2) AND input(3) AND input(4) AND input(5));
	result(7) <= input(7) XOR (input(0) AND input(1) AND input(2) AND input(3) AND input(4) AND input(5) AND input(6));
    
	carry_out <= input(0) AND input(1) AND input(2) AND input(3) AND input(4) AND input(5) AND input(6) AND input(7);
    
end dataflow;
