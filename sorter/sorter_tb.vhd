library IEEE;
use IEEE.std_logic_1164.all;
use work.sorter_pkg.all;

entity sorter_tb is
end sorter_tb;

architecture tb of sorter_tb is

	signal A_s		: input_type;
	signal rst_s	: std_logic := '1';
	signal clk_s	: std_logic := '0';
	signal G_s		: input_type;
	signal rdy_s	: std_logic;
	
	component sorter
	port (
			A_i		: in input_type;
			rst		: in std_logic;
			clk		: in std_logic;
			G_o		: out input_type;
			rdy_o	: out std_logic
		);
	end component;
	
begin

	clk_s <= not clk_s after 5 ns;

	DUV: entity work.sorter
        port map (
            A_i         => A_s,
            rst         => rst_s,
            clk			=> clk_s,
            G_o      	=> G_s, 
            rdy_o		=> rdy_s
        );
		
	process
	begin
	
		A_s(0) <= x"0001";
		A_s(1) <= x"0002";
		A_s(2) <= x"0003";
		A_s(3) <= x"0004";
		A_s(4) <= x"0005";
		A_s(5) <= x"0006";
		A_s(6) <= x"0007";
		A_s(7) <= x"0008";
		A_s(8) <= x"0009";
		A_s(9) <= x"000A";
		
		wait for 15 ns;
		
		rst_s <= '0';
		
		wait for 20 ns;
		
		A_s(0) <= x"FFFF";
		A_s(1) <= x"FFFE";
		A_s(2) <= x"FFFD";
		A_s(3) <= x"FFFC";
		A_s(4) <= x"FFFB";
		A_s(5) <= x"FFFA";
		A_s(6) <= x"FFF9";
		A_s(7) <= x"FFF8";
		A_s(8) <= x"FFF7";
		A_s(9) <= x"FFF6";
		rst_s <= '1';
		
		wait for 20 ns;
		
		rst_s <= '0';
		
		wait;
		
	end process;
	
end tb;