library ieee;
use ieee.std_logic_1164.all;

entity cipher is
	port (i: in std_logic_vector(127 downto 0);
			w: in std_logic_vector(1407 downto 0);
			y: out std_logic_vector(127 downto 0));
end entity;

architecture arch of cipher is

component add_round_key is
	port (s, w: in std_logic_vector(127 downto 0);
			y: out std_logic_vector(127 downto 0));
end component;

component sbox is
	port (b: in std_logic_vector(7 downto 0);
			y: out std_logic_vector(7 downto 0)) ;
end component;

component shift_rows is
	port(i: in std_logic_vector(127 downto 0); y: out std_logic_vector(127 downto 0));
end component;

component mix_columns is
	port(i: in std_logic_vector(127 downto 0); y: out std_logic_vector(127 downto 0));
end component;

type collection is array (0 to 9) of std_logic_vector(127 downto 0);
signal s0, s5, s6, s7: std_logic_vector(127 downto 0) := (others => '0');
signal s1, s2, s3, s4: collection := (others => (others => '0'));

begin
	reorganize: for j in 0 to 15 generate
		s0(8*j + 7 downto 8*j) <= i(8*(15-j) + 7 downto 8*(15-j));
	end generate reorganize;
	
	comp0: add_round_key port map(s => s0, w => w(127 downto 0), y => s1(0));
	
	rep: for i in 1 to 9 generate
		comp1: for j in 0 to 15 generate
			comp10: sbox port map(b => s1(i-1)(8*j + 7 downto 8*j), y => s2(i-1)(8*j + 7 downto 8*j));
		end generate comp1;
		
		comp2: shift_rows port map(i => s2(i-1), y => s3(i-1));
		comp3: mix_columns port map(i => s3(i-1), y => s4(i-1));
		comp4: add_round_key port map(s => s4(i-1), w => w(128*i + 127 downto 128*i), y => s1(i));
	end generate rep;
	
	comp5: for j in 0 to 15 generate
			comp50: sbox port map(b => s1(9)(8*j + 7 downto 8*j), y => s5(8*j + 7 downto 8*j));
	end generate comp5;
	
	comp6: shift_rows port map(i => s5, y => s6);
	comp7: add_round_key port map(s => s6, w => w(128*10 + 127 downto 128*10), y => s7);
	
	y <= s7;
end architecture;
