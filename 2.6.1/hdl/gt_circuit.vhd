----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sammy Lin 
-- 
-- Create Date: 06/25/2018 12:11:36 AM
-- Design Name: 
-- Module Name: gt_circuit - dataflow
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

entity gt_circuit is
    port ( a : in std_logic_vector (1 downto 0);
           b : in std_logic_vector (1 downto 0);
           gt : out std_logic);
end gt_circuit;

architecture dataflow of gt_circuit is
signal p0, p1, p2, p3, p4, p5 : std_logic;
begin

    gt <= p0 or p1 or p2 or p3 or p4 or p5;
    
    p0 <= not a(1) and a(0) and not b(1) and not b(0);
    p1 <= a(1) and not a(0) and not b(1) and not b(0);
    p2 <= a(1) and not a(0) and not b(1) and b(0);
    p3 <= a(1) and a(0) and not b(1) and not b(0);
    p4 <= a(1) and a(0) and not b(1) and b(0);  
    p5 <= a(1) and a(0) and  b(1) and not b(0);  
end dataflow;

