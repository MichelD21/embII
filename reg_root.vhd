library ieee;
	use ieee.std_logic_1164.all;
	use work.root_package.all;
	
entity reg_root is
	port (
			d		: in std_logic_vector(7 downto 0);
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic_vector(7 downto 0)
		);
end reg_root;

architecture structural of reg_root is

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
	
	reg_inst: for i in 0 to 7 generate
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
	