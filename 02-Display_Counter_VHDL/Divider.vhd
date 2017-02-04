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
	signal Cnt1 : UNSIGNED(10 downto 0);
	signal Cnt2 : UNSIGNED(5 downto 0);
	signal Tmp1, Tmp2 : STD_LOGIC;
begin

	Out1 <= Tmp1;
	Out2 <= Tmp2;

	Proc : process(Clk)
	begin
		if rising_edge(Clk) then
		
			if Cnt1 < 1000 then
				Tmp1 <= '0';
			else
				Tmp1 <= '1';
			end if;
			
			if Cnt2 < 25 then
				Tmp1 <= '0';
			else
				Tmp1 <= '1';
			end if;
			
			Cnt1 <= Cnt1 + 1;
			Cnt2 <= Cnt2 + 1;
			
			if Cnt1 = 2000 then
				Cnt1 <= TO_UNSIGNED(0, 11);
			end if;
			
			if Cnt2 = 50 then
				Cnt2 <= TO_UNSIGNED(0, 6);
			end if;
			
		end if;
	end process Proc;

end Behavioral;