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
      
    S(0) <= NOT A(0);
    S(1) <= A(1) XOR (A(0));
    S(2) <= A(2) XOR (A(0) AND A(1));
    S(3) <= A(3) XOR (A(0) AND A(1) AND A(2));
	S(4) <= A(4) XOR (A(0) AND A(1) AND A(2) AND A(3));
	S(5) <= A(5) XOR (A(0) AND A(1) AND A(2) AND A(3) AND A(4));
	S(6) <= A(6) XOR (A(0) AND A(1) AND A(2) AND A(3) AND A(4) AND A(5));
	S(7) <= A(7) XOR (A(0) AND A(1) AND A(2) AND A(3) AND A(4) AND A(5) AND A(6));
    
	Cout <= A(0) AND A(1) AND A(2) AND A(3) AND A(4) AND A(5) AND A(6) AND A(7);
    
end dataflow;
