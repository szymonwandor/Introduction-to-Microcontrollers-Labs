----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2026 12:59:59 PM
-- Design Name: 
-- Module Name: MAIN - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAIN is
    Port ( R : in STD_LOGIC;
           CLK : in STD_LOGIC;
           Yseg, Yan : out std_logic_vector (7 downto 0);
           Ycounter : out STD_LOGIC_VECTOR (3 downto 0);
           CLK_LED : out STD_LOGIC);
end MAIN;

architecture Behavioral of MAIN is


component sync4bitupTff is
    Port ( CLK : in STD_LOGIC;
           R : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component CLKDIV is
    Port ( CLKin : in STD_LOGIC;
           CLKslow : out STD_LOGIC);
end component;

component mux is
    Port ( DIG0 : in STD_LOGIC_VECTOR (3 downto 0);
           DIG1 : in STD_LOGIC_VECTOR (3 downto 0);
           DIG2 : in STD_LOGIC_VECTOR (3 downto 0);
           DIG3 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           Ymux: out STD_LOGIC_VECTOR (3 downto 0));
end component;

component bin4_to_bcd5 is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (4 downto 0));
end component;

signal CLKslow : std_logic;
signal BCD : std_logic_vector(4 downto 0);

begin

divider0: component CLKDIV port map (CLKin => CLK, CLKslow => CLKslow);
counter0: component sync4bitupTff port map (R => R, CLK=> CLK, Y => Ycounter);
bin4tobcd5: component bin4_to_bcd5 port map (
-- (idk czy to tu ma byc) mux0: component mux port map (S => S, Yout => Yout, DIG0



CLK_LED<=CLKslow;
--Yseg [DP g f e d c b a];
Yseg <= not "00111111";
Yan <= not "00001111";


DIG0 <= BCD(3 downto 0);
DIG1(0) <= BCD(4) 


end Behavioral;
