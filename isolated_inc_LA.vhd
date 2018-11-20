library ieee;
    use ieee.std_logic_1164.all;

entity isolated_inc_LA is
    port(
        clk : in std_logic;
        reset : in std_logic;
        output : out std_logic_vector(7 downto 0)
    );
    
end isolated_inc_LA;

architecture structural of isolated_inc_LA is
signal reg_q : std_logic_vector(7 downto 0);
signal reg_d : std_logic_vector(7 downto 0);
begin

    reg: entity work.reg_root
        port map(
            d => reg_d,
            reset => reset,
            enable => '1',
            clock => clk,
            q => reg_q
        );
        
    inc: entity work.inc8_la
        port map(
            A => reg_q,
            S => reg_d,
            Cout => open
        );
        
    output <= reg_q;
end structural;
