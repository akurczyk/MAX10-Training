library ieee;
use ieee.std_logic_1164.all;

entity Decoder is
	port(
		Input : in STD_LOGIC_VECTOR(3 downto 0);
		Output : out STD_LOGIC_VECTOR(7 downto 0)
	);
end Decoder;

architecture Dataflow of Decoder is
begin

	Output <= "11111100" when Input = "0000" else
				 "01100000" when Input = "0001" else
				 "11011010" when Input = "0010" else
				 "11110010" when Input = "0011" else
				 "01100110" when Input = "0100" else
				 "10110110" when Input = "0101" else
				 "10111110" when Input = "0110" else
				 "11100100" when Input = "0111" else
				 "11111110" when Input = "1000" else
				 "11110110" when Input = "1001" else
				 "11101110" when Input = "1010" else
				 "00111110" when Input = "1011" else
				 "00011010" when Input = "1100" else
				 "01111010" when Input = "1101" else
				 "10011110" when Input = "1110" else
				 "10001110";

end Dataflow;