library ieee;
	use ieee.std_logic_1164.all;
	
package root_package is

	component FFD_set is
		port (
			d		: in std_logic;
			set		: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
	end component;
	
	component FFD_rst is
		port (
			d		: in std_logic;
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
		
	component reg_input is
		port (
			d		: in std_logic_vector(15 downto 0);
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic_vector(15 downto 0)
		);
		
	component comp is
		port (
			A		: in std_logic_vector(15 downto 0);
			B		: in std_logic_vector(15 downto 0);
			AltB	: out std_logic
		);
	