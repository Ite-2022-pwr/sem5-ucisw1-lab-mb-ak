-- Vhdl test bench created from schematic /home/ise/laby5z1tt/schemat.sch - Sun Dec  8 14:22:03 2024
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY schemat_schemat_sch_tb IS
END schemat_schemat_sch_tb;
ARCHITECTURE behavioral OF schemat_schemat_sch_tb IS 

   COMPONENT schemat
   PORT( a	:	IN	STD_LOGIC; 
          b	:	IN	STD_LOGIC; 
          c	:	IN	STD_LOGIC; 
          d	:	IN	STD_LOGIC; 
          wyj	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL a	:	STD_LOGIC := '0';
   SIGNAL b	:	STD_LOGIC := '0';
   SIGNAL c	:	STD_LOGIC := '0';
   SIGNAL d	:	STD_LOGIC := '0';
   SIGNAL wyj	:	STD_LOGIC;

BEGIN

   UUT: schemat PORT MAP(
		a => a, 
		b => b, 
		c => c, 
		d => d, 
		wyj => wyj
   );

a <= not a after 10 ns;
b <= not b after 20 ns;
c <= not c after 40 ns;
d <= not d after 80 ns;

END;
