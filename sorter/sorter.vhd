library ieee;
	use ieee.std_logic_1164.all;
	use work.sorter_pkg.all;
	
entity sorter is
	port (
			A_i		: in input_type;
			rst		: in std_logic;
			clk		: in std_logic;
			G_o		: out input_type;
			rdy_o	: out std_logic
		);
end sorter;

architecture structural of sorter is
	
signal B_s : input_type;
signal C_s : input_type;
signal D_s : input_type;
signal E_s : input_type;
signal F_s : input_type;

signal rst_s : std_logic;
signal rdy_s : std_logic;
signal not_rdy : std_logic;
signal even_odd : std_logic;
signal odd_even : std_logic;
signal step_rdy : std_logic;
signal swap_rdy : std_logic;
signal AltB : std_logic_vector(4 downto 0);
signal not_AltB : std_logic_vector(4 downto 0);
signal AeqB : std_logic_vector(4 downto 0);
signal not_AeqB : std_logic_vector(4 downto 0);

	
begin
	
	rst_inst: entity work.FFD_rst
		port map (
			d		=> rst,
			reset	=> '0',
			enable	=> '1',
			clock	=> clk,
			q		=> rst_s
		);
	
	odd_even_inst: entity work.FFD_rst
		port map (
			d		=> odd_even,
			reset	=> rst_s,
			enable	=> not_rdy,
			clock	=> clk,
			q		=> even_odd
		);
		
	step_inst: entity work.FFD_rst
		port map (
			d		=> '1',
			reset	=> rst_s,
			enable	=> not_rdy,
			clock	=> clk,
			q		=> step_rdy
		);

	reg_inst: for k in 0 to 9 generate
		input_register: entity work.reg_input
			port map(
				d		=> B_s(k),
				reset	=> '0',
				enable	=> '1',
				clock   => clk,
				q		=> C_s(k)
				);
	end generate;
	
	comp_inst_0: entity work.comp
		port map(
			A		=> D_s(1),
			B		=> D_s(0),
			AltB	=> AltB(0),
			AeqB	=> AeqB(0)
			);
	comp_inst_1: entity work.comp
		port map(
			A		=> D_s(3),
			B		=> D_s(2),
			AltB	=> AltB(1),
			AeqB	=> AeqB(1)
			);	
	comp_inst_2: entity work.comp
		port map(
			A		=> D_s(5),
			B		=> D_s(4),
			AltB	=> AltB(2),
			AeqB	=> AeqB(2)
			);
	comp_inst_3: entity work.comp
		port map(
			A		=> D_s(7),
			B		=> D_s(6),
			AltB	=> AltB(3),
			AeqB	=> AeqB(3)
			);
	comp_inst_4: entity work.comp
		port map(
			A		=> D_s(9),
			B		=> D_s(8),
			AltB	=> AltB(4),
			AeqB	=> AeqB(4)
			);
    
B_s			<= A_i when rst_s = '1' else F_s;

D_s(0)		<= C_s(0);
D_s(1)		<= C_s(9) when even_odd = '0' else C_s(1);
D_s(2)		<= C_s(1) when even_odd = '0' else C_s(3);
D_s(3)		<= C_s(2);
D_s(4)		<= C_s(3) when even_odd = '0' else C_s(5);
D_s(5)		<= C_s(4);
D_s(6)		<= C_s(5) when even_odd = '0' else C_s(7);
D_s(7)		<= C_s(6);
D_s(8)		<= C_s(7) when even_odd = '0' else C_s(9);
D_s(9)		<= C_s(8);

E_s(0)		<= C_s(0) when AltB(0) = '0' else D_s(1);
E_s(1)		<= C_s(1) when ( AltB(1) and odd_even ) = '0' else C_s(2);
E_s(2)		<= C_s(2) when ( AltB(1) and odd_even ) = '0' else C_s(1);
E_s(3)		<= C_s(3) when ( AltB(2) and odd_even ) = '0' else C_s(4);
E_s(4)		<= C_s(4) when ( AltB(2) and odd_even ) = '0' else C_s(3);
E_s(5)		<= C_s(5) when ( AltB(3) and odd_even ) = '0' else C_s(6);
E_s(6)		<= C_s(6) when ( AltB(3) and odd_even ) = '0' else C_s(5);
E_s(7)		<= C_s(7) when ( AltB(4) and odd_even ) = '0' else C_s(8);
E_s(8)		<= C_s(8) when ( AltB(4) and odd_even ) = '0' else C_s(7);
E_s(9)		<= C_s(9) when ( AltB(0) and odd_even ) = '0' else C_s(0);

F_s(0)		<= E_s(0);
F_s(1)		<= E_s(1) when ( AltB(0) and even_odd ) = '0' else C_s(0);
F_s(2)		<= E_s(2) when ( not_AltB(1) and even_odd and not_AeqB(1) ) = '0' else C_s(3);
F_s(3)		<= E_s(3) when ( not_AltB(1) and even_odd and not_AeqB(1) ) = '0' else C_s(2);
F_s(4)		<= E_s(4) when ( not_AltB(2) and even_odd and not_AeqB(2) ) = '0' else C_s(5);
F_s(5)		<= E_s(5) when ( not_AltB(2) and even_odd and not_AeqB(2) ) = '0' else C_s(4);
F_s(6)		<= E_s(6) when ( not_AltB(3) and even_odd and not_AeqB(3) ) = '0' else C_s(7);
F_s(7)		<= E_s(7) when ( not_AltB(3) and even_odd and not_AeqB(3) ) = '0' else C_s(6);
F_s(8)		<= E_s(8) when ( not_AltB(4) and even_odd and not_AeqB(4) ) = '0' else C_s(9);
F_s(9)		<= E_s(9) when ( not_AltB(4) and even_odd and not_AeqB(4) ) = '0' else C_s(8);

not_AeqB <= not AeqB;
not_AltB <= not AltB;
not_rdy <= not rdy_s;
odd_even <= not even_odd;

swap_rdy <= not ( AltB(0) or (AltB(1) and odd_even) or (AltB(2) and odd_even) or (AltB(3) and odd_even) or (AltB(4) and odd_even) or (not_AltB(1) and even_odd and not_AeqB(1)) or (not_AltB(2) and even_odd and not_AeqB(2)) or (not_AltB(3) and even_odd and not_AeqB(3)) or (not_AltB(4) and even_odd and not_AeqB(4)) );
rdy_s <= step_rdy and swap_rdy;

rdy_o <= rdy_s;
G_o	<= F_s;

end structural;