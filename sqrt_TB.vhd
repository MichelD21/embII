library ieee;
    use ieee.std_logic_1164.all;
	use work.root_package.all;
	use work.Add1Rip_package.all;
	use work.Adder_package.all;

entity sqrt_TB is
end sqrt_TB;

architecture Structure of sqrt_TB is
	
	signal clock		: std_logic := '0';
	signal reset_s		: std_logic;
	signal input		: std_logic_vector(15 downto 0) := "0000000000001001";
	signal ready		: std_logic;
	signal root			: std_logic_vector(7 downto 0);
	
	component sqrt_top
		port (
			clock			: in std_logic;
			reset			: in std_logic;
			input			: in std_logic_vector(15 downto 0);
			ready			: out std_logic;
			root			: out std_logic_vector(7 downto 0)
		);
	end component;
	
begin

	clock <= not clock after 5 ns; -- 100MHz
	reset_s  <= '1', '0' after 400 ns;
		
	sqrt_inst: sqrt_top
		port map	(
						clock			=>	clock,
						reset			=>	reset_s,
						input			=>	input,
						ready			=>	ready,
						root			=> 	root
					);
	
	process
    begin
      
        wait;
        
    end process;
	
	
end Structure;