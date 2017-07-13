library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WS2812b_Driver is
	port(
		Clk        : in  STD_LOGIC;
		Start      : in  STD_LOGIC;
		LED1_Red   : in  STD_LOGIC_VECTOR(7 downto 0);
		LED1_Green : in  STD_LOGIC_VECTOR(7 downto 0);
		LED1_Blue  : in  STD_LOGIC_VECTOR(7 downto 0);
		LED2_Red   : in  STD_LOGIC_VECTOR(7 downto 0);
		LED2_Green : in  STD_LOGIC_VECTOR(7 downto 0);
		LED2_Blue  : in  STD_LOGIC_VECTOR(7 downto 0);
		Bus_Output : out STD_LOGIC;
		Busy       : out STD_LOGIC
	);
end WS2812b_Driver;

architecture Whatever of WS2812b_Driver is

	signal Buf      : STD_LOGIC_VECTOR(47 downto 0);
	signal Position : UNSIGNED(5 downto 0);
	--signal BusyCnt  : UNSIGNED(7 downto 0);
	signal BusyCnt  : UNSIGNED(9 downto 0);
	
	type State_Type is ( S1, S2, Z1, Z2, O1, O2, S3, S4 );
	signal State, Next_State : State_Type;

begin

	Buf <= LED1_Green & LED1_Red & LED1_Blue & LED2_Green & LED2_Red & LED2_Blue;

	Proc1 : process(Clk)
	begin
		if rising_edge(Clk) then
			State <= Next_State;
		end if;
	end process Proc1;

	Proc2 : process(State, Buf, Position, BusyCnt)
	begin
		Next_State <= State;
		case State is
		
			when S1 =>
				if Start = '1' then
					Next_State <= S2;
				else
					Next_State <= S1;
				end if;
			
			when S2 =>
				if Buf(TO_INTEGER(Position)) = '0' then
					Next_State <= Z1;
				else
					Next_State <= O1;
				end if;
			
			when Z1 => Next_State <= Z2;
			when Z2 => Next_State <= S3;
			when O1 => Next_State <= O2;
			when O2 => Next_State <= S3;
			
			when S3 =>
				if Position = 48 then
					Next_State <= S4;
				else
					Next_State <= S2;
				end if;
			
			when S4 =>
				--if BusyCnt = 160 then
				if BusyCnt = 999 then
					Next_State <= S1;
				else
					Next_State <= S4;
				end if;
			
		end case;
	end process Proc2;
	
	Proc3 : process(Clk, State, Position)
	begin
		if rising_edge(Clk) then
			if State = S1 then
				Position <= TO_UNSIGNED(0, 6);
			elsif State = Z1 OR State = O1 then
				Position <= Position + 1;
			else
				Position <= Position;
			end if;
		end if;
	end process Proc3;
	
	Bus_Output <= '1' when State = S2 OR State = O1 OR State = O2 else '0';
	
	Proc4 : process(Clk, State, BusyCnt)
	begin
		if rising_edge(Clk) then
			if State = S1 then
				--BusyCnt <= TO_UNSIGNED(0, 8);
				BusyCnt <= TO_UNSIGNED(0, 10);
			elsif State = S4 then
				BusyCnt <= BusyCnt + 1;
			else
				BusyCnt <= BusyCnt;
			end if;
		end if;
	end process Proc4;
	
	Busy <= '0' when State = S1 else '1';

end Whatever;