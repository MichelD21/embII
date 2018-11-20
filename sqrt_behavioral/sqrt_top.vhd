library ieee;
    use ieee.std_logic_1164.all;
    use IEEE.numeric_std.all;
	
entity sqrt_top is

	port (
		--clock			: in std_logic;
		clk			    : in std_logic;
		reset			: in std_logic;
		input			: in std_logic_vector(15 downto 0);
		ready			: out std_logic;
		root			: out std_logic_vector(7 downto 0)
		);
end sqrt_top;

architecture behavioral of sqrt_top is
    type StateType is (ST_IDLE, ST_OP, ST_READY);
	signal current_state            : 	StateType;
    -- registers
    signal root_reg, drt_root_reg   : unsigned(7 downto 0);
    signal input_reg, square_reg    : unsigned(15 downto 0);
    -- control signal
    signal diff                     : std_logic;

begin
    -- Control
    process(clk, reset)
    begin
       if rising_edge(clk) then
            if reset = '1' then
                current_state <= ST_IDLE;
            else
                current_state <= current_state;
            end if;
            
            case current_state is
                when ST_IDLE =>
                    root_reg <= x"00";
                    drt_root_reg <= x"02";
                    square_reg <= x"0004";
                    input_reg <= unsigned(input);
                    current_state <= ST_OP;
                
                when ST_OP =>
                    root_reg <= drt_root_reg;
                    square_reg <= square_reg + ("0000000" & shift_left(('0' & drt_root_reg),1)) + 1;
                    drt_root_reg <= drt_root_reg + 1;
                    
                    if diff = '1' then
                        current_state <= ST_READY;
                    else
                        current_state <= ST_OP;
                    end if;
                    
                when ST_READY =>
                    current_state <= ST_READY;
            end case;
            
        end if;
    end process;
    
    -- RTL
    process(clk)
    begin
        if rising_edge(clk) then
            case current_state is
                when ST_IDLE =>
                    root_reg <= x"00";
                    drt_root_reg <= x"02";
                    square_reg <= x"0004";
                    input_reg <= unsigned(input);
                
                when ST_OP =>
                    root_reg <= drt_root_reg;
                    square_reg <= square_reg + ("0000000" & shift_left(('0' & drt_root_reg),1)) + 1;
                    drt_root_reg <= drt_root_reg + 1;
                    
                when others =>
                    null;
            end case;
        end if;
    end process;
    
    -- connection signal
    diff <= '1' when square_reg >= input_reg else '0';  
    -- outputs
    ready <= '0' when current_state = ST_READY else '1';
    root <= std_logic_vector(root_reg);
    
end behavioral;