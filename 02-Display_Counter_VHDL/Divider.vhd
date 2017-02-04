library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Divider is
	port(
		Clk : in STD_LOGIC;
		Out1 : out STD_LOGIC;
		Out2 : out STD_LOGIC
	);
end Divider;

architecture Behavioral of Divider is
	signal Cnt1 : UNSIGNED(13 downto 0) := TO_UNSIGNED(0, 14);
	signal Cnt2 : UNSIGNED(4 downto 0) := TO_UNSIGNED(0, 5);
	signal Tmp1 : STD_LOGIC := '0';
	signal Tmp2 : STD_LOGIC := '0';
begin

	Out1 <= Tmp1;
	Out2 <= Tmp2;

	Proc : process(Clk)
	begin
		if rising_edge(Clk) then
		
			Cnt1 <= Cnt1 + 1;
			Cnt2 <= Cnt2 + 1;
			
			if Cnt1 = 10000 then
				Cnt1 <= TO_UNSIGNED(0, 14);
				Tmp1 <= not Tmp1;
			end if;
			
			if Cnt2 = 25 then
				Cnt2 <= TO_UNSIGNED(0, 5);
				Tmp2 <= not Tmp2;
			end if;
			
		end if;
	end process Proc;

end Behavioral;