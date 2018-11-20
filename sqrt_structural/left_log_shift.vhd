library ieee;
	use ieee.std_logic_1164.all;
    
entity left_log_shift is
	port (
        inp_8bits	    : in std_logic_vector(7 downto 0);
        out_16bits	    : out std_logic_vector(15 downto 0)
	);
end left_log_shift;

architecture structural of left_log_shift is
	signal shifted_in : std_logic_vector(15 downto 0);

begin
	shifted_in(8 downto 1) <= inp_8bits;
    shifted_in(15 downto 9) <= (others => '0');
    shifted_in(0) <= '0';
    
	out_16bits <= shifted_in;
    
end structural;
	
