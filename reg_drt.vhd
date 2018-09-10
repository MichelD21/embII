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

	signal d_s		: std_logic_vector(7 downto 0);
	signal q_s		: std_logic_vector(7 downto 0);

	component FFD_rst is
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
			set		: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
	end component;
	
begin
	-- from bits 2 to 7
	reg_inst: for i in 2 to 7 generate
		ffd_inst: FFD_rst
			port map(
				d		=> d_s(i),
				reset	=> reset,
				enable	=> enable,
				clock	=> clock,
				q		=> q_s(i)
				);
	end generate;
    
    -- bit 1
    bit_1: FFD_set
        port map(
            d		=> d_s(1),
            set	    => reset,
            enable	=> enable,
            clock	=> clock,
            q		=> q_s(1)
            ); 
          
    -- bit 0
    bit_0: FFD_rst
        port map(
            d		=> d_s(0),
            reset	=> reset,
            enable	=> enable,
            clock	=> clock,
            q		=> q_s(0)
            );
			
	q <= q_s;
	
end structural;
	