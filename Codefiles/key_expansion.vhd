library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.Gates.all;

entity key_expansion is
	port (key: in std_logic_vector(127 downto 0); w: out std_logic_vector(1407 downto 0)) ;
end key_expansion;

architecture struct of key_expansion is
type collection_32 is array (0 to 39) of std_logic_vector(31 downto 0);
type collection_2 is array (0 to 39) of std_logic_vector(1 downto 0);
signal temp0, temp1, temp2, temp3, temp4: collection_32 := (others => (others => '0'));
signal selv : collection_2 := (others => (others => '0'));
signal sel : std_logic_vector(40 downto 0) := (others => '0');
signal Rcon : std_logic_vector(319 downto 0) := (others => '0');
signal w_int : std_logic_vector(1407 downto 0);

component rot_word is
	port (i: in std_logic_vector(31 downto 0);
			y : out std_logic_vector(31 downto 0));
end component;
	
component sbox is
	port (b: in std_logic_vector(7 downto 0);
			y: out std_logic_vector(7 downto 0)) ;
end component;
 
component eight_mux is 
	port(a, b:in std_logic_vector(7 downto 0);
			s: in std_logic;
			y : out std_logic_vector(7 downto 0));
end component;

begin
	Rcon(24) <= '1';
	Rcon(57) <= '1';
	Rcon(90) <= '1';
	Rcon(123) <= '1';
	Rcon(156) <= '1';
	Rcon(189) <= '1';
	Rcon(222) <= '1';
	Rcon(255) <= '1';
	Rcon(287 downto 280) <= "00011011";
	Rcon(319 downto 312) <= "00110110";

	w_int(127 downto 0) <= key;

	expand : for i in 4 to 43 generate
		temp0(i-4) <= w_int(32*i-1 downto 32*(i-1));
		rot : rot_word port map(i => temp0(i-4), y => temp1(i-4));
		
		sbox1 : for j in 0 to 3 generate
			inst : sbox port map(b => temp1(i-4)(8*j+7 downto 8*j), y => temp2(i-4)(8*j+7 downto 8*j));
		end generate sbox1;
			
		xor0 : XOR_32 port map(a => temp2(i-4), b => Rcon(32*(i/4 - 1) + 31 downto 32*(i/4 - 1)), y => temp3(i-4));
		
		selv(i-4) <= std_logic_vector(to_unsigned(i mod 4, 2));
		sel(i-4) <= selv(i-4)(0) or selv(i-4)(1);

		xor_data : for j in 0 to 31 generate
			temp4(i-4)(j) <= ((not sel(i-4)) and temp3(i-4)(j)) or (sel(i-4) and temp0(i-4)(j));
		end generate;

		xor1 : XOR_32 port map(a => temp4(i-4), b => w_int(32*(i-4)+31 downto 32*(i-4)), y => w_int(32*i+31 downto 32*i));
	end generate expand;
	
	w <= w_int;
end architecture;
