library ieee;
use ieee.std_logic_1164.all;

entity aes is
	port (i, key: in std_logic_vector(127 downto 0);
			y: out std_logic_vector(127 downto 0));
end entity;

architecture struct of aes is
component key_expansion is
	port (key: in std_logic_vector(127 downto 0); w: out std_logic_vector(1407 downto 0)) ;
end component;

component cipher is
	port (i: in std_logic_vector(127 downto 0);
			w: in std_logic_vector(1407 downto 0);
			y: out std_logic_vector(127 downto 0));
end component;

signal word: std_logic_vector(1407 downto 0);

begin
	key_expand: key_expansion port map(key => key, w => word);
	encrypt: cipher port map(i => i, w => word, y => y);
end architecture;
