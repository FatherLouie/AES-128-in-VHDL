library ieee;
use ieee.std_logic_1164.all;


package xtimes is
	component times_two is
		port (a: in std_logic_vector(7 downto 0); y: out std_logic_vector(7 downto 0));
	end component;
	
	component times_three is
		port (a: in std_logic_vector(7 downto 0); y: out std_logic_vector(7 downto 0));
	end component;
end package;

------------------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity times_two is
	port (a: in std_logic_vector(7 downto 0); y: out std_logic_vector(7 downto 0));
end entity;

architecture struct of times_two is
signal outp: std_logic_vector(7 downto 0);

begin
	outp(7 downto 5) <= a(6 downto 4);
	outp(4) <= a(3) xor a(7);
	outp(3) <= a(2) xor a(7);
	outp(2) <= a(1);
	outp(1) <= a(0) xor a(7);
	outp(0) <= a(7);
	
	y <= outp;
end architecture;

---------------------------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity times_three is
	port (a: in std_logic_vector(7 downto 0); y: out std_logic_vector(7 downto 0));
end entity;

architecture struct of times_three is
signal t: std_logic_vector(7 downto 0);

component times_two is
	port (a: in std_logic_vector(7 downto 0); y: out std_logic_vector(7 downto 0));
end component;

begin
	two: times_two port map(a => a, y => t);
	one: XOR_8 port map(a => t, b => a, y => y);
end architecture;
