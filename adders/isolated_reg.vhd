-- Isolated register to test its maximum frequency

library ieee;
    use ieee.std_logic_1164.all;

entity isolated_reg is
    port(
        clk : in std_logic;
        reset : in std_logic;
        output : out std_logic_vector(7 downto 0)
    );
    
end isolated_reg;

architecture structural of isolated_reg is
signal reg_wire : std_logic_vector(7 downto 0);

begin
    reg: entity work.reg_root
        port map(
            d => reg_wire,
            reset => reset,
            enable => '1',
            clock => clk,
            q => reg_wire
        );
        
        output <= reg_wire;
end structural;