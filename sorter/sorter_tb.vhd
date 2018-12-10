library IEEE;
use IEEE.std_logic_1164.all;
use work.sorter_pkg.all;

entity sorter_tb is
end sorter_tb;

architecture tb of sorter_tb is
    -- A
	signal A_s0		: std_logic_vector(15 downto 0);
	signal A_s1		: std_logic_vector(15 downto 0);
	signal A_s2		: std_logic_vector(15 downto 0);
	signal A_s3		: std_logic_vector(15 downto 0);
	signal A_s4		: std_logic_vector(15 downto 0);
	signal A_s5		: std_logic_vector(15 downto 0);
	signal A_s6		: std_logic_vector(15 downto 0);
	signal A_s7		: std_logic_vector(15 downto 0);
	signal A_s8		: std_logic_vector(15 downto 0);
	signal A_s9		: std_logic_vector(15 downto 0);
    -- G
	signal G_s0		: std_logic_vector(15 downto 0);
	signal G_s1		: std_logic_vector(15 downto 0);
	signal G_s2		: std_logic_vector(15 downto 0);
	signal G_s3		: std_logic_vector(15 downto 0);
	signal G_s4		: std_logic_vector(15 downto 0);
	signal G_s5		: std_logic_vector(15 downto 0);
	signal G_s6		: std_logic_vector(15 downto 0);
	signal G_s7		: std_logic_vector(15 downto 0);
	signal G_s8		: std_logic_vector(15 downto 0);
	signal G_s9		: std_logic_vector(15 downto 0);
    
	signal rdy_s	: std_logic;
    signal rst_s	: std_logic := '1';
	signal clk_s	: std_logic := '0';
	
	component sorter
	port (
            -- A
            A_i0		: in std_logic_vector(15 downto 0);
            A_i1		: in std_logic_vector(15 downto 0);
            A_i2		: in std_logic_vector(15 downto 0);
            A_i3		: in std_logic_vector(15 downto 0);
            A_i4		: in std_logic_vector(15 downto 0);
            A_i5		: in std_logic_vector(15 downto 0);
            A_i6		: in std_logic_vector(15 downto 0);
            A_i7		: in std_logic_vector(15 downto 0);
            A_i8		: in std_logic_vector(15 downto 0);
            A_i9		: in std_logic_vector(15 downto 0);
			-- G
			G_o0		: out std_logic_vector(15 downto 0);
            G_o1		: out std_logic_vector(15 downto 0);
            G_o2		: out std_logic_vector(15 downto 0);
            G_o3		: out std_logic_vector(15 downto 0);
            G_o4		: out std_logic_vector(15 downto 0);
            G_o5		: out std_logic_vector(15 downto 0);
            G_o6		: out std_logic_vector(15 downto 0);
            G_o7		: out std_logic_vector(15 downto 0);
            G_o8		: out std_logic_vector(15 downto 0);
            G_o9		: out std_logic_vector(15 downto 0);
            
			rdy_o	: out std_logic;
            rst		: in std_logic;
			clk		: in std_logic
		);
	end component;
	
begin

	clk_s <= not clk_s after 5 ns;

	DUV: entity work.sorter
        port map (
            A_i0         => A_s0,
            A_i1         => A_s1,
            A_i2         => A_s2,
            A_i3         => A_s3,
            A_i4         => A_s4,
            A_i5         => A_s5,
            A_i6         => A_s6,
            A_i7         => A_s7,
            A_i8         => A_s8,
            A_i9         => A_s9,
            
            G_o0      	=> G_s0,
            G_o1      	=> G_s1,
            G_o2      	=> G_s2,
            G_o3      	=> G_s3,
            G_o4      	=> G_s4,
            G_o5      	=> G_s5,
            G_o6      	=> G_s6,
            G_o7      	=> G_s7,
            G_o8      	=> G_s8,
            G_o9      	=> G_s9,
            
            rst         => rst_s,
            clk			=> clk_s,
            rdy_o		=> rdy_s
        );
		
	process
	begin
	
		A_s0 <= x"0001";
		A_s1 <= x"0002";
		A_s2 <= x"0003";
		A_s3 <= x"0004";
		A_s4 <= x"0005";
		A_s5 <= x"0006";
		A_s6 <= x"0007";
		A_s7 <= x"0008";
		A_s8 <= x"0009";
		A_s9 <= x"000A";
		
		wait for 15 ns;
		
		rst_s <= '0';
		
		wait for 20 ns;
		
		A_s0 <= x"FFFF";
		A_s1 <= x"FFFE";
		A_s2 <= x"FFFD";
		A_s3 <= x"FFFC";
		A_s4 <= x"FFFB";
		A_s5 <= x"FFFA";
		A_s6 <= x"FFF9";
		A_s7 <= x"FFF8";
		A_s8 <= x"FFF7";
		A_s9 <= x"FFF6";
		rst_s <= '1';
		
		wait for 20 ns;
		
		rst_s <= '0';
		
		wait;
		
	end process;
	
end tb;