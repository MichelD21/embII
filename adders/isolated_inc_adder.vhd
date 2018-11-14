library ieee;
    use ieee.std_logic_1164.all;

entity isolated_inc_adder is
    port(
        clk : in std_logic;
        reset : in std_logic
    );
    
end isolated_inc_adder;

architecture structural of isolated_inc_adder is
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
        
    inc: entity work.Adder
        generic map(
            ADDER_WIDTH => 8
       )
        port map(
            input0    => x"01",
            input1    => reg_q,
            carry_in  => '0',
            result    => reg_d,	
            carry_out => open                       -- missing
        );
        
end structural;