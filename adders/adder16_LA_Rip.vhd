-- Joins four 4-bit carry lookahead adders by rippling a carry signal between the blocks
-- Uses: adder4_la
library IEEE;
    use IEEE.STD_LOGIC_1164.all;

entity adder16_la_rip is
    Port(   
            A : in std_logic_vector(15 downto 0);
            B : in std_logic_vector(15 downto 0);
            Cin : in std_logic;
            --
            S : out std_logic_vector(15 downto 0);
            Cout : out std_logic);
end adder16_la_rip;

architecture structural of adder16_la_rip is
signal adder0_cout : std_logic;
signal adder1_cout : std_logic;
signal adder2_cout : std_logic;

begin
    adder0: entity work.adder4_la
        port map(
            A   => A(3 downto 0),
            B   => B(3 downto 0),
            Cin => Cin,
            
            S    => S(3 downto 0),
            Cout => adder0_cout
        );
            
    adder1: entity work.adder4_la
        port map(
            A   => A(7 downto 4),
            B   => B(7 downto 4),
            Cin => adder0_cout,
            
            S    => S(7 downto 4),
            Cout => adder1_cout
        );
    
    adder2: entity work.adder4_la
        port map(
            A   => A(11 downto 8),
            B   => B(11 downto 8),
            Cin => adder1_cout,
            
            S    => S(11 downto 8),
            Cout => adder2_cout
        );
            
    adder3: entity work.adder4_la
        port map(
            A   => A(15 downto 9),
            B   => B(15 downto 9),
            Cin => adder2_cout,
            
            S    => S(15 downto 9),
            Cout => Cout
        );
end structural;
