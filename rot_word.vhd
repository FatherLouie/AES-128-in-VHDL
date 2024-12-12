library ieee;
use ieee.std_logic_1164.all;

entity rot_word is
	port (i: in std_logic_vector(31 downto 0); y: out std_logic_vector(31 downto 0));
end entity;

architecture struct of rot_word is
signal outp: std_logic_vector(31 downto 0);

begin
	outp(31 downto 8) <= i(23 downto 0);
	outp(7 downto 0) <= i(31 downto 24);
	y <= outp;
end architecture;
