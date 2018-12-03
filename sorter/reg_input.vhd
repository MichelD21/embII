library ieee;
	use ieee.std_logic_1164.all;
	
entity reg_input is
	port (
			d		: in std_logic_vector(15 downto 0);
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic_vector(15 downto 0)
		);
end reg_input;

architecture structural of reg_input is

	component FFD_rst is
		port (
			d		: in std_logic;
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
	end component;
	
begin
	
	reg_inst: for i in 0 to 15 generate
		ffd_inst: FFD_rst
			port map(
				d		=> d(i),
				reset	=> reset,
				enable	=> enable,
				clock	=> clock,
				q		=> q(i)
				);
	end generate;

end structural;
	
