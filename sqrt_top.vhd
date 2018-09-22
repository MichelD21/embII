library ieee;
    use ieee.std_logic_1164.all;
	--use work.Add1Rip_package.all;
	--use work.Adder_package.all;
	
entity sqrt_top is

	port (
		--clock			: in std_logic;
		clk			: in std_logic;
		reset			: in std_logic;
		input			: in std_logic_vector(15 downto 0);
		ready			: out std_logic;
		root			: out std_logic_vector(7 downto 0)
		);
end sqrt_top;

architecture Structure of sqrt_top is
	
	signal regsen_ready_s	: std_logic;
	signal inputen_reset_s	: std_logic;
	signal data_diff_s	: std_logic;
	
	begin
	
	data_path: entity work.sqrt_datapath
		port map(
			input           => input,
			--clock           => clock,
			clock		=> clk,			
			inputen_reset   => inputen_reset_s,
			regsen_ready    => regsen_ready_s,
			data_diff       => data_diff_s,
			root            => root
		);
	
	ctrl_path: entity work.sqrt_ctrlpath
		port map(
			--clock			=> clock,
			clock			=> clk,
			reset			=> reset,
			diff			=> data_diff_s,
			regsen_ready	=> regsen_ready_s,
			inputen_reset	=> inputen_reset_s
		);
		
	ready <= regsen_ready_s;
		
end Structure;
