library ieee;
	use ieee.std_logic_1164.all;
	use work.root_package.all;
    
    
entity or_1bit is
	port (
        inp1	    : in std_logic;
        inp2	    : in std_logic;
        outp	    : out std_logic
	);
end or_1bit;

architecture structural of or_1bit is
	signal or_sig : std_logic;

begin
    or_sig <= inp1 or inp2;
	outp <= or_sig;
end structural;
	