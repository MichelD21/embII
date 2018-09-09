library ieee;
	use ieee.std_logic_1164.all;
	use work.root_package.all;
	
-- drt root register, being reseted with value 2 (8 bits)
entity reg_drt is
	port (
			d		: in std_logic_vector(7 downto 0);
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic_vector(7 downto 0)
		);
end reg_drt;

architecture structural of reg_drt is

	component FFD_reset is
		port (
			d		: in std_logic;
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
	end component;
    
    component FFD_set is
		port (
			d		: in std_logic;
			set	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
	end component;
	
begin
	-- from bits 2 to 7
	reg_inst: for i in 2 to 7 generate
		ffd_inst: FFD_reset
			port map(
				d		=> d(i),
				reset	=> reset,
				enable	=> enable,
				clock	=> clock,
				q		=> q(i)
				);
	end generate;
    
    -- bit 1
    bit_1: FFD_set
        port map(
            d		=> d(1),
            set	    => reset,
            enable	=> enable,
            clock	=> clock,
            q		=> q(1)
            ); 
          
    -- bit 0
    bit_0: FFD_reset
        port map(
            d		=> d(0),
            reset	=> reset,
            enable	=> enable,
            clock	=> clock,
            q		=> q(0)
            );
end structural;
	