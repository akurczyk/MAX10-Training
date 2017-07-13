library ieee;
use ieee.std_logic_1164.all;

entity all1 is
	port(
		Output : out STD_LOGIC_VECTOR(7 downto 0)
	);
end all1;

architecture Whatever of all1 is
begin
	Output <= "11111111";
end Whatever;