----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:13 12/08/2024 
-- Design Name: 
-- Module Name:    transl - Behavioral 
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

entity transl is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           w : out  STD_LOGIC;
           x : out  STD_LOGIC;
           y : out  STD_LOGIC;
           z : out  STD_LOGIC);
end transl;

architecture Behavioral of transl is
signal input :std_logic_vector (3 downto 0) ;
begin
input <= a & b & c & d;
process (input)
begin
case input is
	WHEN "0000" =>
		w <= '0';
		x <= '0';
		y <= '1';
		z <= '1';
	WHEN "0001" =>
		w <= '0';
		x <= '1';
		y <= '0';
		z <= '0';
	WHEN "0010" =>
		w <= '0';
		x <= '1';
		y <= '0';
		z <= '1';
	WHEN "0011" =>
		w <= '0';
		x <= '1';
		y <= '1';
		z <= '0';
	WHEN "0100" =>
		w <= '0';
		x <= '1';
		y <= '1';
		z <= '1';
	WHEN "1011" =>
		w <= '1';
		x <= '0';
		y <= '0';
		z <= '0';
	WHEN "1100" =>
		w <= '1';
		x <= '0';
		y <= '0';
		z <= '1';
	WHEN "1101" =>
		w <= '1';
		x <= '0';
		y <= '1';
		z <= '0';
	WHEN "1110" =>
		w <= '1';
		x <= '0';
		y <= '1';
		z <= '1';
	WHEN "1111" =>
		w <= '1';
		x <= '1';
		y <= '0';
		z <= '0';
	WHEN OTHERS =>
		w <= '0';
		x <= '0';
		y <= '0';
		z <= '0';

end case;
end process;

end Behavioral;

