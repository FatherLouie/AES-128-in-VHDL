library ieee;
use ieee.std_logic_1164.all;

entity Testbench is
end entity;

architecture arch of Testbench is
signal inp, key, outp: std_logic_vector(127 downto 0) := (others => '0');

component aes is
	port (i, key: in std_logic_vector(127 downto 0);
			y: out std_logic_vector(127 downto 0));
end component;

begin
	
	inp_and_key: process is
	begin
		inp <= x"00000000000000000000000000000000";
		key <= x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
		wait for 20 ns;
		inp <= x"0123456789ABCDEF0123456789ABCDEF";
		key <= x"00000000000000000000000000000000";
		wait for 20 ns;
		inp <= x"BADBED25715713AA07463186705EE420";
		key <= x"F4930D856AC906784E4E4860B3217CC5";
		wait for 20 ns;
		inp <= x"544F4E20776E69546F656E772020656F";
		key <= x"67204675204B756E73206D7954686174";
		wait for 20 ns;
	end process;

	uut: aes
		port map(i => inp, key => key, y => outp);
	
end architecture;
	
