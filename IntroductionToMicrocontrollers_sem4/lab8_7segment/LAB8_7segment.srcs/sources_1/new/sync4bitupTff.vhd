----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.04.2024 14:37:22
-- Design Name: 
-- Module Name: sync4bitupTff - Behavioral
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

entity sync4bitupTff is
    Port ( CLK : in STD_LOGIC;
           R : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end sync4bitupTff;

architecture Behavioral of sync4bitupTff is

component TFF is
    Port ( R : in STD_LOGIC;
           S : in STD_LOGIC;
           CLK : in STD_LOGIC;
           T : in STD_LOGIC;
           Q : out STD_LOGIC;
           NQ : out STD_LOGIC);
end component;

signal S : std_logic_vector(3 downto 0) := (others => '0');
signal T,Q,NQ : std_logic_vector(3 downto 0);

begin

ff0: component Tff port map (S=>S(0),R=>R,CLK=>CLK,T=>T(0),Q=>Q(0),NQ=>NQ(0));
ff1: component Tff port map (S=>S(1),R=>R,CLK=>CLK,T=>T(1),Q=>Q(1),NQ=>NQ(1));
ff2: component Tff port map (S=>S(2),R=>R,CLK=>CLK,T=>T(2),Q=>Q(2),NQ=>NQ(2));
ff3: component Tff port map (S=>S(3),R=>R,CLK=>CLK,T=>T(3),Q=>Q(3),NQ=>NQ(3));

T(0)<='1';
T(1)<=Q(0);
T(2)<=Q(1) and Q(0);
T(3)<=Q(2) and T(2);

Y<=Q;


end Behavioral;
