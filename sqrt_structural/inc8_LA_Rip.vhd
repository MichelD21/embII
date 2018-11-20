-- 8 bit Lookahead incrementer
-- uses: inc4_la
library ieee;
	use ieee.std_logic_1164.all;

entity inc8_la_rip is
    port(
        A : in std_logic_vector(7 downto 0);
        -- 
        S : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
    
end inc8_la_rip;

architecture structural of inc8_la_rip is
signal inc_lo_cout: std_logic; 
begin
    inc_lo : entity work.inc4_la
        port map(
            input => A(3 downto 0),
            carry_in => '1',
            result => S(3 downto 0),
            carry_out => inc_lo_cout
        );
    
    inc_hi : entity work.inc4_la
        port map(
            input => A(7 downto 4),
            carry_in => inc_lo_cout,
            result => S(7 downto 4),
            carry_out => Cout
        );
        
end structural;
    
    