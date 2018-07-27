----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2018 11:00:43 PM
-- Design Name: 
-- Module Name: three_to_eight_decoder - structural
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

entity three_to_eight_decoder is
port (
    a : in std_logic_vector(2 downto 0);
    bcode : out std_logic_vector(7 downto 0)
    );
end three_to_eight_decoder;

architecture structural of three_to_eight_decoder is
signal a_en, b_en : std_logic;
signal a_in, b_in : std_logic_vector(1 downto 0);
signal a_decoded, b_decoded : std_logic_vector(3 downto 0);

begin

a_en <= a(a'high);
b_en <= not a(a'high);

a_decoder: entity work.two_to_four_decoder port map(
                    en =>       a_en,
                    a =>        a(a'high -1 downto 0),
                    bcode =>    a_decoded                
                    );

b_decoder: entity work.two_to_four_decoder port map(
                    en =>       b_en,
                    a =>        a(a'high - 1 downto 0),
                    bcode =>    b_decoded
                    );

-- Output
bcode <= a_decoded & b_decoded;

end structural;

