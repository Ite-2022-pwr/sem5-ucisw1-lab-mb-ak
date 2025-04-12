----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:04 12/08/2024 
-- Design Name: 
-- Module Name:    truthtable - Behavioral 
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

entity truthtable is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           wyj : out  STD_LOGIC);
end truthtable;

architecture Behavioral of truthtable is
signal input :std_logic_vector(3 downto 0);
begin
input <= d & c & b & a;
process (input)
begin
case input is 

	WHEN "0000" => wyj <= '1';
	WHEN "0001" => wyj <= '1';
	WHEN "0010" => wyj <= '0';
	WHEN "0011" => wyj <= '1';
	WHEN "0100" => wyj <= '0';
	WHEN "0101" => wyj <= '1';
	WHEN "0110" => wyj <= '0';
	WHEN "0111" => wyj <= '1';
	WHEN "1000" => wyj <= '1';
	WHEN "1001" => wyj <= '0';
	WHEN "1010" => wyj <= '1';
	WHEN "1011" => wyj <= '0';
	WHEN "1100" => wyj <= '1';
	WHEN "1101" => wyj <= '1';
	WHEN "1110" => wyj <= '1';
	WHEN "1111" => wyj <= '1';
	WHEN OTHERS => wyj <= '0';
	
end case;
end process;


end Behavioral;

