library ieee;
	use ieee.std_logic_1164.all;
	use work.root_package.all;

entity FFD_set is
	port (
			d		: in std_logic;
			set		: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
end FFD_set;

architecture behavioral of FFD_set is
		
	signal q_s	: std_logic;

begin
	FFD_proc	: process(set, clock)
	begin
		if (set = '1') then
			q_s	<= '1';
		elsif rising_edge(clock) then
			if (enable = '1') then
				q_s <= d;
			else
				q_s <= q_s;
			end if;
		else
			q_s <= q_s;
		end if;
	end process;
	
	q <= q_s;

end behavioral;
	