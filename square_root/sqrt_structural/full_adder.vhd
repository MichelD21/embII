library ieee;
	use ieee.std_logic_1164.all;

entity full_adder is 
	port (	
		input0    : in std_logic;
		input1    : in std_logic;
		carry_in  : in std_logic;
		result    : out std_logic;
		carry_out : out std_logic
	);
end full_adder;

architecture dataflow of full_adder is

begin

	result  <= input0 xor input1 xor carry_in;
	carry_out <= (input0 and carry_in) or (input1 and carry_in) or (input0 and input1);

end dataflow;
