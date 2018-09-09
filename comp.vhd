library ieee;
	use ieee.std_logic_1164.all;
	use work.root_package.all;

entity comp is
	port (
			A		: in std_logic_vector(15 downto 0);
			B		: in std_logic_vector(15 downto 0);
			AltB	: out std_logic
		);
end comp;

architecture structural of comp is

	signal notA		: std_logic_vector(15 downto 0);
	signal orGate	: std_logic_vector(15 downto 0);
	signal xnorAB	: std_logic_vector(14 downto 0);
	
begin
	
	notA_inst: for i in 0 to 15 generate
		notA(i) <= not A(i);
	end generate;
	
	xnorAB_inst: for i in 0 to 14 generate
		xnorAB(i) <= A(i+1) xnor B(i+1);
	end generate;
	
	orGate(15) <= notA(15) and B(15);
	orGate(14) <= notA(14) and B(14) and xnorAB(14);
	orGate(13) <= notA(13) and B(13) and xnorAB(14) and xnorAB(13);
	orGate(12) <= notA(12) and B(12) and xnorAB(14) and xnorAB(13) and xnorAB(12);
	orGate(11) <= notA(11) and B(11) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11);
	orGate(10) <= notA(10) and B(10) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10);
	orGate(9) <= notA(9) and B(9) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9);
	orGate(8) <= notA(8) and B(8) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9) and xnorAB(8);
	orGate(7) <= notA(7) and B(7) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9) and xnorAB(8) and xnorAB(7);
	orGate(6) <= notA(6) and B(6) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9) and xnorAB(8) and xnorAB(7) and xnorAB(6);
	orGate(5) <= notA(5) and B(5) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9) and xnorAB(8) and xnorAB(7) and xnorAB(6) and xnorAB(5);
	orGate(4) <= notA(4) and B(4) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9) and xnorAB(8) and xnorAB(7) and xnorAB(6) and xnorAB(5) and xnorAB(4);
	orGate(3) <= notA(3) and B(3) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9) and xnorAB(8) and xnorAB(7) and xnorAB(6) and xnorAB(5) and xnorAB(4) and xnorAB(3);
	orGate(2) <= notA(2) and B(2) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9) and xnorAB(8) and xnorAB(7) and xnorAB(6) and xnorAB(5) and xnorAB(4) and xnorAB(3) and xnorAB(2);
	orGate(1) <= notA(1) and B(1) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9) and xnorAB(8) and xnorAB(7) and xnorAB(6) and xnorAB(5) and xnorAB(4) and xnorAB(3) and xnorAB(2) and xnorAB(1);
	orGate(0) <= notA(0) and B(0) and xnorAB(14) and xnorAB(13) and xnorAB(12) and xnorAB(11) and xnorAB(10) and xnorAB(9) and xnorAB(8) and xnorAB(7) and xnorAB(6) and xnorAB(5) and xnorAB(4) and xnorAB(3) and xnorAB(2) and xnorAB(1) and xnorAB(0);
	
	AltB <= orGate(15) or orGate(14) or orGate(13) or orGate(12) or orGate(11) or orGate(10) or orGate(9) or orGate(8) or orGate(7) or orGate(6) or orGate(5) or orGate(4) or orGate(3) or orGate(2) or orGate(1) or orGate(0);

end structural;
	