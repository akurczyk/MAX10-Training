library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Multiplexer is
	port(
		Clk : in STD_LOGIC;
		Input1 : in STD_LOGIC_VECTOR(7 downto 0);
		Input2 : in STD_LOGIC_VECTOR(7 downto 0);
		Input3 : in STD_LOGIC_VECTOR(7 downto 0);
		Input4 : in STD_LOGIC_VECTOR(7 downto 0);
		Output : out STD_LOGIC_VECTOR(7 downto 0);
		Sel : out STD_LOGIC_VECTOR(3 downto 0)
	);
end Multiplexer;

architecture Behavioral of Multiplexer is
	signal CntValue : UNSIGNED(1 downto 0);
begin

	Proc : process(Clk)
	begin
		if rising_edge(Clk) then
		
			case CntValue is
				when "00" => Output <= Input1;
				when "01" => Output <= Input2;
				when "10" => Output <= Input3;
				when "11" => Output <= Input4;
			end case;
		
			case CntValue is
				when "00" => Sel <= "0001";
				when "01" => Sel <= "0010";
				when "10" => Sel <= "0100";
				when "11" => Sel <= "1000";
			end case;
			
			CntValue <= CntValue + 1;
			
		end if;
	end process Proc;

end Behavioral;