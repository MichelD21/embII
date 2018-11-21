library ieee;
    use ieee.std_logic_1164.all;
	--use work.root_package.all;
	--use work.Add1Rip_package.all;
	--use work.Adder_package.all;

entity sqrt_TB is
end sqrt_TB;

architecture behavioral of sqrt_TB is
	
	--signal clock		: std_logic := '0';
	signal clk		: std_logic := '0';
	--signal reset_s	: std_logic;
	signal rst_n		: std_logic;
	--signal input		: std_logic_vector(15 downto 0) := "0000000000001001";
    --signal input		: std_logic_vector(15 downto 0) := x"0019"; -- 25 in decimal
    signal input		: std_logic_vector(15 downto 0) := x"04DB"; -- 1243 in decimal
	signal ready		: std_logic;
	signal root		    : std_logic_vector(7 downto 0);

begin
	--clock <= not clock after 5 ns; -- 100MHz
	clk <= not clk after 0.9090905 ns; -- 550 MHz
	--reset_s  <= '1', '0' after 400 ns;
	rst_n <= '1', '0' after 58 ns;
		
	DUV: entity work.sqrt_top
		port map	(
						--clock			=>	clock,
						--reset			=>	reset_s,
						clk			    =>	clk,
						reset			=>	rst_n,
						input			=>	input,
						ready			=>	ready,
						root			=> 	root
        );
	
	process
    begin
        --wait for 100 ns;
        wait;
        
    end process;
	
end behavioral;
