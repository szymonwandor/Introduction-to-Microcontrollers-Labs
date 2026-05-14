----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2024 14:35:00
-- Design Name: 
-- Module Name: Tff - Behavioral
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

entity Tff is
    Port ( R : in STD_LOGIC;
           S : in STD_LOGIC;
           CLK : in STD_LOGIC;
           T : in STD_LOGIC;
           Q : out STD_LOGIC;
           NQ : out STD_LOGIC);
end Tff;

architecture Behavioral of Tff is

signal tmp : std_logic;

begin

process(R,CLK)
begin
    if (R='1') then
        tmp <= S;
    elsif(rising_edge(CLK) and T='1') then
        tmp <= not tmp;
    end if;
end process;

Q<=tmp;
NQ<=not tmp;

end Behavioral;
