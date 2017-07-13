library ieee;
use ieee.std_logic_1164.all;

entity all0 is
	port(
		Output : out STD_LOGIC_VECTOR(7 downto 0)
	);
end all0;

architecture Whatever of all0 is
begin
	Output <= "00000000";
end Whatever;