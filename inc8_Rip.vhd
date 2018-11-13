-- 8 bit ripple carry incrementer
-- Uses: half_adder
library ieee;
	use ieee.std_logic_1164.all;

entity inc8_Rip is 
	port (	
		A     : in std_logic_vector(7 downto 0);
		S    : out std_logic_vector(7 downto 0);
        Cout : out std_logic
    );
end inc8_Rip;

architecture dataflow of inc8_Rip is
signal cout_ha0 : std_logic;
signal cout_ha1 : std_logic;
signal cout_ha2 : std_logic;
signal cout_ha3 : std_logic;
signal cout_ha4 : std_logic;
signal cout_ha5 : std_logic;
signal cout_ha6 : std_logic;

begin
    HA0: entity work.half_adder
        port map(
            A => A(0),
            B => '1',
            S =>  S(0),
            Cout => cout_ha0
        );
        
    HA1: entity work.half_adder
        port map(
            A => A(1),
            B => cout_ha0,
            S => S(1),
            Cout => cout_ha1
        );
        
    HA2: entity work.half_adder
        port map(
            A => A(2),
            B => cout_ha1,
            S =>  S(2),
            Cout => cout_ha2
        );
    
    HA3: entity work.half_adder
        port map(
            A => A(3),
            B => cout_ha2,
            S =>  S(3),
            Cout => cout_ha3
        );
    
    HA4: entity work.half_adder
        port map(
            A => A(4),
            B => cout_ha3,
            S =>  S(4),
            Cout => cout_ha4
        );
    
    HA5: entity work.half_adder
        port map(
            A => A(5),
            B => cout_ha4,
            S =>  S(5),
            Cout => cout_ha5
        );
    
    HA6: entity work.half_adder
        port map(
            A => A(6),
            B => cout_ha5,
            S =>  S(6),
            Cout => cout_ha6
        );
    
    HA7: entity work.half_adder
        port map(
            A => A(7),
            B => cout_ha6,
            S =>  S(7),
            Cout => Cout
        );
        
end dataflow;
