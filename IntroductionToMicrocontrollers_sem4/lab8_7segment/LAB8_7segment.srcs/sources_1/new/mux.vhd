----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2026 02:13:58 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
    Port ( DIG0 : in STD_LOGIC_VECTOR (3 downto 0);
           DIG1 : in STD_LOGIC_VECTOR (3 downto 0);
           DIG2 : in STD_LOGIC_VECTOR (3 downto 0);
           DIG3 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           Ymux: out STD_LOGIC_VECTOR (3 downto 0));
end mux;

architecture Behavioral of mux is

signal S0 : std_logic_vector(3 downto 0) := (others => S(0));
signal S1 : std_logic_vector(3 downto 0) := (others => S(1));

begin

Ymux <= (not S1 and not S0 and DIG0) or
        (not S1 and S0 and DIG1) or
        (S1 and not S0 and DIG2) or
        (S1 and S0 and DIG3);


end Behavioral;
