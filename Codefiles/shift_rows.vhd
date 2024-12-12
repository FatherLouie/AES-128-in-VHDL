library ieee;
use ieee.std_logic_1164.all;

entity shift_rows is
	port(i: in std_logic_vector(127 downto 0); y: out std_logic_vector(127 downto 0));
end entity;

architecture struct of shift_rows is
signal t, v: std_logic_vector(7 downto 0);
signal u: std_logic_vector(15 downto 0);
signal outp: std_logic_vector(127 downto 0);

begin
	t <= i(39 downto 32);
	u <= i(79 downto 64);
	v <= i(127 downto 120);
	
	outp(31 downto 0) <= i(31 downto 0);
	outp(55 downto 32) <= i(63 downto 40);
	outp(63 downto 56) <= t;
	outp(79 downto 64) <= i(95 downto 80);
	outp(95 downto 80) <= u;
	outp(103 downto 96) <= v;
	outp(127 downto 104) <= i(119 downto 96);
	
	y <= outp;
end architecture;
