library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter is
	port(
		Clk : in STD_LOGIC;
		Output : out STD_LOGIC_VECTOR(15 downto 0)
	);
end Counter;

architecture Behavioral of Counter is
	signal CntValue : UNSIGNED(15 downto 0);
begin

	Output <= STD_LOGIC_VECTOR(CntValue);

	Proc : process(Clk)
	begin
		if rising_edge(Clk) then
			CntValue <= CntValue + 1;
		end if;
	end process Proc;

end Behavioral;