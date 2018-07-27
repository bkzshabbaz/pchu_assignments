----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2018 10:43:29 PM
-- Design Name: 
-- Module Name: four_to_sixteen_decoder - structural
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

entity four_to_sixteen_decoder is
port (
    a : in std_logic_vector(3 downto 0);
    bcode : out std_logic_vector(15 downto 0)
    );
end four_to_sixteen_decoder;

architecture structural of four_to_sixteen_decoder is
signal a_en, b_en, c_en, d_en : std_logic;
signal a_in, b_in, c_in, d_in : std_logic_vector(1 downto 0);
signal a_decoded, b_decoded, c_decoded, d_decoded : std_logic_vector(3 downto 0);

begin

a_en <= a(a'high) and a(a'high - 1);
b_en <= a(a'high) and not a(a'high - 1);
c_en <= not a(a'high) and a(a'high - 1);
d_en <= not a(a'high) and not a(a'high - 1);

a_decoder: entity work.two_to_four_decoder port map(
                    en =>       a_en,
                    a =>        a(a'high - 2 downto 0),
                    bcode =>    a_decoded                
                    );

b_decoder: entity work.two_to_four_decoder port map(
                    en =>       b_en,
                    a =>        a(a'high - 2 downto 0),
                    bcode =>    b_decoded
                    );
c_decoder: entity work.two_to_four_decoder port map(
                    en =>       c_en,
                    a =>        a(a'high - 2 downto 0),
                    bcode =>    c_decoded                
                    );

d_decoder: entity work.two_to_four_decoder port map(
                    en =>       d_en,
                    a =>        a(a'high - 2 downto 0),
                    bcode =>    d_decoded
                    );
-- Output
bcode <= a_decoded & b_decoded & c_decoded & d_decoded;
end structural;

