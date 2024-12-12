library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.xtimes.all;

entity mix_columns is
	port(i: in std_logic_vector(127 downto 0); y: out std_logic_vector(127 downto 0));
end entity;

architecture struct of mix_columns is
type collection is array (0 to 3) of std_logic_vector(7 downto 0);

signal s_0c, s_1c, s_2c, s_3c: collection;
signal s_0c2, s_1c2, s_2c2, s_3c2: collection;
signal s_0c3, s_1c3, s_2c3, s_3c3: collection;
signal t0, t1, t2, t3, t4, t5, t6, t7: collection;

begin
	col: for c in 0 to 3 generate
		s_0c(c) <= i(c*8 + 7 downto c*8);
		s_1c(c) <= i(c*8 + 39 downto c*8 + 32);
		s_2c(c) <= i(c*8 + 71 downto c*8 + 64);
		s_3c(c) <= i(c*8 + 103 downto c*8 + 96);

		thr0: times_three port map(a => s_0c(c), y => s_0c3(c));
		thr1: times_three port map(a => s_1c(c), y => s_1c3(c));
		thr2: times_three port map(a => s_2c(c), y => s_2c3(c));
		thr3: times_three port map(a => s_3c(c), y => s_3c3(c));
		two0: times_two port map(a => s_0c(c), y => s_0c2(c));
		two1: times_two port map(a => s_1c(c), y => s_1c2(c));
		two2: times_two port map(a => s_2c(c), y => s_2c2(c));
		two3: times_two port map(a => s_3c(c), y => s_3c2(c));

		xor0: XOR_8 port map(a => s_0c2(c), b => s_1c3(c), y => t0(c));
		xor1: XOR_8 port map(a => s_2c(c), b => s_3c(c), y => t1(c));
		xor2: XOR_8 port map(a => t0(c), b => t1(c), y => y(c*8 + 7 downto c*8));

		xor3: XOR_8 port map(a => s_1c2(c), b => s_2c3(c), y => t2(c));
		xor4: XOR_8 port map(a => s_0c(c), b => s_3c(c), y => t3(c));
		xor5: XOR_8 port map(a => t2(c), b => t3(c), y => y(c*8 + 39 downto c*8 + 32));

		xor6: XOR_8 port map(a => s_2c2(c), b => s_3c3(c), y => t4(c));
		xor7: XOR_8 port map(a => s_1c(c), b => s_0c(c), y => t5(c));
		xor8: XOR_8 port map(a => t4(c), b => t5(c), y => y(c*8 + 71 downto c*8 + 64));

		xor9: XOR_8 port map(a => s_0c3(c), b => s_3c2(c), y => t6(c));
		xor10: XOR_8 port map(a => s_2c(c), b => s_1c(c), y => t7(c));
		xor11: XOR_8 port map(a => t6(c), b => t7(c), y => y(c*8 + 103 downto c*8 + 96));
	end generate;
end architecture;