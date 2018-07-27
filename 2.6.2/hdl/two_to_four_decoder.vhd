----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/27/2018 11:11:56 PM
-- Design Name: 
-- Module Name: two_to_four_decoder - dataflow
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

entity two_to_four_decoder is
port (
    en : in std_logic;
    a : in std_logic_vector(1 downto 0);
    bcode : out std_logic_vector(3 downto 0)
    );
end two_to_four_decoder;

architecture dataflow of two_to_four_decoder is

begin   
    bcode(3) <= en and a(1) and a(0);
    bcode(2) <= en and a(1) and not a(0);
    bcode(1) <= en and not a(1) and a(0);
    bcode(0) <= en and not a(1) and not a(0);
 
 end dataflow;
