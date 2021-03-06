library ieee;
	use ieee.std_logic_1164.all;

entity adder_rip is 
	generic(ADDER_WIDTH : INTEGER := 8);
	port (
		input0    : in std_logic_vector(ADDER_WIDTH - 1 downto 0);
		input1    : in std_logic_vector(ADDER_WIDTH - 1 downto 0);
		carry_in  : in std_logic;
		result    : out std_logic_vector(ADDER_WIDTH - 1 downto 0);
		carry_out : out std_logic
        );
end adder_rip;

architecture dataflow of adder_rip is
	
	component full_adder is
		port (	
			input0    : in std_logic;
			input1    : in std_logic;
			carry_in  : in std_logic;
			result    : out std_logic;
			carry_out : out std_logic
		);
	end component;
	
	signal sig_carry_in	:   std_logic_vector(ADDER_WIDTH downto 0);

begin

	sig_carry_in(0) <= carry_in;

	adder : for i in 0 to ADDER_WIDTH - 1 generate
		bit_adder : full_adder
			port map (
				input0    => input0(i),
				input1    => input1(i),
				carry_in  => sig_carry_in(i),
				result    => result(i),
				carry_out => sig_carry_in(i + 1)
			);
	end generate;

	carry_out <= sig_carry_in(ADDER_WIDTH);

end dataflow;
