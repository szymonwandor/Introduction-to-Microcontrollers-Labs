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
use IEEE.std_logic_unsigned.ALL;
USE IEEE.numeric_std.ALL;

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
           CLKfast : out STD_LOGIC;
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

component abcd_to_7seg is
    Port ( X : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component dec2to4 is
    Port ( X : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal CLKslow, CLKfast : std_logic;
signal BCD : std_logic_vector(4 downto 0);
signal Ycounters : std_logic_vector(3 downto 0);

signal DIG0s : std_logic_vector(3 downto 0);
signal DIG1s : std_logic_vector(3 downto 0); 
signal DIG2s : std_logic_vector(3 downto 0); 
signal DIG3s : std_logic_vector(3 downto 0); 

signal Ss : std_logic_vector(1 downto 0) := "00";

signal Ymuxs : std_logic_vector(3 downto 0);

signal Yabcd : std_logic_vector(6 downto 0);

signal Ydec : std_logic_vector(3 downto 0);


begin

divider0: component CLKDIV port map (CLKin => CLK, CLKslow => CLKslow, CLKfast => CLKfast);
counter0: component sync4bitupTff port map (R => R, CLK=> CLKslow, Y => Ycounters);

bin4tobcd5: component bin4_to_bcd5 port map (X => Ycounters, Y => BCD);

mux0: component mux port map (S => Ss, Ymux => Ymuxs, DIG0 => DIG0s, 
                                DIG1 => DIG1s, DIG2 => DIG2s, DIG3 => DIG3s);

abcd_to_7seg0: component abcd_to_7seg port map (X => Ymuxs, Y => Yabcd);

dec2to40: component dec2to4 port map(X => Ss, Y => Ydec);


DIG0s <= BCD(3 downto 0);
DIG1s(0) <= BCD(4);
DIG1s(3 downto 1) <= "000";
DIG2s <= "0000";
DIG3s <= "0000";
                                
process(CLKfast)
    begin
    if (rising_edge(CLKfast)) then
        Ss <= Ss +1;
    end if;
end process;

Ycounter<=Ycounters;
CLK_LED <= CLKslow;
--Yseg [DP g f e d c b a];
--Yseg <= not "00111111";
--Yan <= not "00001111";

Yseg(7)<=not '0';
Yseg(6 downto 0) <= not Yabcd;
Yan (7 downto 4) <= not "0000";
Yan (3 downto 0) <= not Ydec;


 


end Behavioral;