----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/27/2018 12:05:54 AM
-- Design Name: 
-- Module Name: four_gt_circuit - Behavioral
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

entity four_gt_circuit is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           gt : out STD_LOGIC);
end four_gt_circuit;

architecture dataflow of four_gt_circuit is
signal gt_1_out, gt_2_out, cmp_1_out: std_logic;
signal gt_1a_in, gt_1b_in, gt_2a_in, gt_2b_in : std_logic_vector(1 downto 0);
signal cmp_1a_in, cmp_1b_in : std_logic_vector(1 downto 0);
signal p0, p1, p2 : std_logic;
begin

gt_1a_in <= a(3) & a(2);
gt_1b_in <= b(3) & b(2);

gt_2a_in <= a(1) & a(0);
gt_2b_in <= b(1) & b(0);

cmp_1a_in <= a(3) & a(2);
cmp_1b_in <= b(3) & b(2);

gt_1: entity work.gt_circuit
    port map(
        a => gt_1a_in,
        b => gt_1b_in, 
        gt => gt_1_out
    );

gt_2: entity work.gt_circuit
    port map(
        a => gt_2a_in,
        b => gt_2b_in,
        gt => gt_2_out
    );

cmp_1: entity work.cmp_circuit
    port map(
        a => cmp_1a_in,
        b => cmp_1b_in,
        eq => cmp_1_out
    );

--gt <= (cmp_1_out and gt_1_out) or (gt_2_out);
p0 <= gt_1_out and gt_2_out;
p1 <= gt_1_out and not gt_2_out;
p2 <= cmp_1_out and not gt_1_out and gt_2_out;

gt <= p0 or p1 or p2;
end dataflow;
