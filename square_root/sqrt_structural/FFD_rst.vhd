library ieee;
	use ieee.std_logic_1164.all;

entity FFD_rst is
	port (
			d		: in std_logic;
			reset	: in std_logic;
			enable	: in std_logic;
			clock	: in std_logic;
			q		: out std_logic
		);
end FFD_rst;

architecture behavioral of FFD_rst is
		
	signal q_s	: std_logic;

begin
	FFD_proc	: process(reset, clock)
	begin
		-----------
		if (reset = '1') then		
			q_s	<= '0';
		elsif rising_edge(clock) then
			if (enable = '1') then
				q_s <= d;
			else
				q_s <= q_s;
			end if;
		--else
		--	q_s <= q_s;
		end if;
		-------------		
		--if enable = '1' then
		--	if reset = '1' then
		--		q_s <= '0';
		--	elsif clock = '1' then
		--		q_s <= d;
		--	else
		--		q_s <= q_s;
		--	end if;
		--else
		--	q_s <= q_s;
		--end if;

	end process;
	
	q <= q_s;

end behavioral;
	
