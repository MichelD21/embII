-- 4 bit ripple carry incrementer

library ieee;
	use ieee.std_logic_1164.all;

entity inc4_Rip is 
	port (	
		input     : in std_logic_vector(3 downto 0);
        carry_in  : in std_logic;
		result    : out std_logic_vector(3 downto 0);
        carry_out : out std_logic
    );
end inc4_Rip;

architecture dataflow of inc4_RIP is
signal partial_result : std_logic_vector(3 downto 0);
signal and0 : std_logic;
signal and1 : std_logic;
signal and2 : std_logic;
signal and3 : std_logic;

begin
    and0 <= input(0) and carry_in;
    and1 <= and0 and input(1);
    and2 <= and1 and input(2);
    and3 <= and2 and input(3);
    
    partial_result(0) <= carry_in xor input(0);
    partial_result(1) <= and0 xor input(1);
    partial_result(2) <= and1 xor input(2);
    partial_result(3) <= and2 xor input(3);
    
    result <= partial_result;
end dataflow;
