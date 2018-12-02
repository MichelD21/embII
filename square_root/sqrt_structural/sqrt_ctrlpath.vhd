library ieee;
    use ieee.std_logic_1164.all;
	--use work.Add1Rip_package.all;
	--use work.Adder_package.all;

entity sqrt_ctrlpath is

	port (
        clock			: in std_logic;
        reset			: in std_logic;
        diff			: in std_logic;
        regsen_ready	: out std_logic;
        inputen_reset	: out std_logic
    );
end sqrt_ctrlpath;

architecture Structure of sqrt_ctrlpath is
	
	type State_type is (IDLE, OP, READY);
	signal currentState : 	State_type;
	
	begin
	
		process(clock)
			begin
			
				if rising_edge(clock) then
					case currentState is
					
						when IDLE =>
							if reset = '1' then
								currentState <= IDLE;
							else
								currentState <= OP;
							end if;
							
						when OP =>
							if reset = '0' then
								if diff = '1' then
									currentState <= READY;
								else
									currentState <= OP;
								end if;
							else
								currentState <= IDLE;
							end if;
							
						when READY =>
							if reset = '1' then
								currentState <= IDLE;
							else
								currentState <= READY;
							end if;
							
						when others =>
							currentState <= IDLE;
							
					end case;
				end if;
		end process;
	
	regsen_ready	<= '0' when currentState = READY else '1';
	inputen_reset	<= '1' when currentState = IDLE else '0';
		
end Structure;
