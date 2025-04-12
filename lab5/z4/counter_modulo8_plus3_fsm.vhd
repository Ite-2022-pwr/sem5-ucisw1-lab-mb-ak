----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:21 12/08/2024 
-- Design Name: 
-- Module Name:    licznik - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity licznik is
    Port ( zeg : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           wyj : out  STD_LOGIC_VECTOR (3 downto 0));
end licznik;

architecture fsm of licznik is

type state is (Q0, Q1, Q2, Q3, Q4, Q5, Q6, Q7);
signal current_state, next_state : state;

signal licznik_wyj : std_logic_vector(3 downto 0);

begin

process(zeg, reset)
begin
	if reset = '1' then
		current_state <= Q0;
	elsif rising_edge(zeg) then
		current_state <= next_state;
	end if;
end process;

--logika przejsc
process (current_state)
begin
	case current_state is
		when Q0 =>
			next_state <= Q1;
			licznik_wyj <= "0011";
		when Q1 =>
			next_state <= Q2;
			licznik_wyj <= "0100";
		when Q2 =>
			next_state <= Q3;
			licznik_wyj <= "0101";
		when Q3 =>
			next_state <= Q4;
			licznik_wyj <= "0110";
		when Q4 =>
			next_state <= Q5;
			licznik_wyj <= "0111";
		when Q5 =>
			next_state <= Q6;
			licznik_wyj <= "1000";
		when Q6 =>
			next_state <= Q7;
			licznik_wyj <= "1001";
		when Q7 =>
			next_state <= Q0;
			licznik_wyj <= "1010";
		when OTHERS =>
			next_state <= Q0;
			licznik_wyj <= "0011";
			
	end case;
end process;

wyj <= licznik_wyj;

end fsm;

