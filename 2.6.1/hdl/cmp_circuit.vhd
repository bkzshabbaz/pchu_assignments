----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sammy Lin
-- 
-- Create Date: 06/26/2018 11:26:58 PM
-- Design Name: 
-- Module Name: cmp_circuit - dataflow
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

entity cmp_circuit is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           eq : out STD_LOGIC);
end cmp_circuit;

architecture dataflow of cmp_circuit is
signal p0, p1, p2, p3: std_logic;
begin

    eq <= p0 or p1 or p2 or p3;
    
    p0 <= not a(1) and not a(0) and not b(1) and not b(0);
    p1 <= not a(1) and a(0) and not b(1) and b(0);
    p2 <= a(1) and not a(0) and b(1) and not b(0);
    p3 <= a(1) and a(0) and b(1) and b(0);
end dataflow;
