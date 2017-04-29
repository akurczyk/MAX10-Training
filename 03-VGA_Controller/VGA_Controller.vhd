library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGA_Controller is
	port(
		Clk  : in  STD_LOGIC;
		VgaH : out STD_LOGIC;
		VgaV : out STD_LOGIC;
		VgaR : out STD_LOGIC;
		VgaG : out STD_LOGIC;
		VgaB : out STD_LOGIC
	);
end VGA_Controller;

architecture Whatever of VGA_Controller is

	signal PosH : UNSIGNED(10 downto 0);
	signal PosV : UNSIGNED(9 downto 0);

begin

	Proc : process(Clk)
	begin
		if rising_edge(Clk) then

			if PosH < 40+128+88+800-1 then
				PosH <= PosH+1;
			else
				PosH <= TO_UNSIGNED(0, 11);
				if PosV < 1+4+23+600-1 then
					PosV <= PosV+1;
				else
					PosV <= TO_UNSIGNED(0, 10);
				end if;
			end if;

			if PosH >= 40 and PosH < 40+128 then
				VgaH <= '0';
			else
				VgaH <= '1';
			end if;

			if PosV >= 1 and PosV < 1+4 then
				VgaV <= '0';
			else
				VgaV <= '1';
			end if;

			if (PosH >= 0 and PosH < 40+128+88) or (PosV >= 0 and PosV < 1+4+23) then
				VgaR <= '0'; VgaG <= '0'; VgaB <= '0';
			elsif PosH >= 40+128+88+0 and PosH < 40+128+88+100 then
				VgaR <= '0'; VgaG <= '0'; VgaB <= '0';
			elsif PosH >= 40+128+88+100 and PosH < 40+128+88+200 then
				VgaR <= '0'; VgaG <= '0'; VgaB <= '1';
			elsif PosH >= 40+128+88+200 and PosH < 40+128+88+300 then
				VgaR <= '0'; VgaG <= '1'; VgaB <= '0';
			elsif PosH >= 40+128+88+300 and PosH < 40+128+88+400 then
				VgaR <= '0'; VgaG <= '1'; VgaB <= '1';
			elsif PosH >= 40+128+88+400 and PosH < 40+128+88+500 then
				VgaR <= '1'; VgaG <= '0'; VgaB <= '0';
			elsif PosH >= 40+128+88+500 and PosH < 40+128+88+600 then
				VgaR <= '1'; VgaG <= '0'; VgaB <= '1';
			elsif PosH >= 40+128+88+600 and PosH < 40+128+88+700 then
				VgaR <= '1'; VgaG <= '1'; VgaB <= '0';
			else
				VgaR <= '1'; VgaG <= '1'; VgaB <= '1';
			end if;

		end if;
	end process Proc;

end Whatever;