library ieee;
use ieee.std_logic_1164.all;

package muxes is
	component MUX_4x1 is
		port (i: in std_logic_vector(3 downto 0); s: in std_logic_vector(1 downto 0); y: out std_logic);
	end component;
	
	component MUX_8x1 is
		port (i: in std_logic_vector(7 downto 0); s: in std_logic_vector(2 downto 0); y: out std_logic);
	end component;
	
	component MUX_16x1 is
		port (i: in std_logic_vector(15 downto 0); s: in std_logic_vector(3 downto 0); y: out std_logic);
	end component;
	
	component MUX_32x1 is
		port (i: in std_logic_vector(31 downto 0); s: in std_logic_vector(4 downto 0); y: out std_logic);
	end component;
	
	component MUX_64x1 is
		port (i: in std_logic_vector(63 downto 0); s: in std_logic_vector(5 downto 0); y: out std_logic);
	end component;
	
	component MUX_128x1 is
		port (i: in std_logic_vector(127 downto 0); s: in std_logic_vector(6 downto 0); y: out std_logic);
	end component;
	
	component MUX_256x1 is
		port (i: in std_logic_vector(255 downto 0); s: in std_logic_vector(7 downto 0); y: out std_logic);
	end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.MUX_2x1;

entity MUX_4x1 is
	port (i: in std_logic_vector(3 downto 0); s: in std_logic_vector(1 downto 0); y: out std_logic);
end entity;

architecture struct of MUX_4x1 is
signal t: std_logic_vector(1 downto 0);
begin
	mux1: MUX_2x1 port map(i => i(3 downto 2), s => s(0), y => t(1));
	mux2: MUX_2x1 port map(i => i(1 downto 0), s => s(0), y => t(0));
	mux3: MUX_2x1 port map(i => t, s => s(1), y => y);
end architecture;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.MUX_2x1;

entity MUX_8x1 is
	port (i: in std_logic_vector(7 downto 0); s: in std_logic_vector(2 downto 0); y: out std_logic);
end entity;

architecture struct of MUX_8x1 is
component MUX_4x1 is
	port (i: in std_logic_vector(3 downto 0); s: in std_logic_vector(1 downto 0); y: out std_logic);
end component;

signal t: std_logic_vector(1 downto 0);
begin
	mux1: MUX_4x1 port map(i => i(7 downto 4), s => s(1 downto 0), y => t(1));
	mux2: MUX_4x1 port map(i => i(3 downto 0), s => s(1 downto 0), y => t(0));
	mux3: MUX_2x1 port map(i => t, s => s(2), y => y);
end architecture;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.MUX_2x1;

entity MUX_16x1 is
	port (i: in std_logic_vector(15 downto 0); s: in std_logic_vector(3 downto 0); y: out std_logic);
end entity;

architecture struct of MUX_16x1 is
component MUX_8x1 is
	port (i: in std_logic_vector(7 downto 0); s: in std_logic_vector(2 downto 0); y: out std_logic);
end component;

signal t: std_logic_vector(1 downto 0);
begin
	mux1: MUX_8x1 port map(i => i(15 downto 8), s => s(2 downto 0), y => t(1));
	mux2: MUX_8x1 port map(i => i(7 downto 0), s => s(2 downto 0), y => t(0));
	mux3: MUX_2x1 port map(i => t, s => s(3), y => y);
end architecture;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.MUX_2x1;

entity MUX_32x1 is
	port (i: in std_logic_vector(31 downto 0); s: in std_logic_vector(4 downto 0); y: out std_logic);
end entity;

architecture struct of MUX_32x1 is
component MUX_16x1 is
	port (i: in std_logic_vector(15 downto 0); s: in std_logic_vector(3 downto 0); y: out std_logic);
end component;

signal t: std_logic_vector(1 downto 0);
begin
	mux1: MUX_16x1 port map(i => i(31 downto 16), s => s(3 downto 0), y => t(1));
	mux2: MUX_16x1 port map(i => i(15 downto 0), s => s(3 downto 0), y => t(0));
	mux3: MUX_2x1 port map(i => t, s => s(4), y => y);
end architecture;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.MUX_2x1;

entity MUX_64x1 is
	port (i: in std_logic_vector(63 downto 0); s: in std_logic_vector(5 downto 0); y: out std_logic);
end entity;

architecture struct of MUX_64x1 is
component MUX_32x1 is
	port (i: in std_logic_vector(31 downto 0); s: in std_logic_vector(4 downto 0); y: out std_logic);
end component;

signal t: std_logic_vector(1 downto 0);
begin
	mux1: MUX_32x1 port map(i => i(63 downto 32), s => s(4 downto 0), y => t(1));
	mux2: MUX_32x1 port map(i => i(31 downto 0), s => s(4 downto 0), y => t(0));
	mux3: MUX_2x1 port map(i => t, s => s(5), y => y);
end architecture;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.MUX_2x1;

entity MUX_128x1 is
	port (i: in std_logic_vector(127 downto 0); s: in std_logic_vector(6 downto 0); y: out std_logic);
end entity;

architecture struct of MUX_128x1 is
component MUX_64x1 is
	port (i: in std_logic_vector(63 downto 0); s: in std_logic_vector(5 downto 0); y: out std_logic);
end component;

signal t: std_logic_vector(1 downto 0);
begin
	mux1: MUX_64x1 port map(i => i(127 downto 64), s => s(5 downto 0), y => t(1));
	mux2: MUX_64x1 port map(i => i(63 downto 0), s => s(5 downto 0), y => t(0));
	mux3: MUX_2x1 port map(i => t, s => s(6), y => y);
end architecture;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.MUX_2x1;

entity MUX_256x1 is
	port (i: in std_logic_vector(255 downto 0); s: in std_logic_vector(7 downto 0); y: out std_logic);
end entity;

architecture struct of MUX_256x1 is
component MUX_128x1 is
	port (i: in std_logic_vector(127 downto 0); s: in std_logic_vector(6 downto 0); y: out std_logic);
end component;

signal t: std_logic_vector(1 downto 0);
begin
	mux1: MUX_128x1 port map(i => i(255 downto 128), s => s(6 downto 0), y => t(1));
	mux2: MUX_128x1 port map(i => i(127 downto 0), s => s(6 downto 0), y => t(0));
	mux3: MUX_2x1 port map(i => t, s => s(7), y => y);
end architecture;
