----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2026 01:15:14 PM
-- Design Name: 
-- Module Name: CLKDIV - Behavioral
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

entity CLKDIV is
    Port ( CLKin : in STD_LOGIC;
           CLKslow : out STD_LOGIC);
end CLKDIV;

architecture Behavioral of CLKDIV is

signal BUF : std_logic_vector (25 downto 0) := (others => '0');

begin

process(CLKin)
    begin
    if (rising_edge(CLKin)) then
        BUF <= BUF +1;
    end if;
end process;

CLKslow <= BUF(25);
end Behavioral;
