library ieee;
	use ieee.std_logic_1164.all;
	use work.root_package.all;
	
-- square register, being reseted with value 4 (16 bits)
entity reg_square is
	port (
			d		: in std_logic_vector(15 downto 0);
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic_vector(15 downto 0)
		);
end reg_square;

architecture structural of reg_square is

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
	-- from bits 3 to 15
	reg_inst: for i in 3 to 15 generate
		ffd_inst: FFD_reset
			port map(
				d		=> d(i),
				reset	=> reset,
				enable	=> enable,
				clock	=> clock,
				q		=> q(i)
				);
	end generate;
    
    -- bit 2
    bit_2: FFD_set
        port map(
            d		=> d(2),
            set	    => reset,
            enable	=> enable,
            clock	=> clock,
            q		=> q(2)
            ); 
          
    -- bit 1
    bit_1: FFD_reset
        port map(
            d		=> d(1),
            reset	=> reset,
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
	