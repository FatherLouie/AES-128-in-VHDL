library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity add_round_key is
	port (s, w: in std_logic_vector(127 downto 0);
			y: out std_logic_vector(127 downto 0));
end entity;

architecture struct of add_round_key is

begin
	col: for c in 0 to 3 generate
		gate: XOR_32 port map(a(31 downto 24) => s(8*c + 7 downto 8*c),
									 a(23 downto 16) => s(8*c + 39 downto 8*c + 32),
									 a(15 downto 8) => s(8*c + 71 downto 8*c + 64),
									 a(7 downto 0) => s(8*c + 103 downto 8*c+ 96),
									 b => w(32*c + 31 downto 32*c),
									 y(31 downto 24) => y(8*c + 7 downto 8*c),
									 y(23 downto 16) => y(8*c + 39 downto 8*c + 32),
									 y(15 downto 8) => y(8*c + 71 downto 8*c + 64),
									 y(7 downto 0) => y(8*c + 103 downto 8*c+ 96));
	end generate;
end architecture;
