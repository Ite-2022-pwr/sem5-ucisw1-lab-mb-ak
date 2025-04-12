----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:22:01 12/09/2024 
-- Design Name: 
-- Module Name:    detektorRotIn - fsm 
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
use IEEE.NUMERIC_STD.ALL;

entity detektorRotIn is
    Port (
        rot_r : in  STD_LOGIC;
        rot_l : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        wyj   : out STD_LOGIC;
        stan  : out STD_LOGIC_VECTOR (3 downto 0)
    );
end detektorRotIn;

architecture fsm of detektorRotIn is

    type state is (Q0, Q1, Q2, Q3, Q4, Q5);
    signal current_state, next_state : state;
    signal clk_sig : STD_LOGIC; -- pseudo-zegar łączący rot_r i rot_l

begin

-- Łączenie rot_r i rot_l do jednego sygnału pseudo-zegarowego
clk_sig <= rot_r OR rot_l;

-- Obsługa przejść - przy zboczu narastającym któregokolwiek z rot_r lub rot_l
process (reset, clk_sig)
begin
    if reset = '1' then
        current_state <= Q0;
    elsif rising_edge(clk_sig) then
        current_state <= next_state;
    end if;
end process;

-- Logika przejść (zamiast bit_in używamy rot_r)
process (current_state, rot_r, rot_l)
begin
    next_state <= Q0;
    case current_state is
        WHEN Q0 =>
            if rot_r = '1' then
                next_state <= Q1;
            else
                next_state <= Q0;
            end if;
        WHEN Q1 =>
            if rot_l = '1' then
                next_state <= Q2;
            else
                next_state <= Q1;
            end if;
        WHEN Q2 =>
            if rot_r = '1' then
                next_state <= Q3;
            else
                next_state <= Q0;
            end if;
        WHEN Q3 =>
            if rot_r = '1' then
                next_state <= Q4;
            else
                next_state <= Q2;
            end if;
        WHEN Q4 =>
            if rot_r = '1' then
                next_state <= Q5;
            else
                next_state <= Q2;
            end if;
        WHEN Q5 =>
            if rot_r = '1' then
                next_state <= Q1;
            else
                next_state <= Q2;
            end if;
        WHEN OTHERS => 
            next_state <= Q0;
    end case;
end process;

-- Obsługa wyjścia
process (current_state)
begin
    stan <= std_logic_vector(to_unsigned(state'pos(current_state), stan'length));
    case current_state is
        WHEN Q5 =>
            wyj <= '1';
        WHEN OTHERS =>
            wyj <= '0';
    end case;
end process;

end fsm;