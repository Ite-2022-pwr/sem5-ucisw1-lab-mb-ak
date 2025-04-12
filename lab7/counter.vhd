----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:37:34 01/16/2025 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity licznik is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           load_value : in  STD_LOGIC_VECTOR (7 downto 0);
           load : in  STD_LOGIC;
           count_up_down : in  STD_LOGIC;
           display_out : out  STD_LOGIC_VECTOR (7 downto 0));
end licznik;

architecture Behavioral of licznik is
    signal counter_value : unsigned(7 downto 0) := "00000000"; -- wartość licznika
    signal count_dir     : STD_LOGIC := '1'; -- kierunek liczenia
	 signal clock_count   : integer := 0;
begin

	 
	

    process(clk, rst)
    begin
        if rst = '1' then
            counter_value <= (others => '0');
            count_dir <= '1';
        elsif rising_edge(clk) then
				if (clock_count = 50000000-1) then
					clock_count <= 0;
					if load = '1' then
						--if rising_edge(load) then
						counter_value <= unsigned(load_value);
					else
						if count_up_down = '1' then
                    count_dir <= not count_dir; -- zmiana kierunku liczenia
						end if;
						
						if count_dir = '1' then
                    if counter_value = unsigned(load_value) then
                        counter_value <= (others => '0'); -- zapętlenie po osiągnięciu wartości inicjalizującej
                    else
                        counter_value <= counter_value + 1;
                    end if;
						else
							if counter_value = "00000000" then
                        counter_value <= unsigned(load_value); -- zapętlenie po osiągnięciu 0
							else
                        counter_value <= counter_value - 1;
							end if;
						end if;
					end if;
				else
					clock_count <= clock_count+1;
				end if;
			end if;
		  
    end process;

    display_out <= std_logic_vector(counter_value); -- wyjście do wyświetlacza

end Behavioral;



