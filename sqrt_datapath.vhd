library ieee;
    use ieee.std_logic_1164.all;
	--use work.Add1Rip_package.all;
	--use work.Adder_package.all;
    
entity sqrt_datapath is
    port(
        input           : in std_logic_vector(15 downto 0);
        clock           : in std_logic;
        inputen_reset   : in std_logic;
        regsen_ready    : in std_logic;
        data_diff       : out std_logic;
        root            : out std_logic_vector(7 downto 0)
    );
end sqrt_datapath;

architecture structural of sqrt_datapath is
    signal square_sum_res       : std_logic_vector(15 downto 0);
    signal square_sum_cout      : std_logic;
    
    signal comp_out             : std_logic;
    
    signal input_reg_q          : std_logic_vector(15 downto 0);
    signal square_reg_q         : std_logic_vector(15 downto 0);
    signal root_reg_q           : std_logic_vector(7 downto 0);
    signal drt_reg_q            : std_logic_vector(7 downto 0);
    signal incremented_drt      : std_logic_vector(7 downto 0);
    
    signal shifted_drt          : std_logic_vector(15 downto 0);
    signal or_out               : std_logic;
    
begin
    input_register: entity work.reg_input
        port map(
			d		=> input,
			reset	=> '0',
			enable	=> inputen_reset,
			clock   => clock,
			q		=> input_reg_q
		);
        
    
    square_register: entity work.reg_square
        port map(
			d		=> square_sum_res,
			reset	=> inputen_reset,
			enable	=> regsen_ready,
			clock	=> clock,
			q		=> square_reg_q
		); 
    
    root_register: entity work.reg_root
        port map(
            d		=> drt_reg_q,
            reset	=> inputen_reset,
            enable	=> regsen_ready,
            clock	=> clock,
            q		=> root_reg_q
        );
    
    drt_register: entity work.reg_drt
        port map(
            d		=> incremented_drt,
            reset	=> inputen_reset,
            enable	=> regsen_ready,
            clock	=> clock,
            q		=> drt_reg_q
        );
    --------------------------------------------------------------
    -- 8 bit Ripple-LookAhead incrementer
    drt_increment: entity work.inc8_la_rip
        port map(
            A       => drt_reg_q,
            S       => incremented_drt,
            Cout    => open
        );
        
    -- 8 bit Ripple incrementer
    --drt_increment: entity work.inc8_Rip
    --    port map(
    --        A       => drt_reg_q,
    --        S       => incremented_drt,
    --        Cout    => open
    --    );
    
    -- 16 bit Ripple-LookAhead adder
    square_adder: entity work.adder16_la_rip
        port map(
            A       => shifted_drt, 
            B       => square_reg_q,
            Cin     => '1',
            S       => square_sum_res,
            Cout    => square_sum_cout
        );
        
    -- OLD
    ---------------------------------------------------------------
    -- 8 bit Ripple carry adder
    --drt_adder: entity work.Adder
    --    generic map(
    --        ADDER_WIDTH => 8
    --   )
    --    port map(
    --        input0    => x"01",
    --        input1    => drt_reg_q,
    --        carry_in  => '0',
    --        result    => incremented_drt,	
    --        carry_out => open                       -- missing
    --    );
    
    -- 16 bit Ripple carry adder
    --square_adder: entity work.Adder
    --    generic map(
    --        ADDER_WIDTH => 16
    --    )
    --    port map(
    --        input0    => shifted_drt,
    --        input1    => square_reg_q,
    --        carry_in  => '1',
    --        result    => square_sum_res,
    --        carry_out => square_sum_cout
    --    );
    --------------------------------------------------------------
    
    shifter: entity work.left_log_shift
        port map(
            inp_8bits   => drt_reg_q,
            out_16bits  => shifted_drt
        );
        
    comparator: entity work.comp
        port map(
			A		=> input_reg_q,
			B		=> square_sum_res,
			AltB	=> comp_out
		);
    
    or_1b : entity work.or_1bit
        port map(
            inp1    => square_sum_cout,
            inp2    => comp_out,
            outp    => or_out
        );
        
    data_diff   <= or_out;
    root        <= root_reg_q;
    
end structural;
