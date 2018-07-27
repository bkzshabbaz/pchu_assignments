----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/27/2018 11:12:55 PM
-- Design Name: 
-- Module Name: two_to_four_decoder_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity two_to_four_decoder_tb is
end two_to_four_decoder_tb;

architecture behavioral of two_to_four_decoder_tb is
signal a : std_logic_vector(1 downto 0);
signal bcode : std_logic_vector(3 downto 0);
signal en : std_logic;

begin

    uut: entity work.two_to_four_decoder(dataflow)
    port map(
        en => en,
        a => a,
        bcode => bcode
    );

    simulation: process
    begin
        a <= std_logic_vector(to_unsigned(0, a'length));
        en <= '0';
        wait for 1 ns;
        assert (bcode = b"0000")
        report "=========== Enable didn't work ==============="
        severity error;
        wait for 10 ns;
        en <= '1';
       
        wait for 1 ns;
        assert (bcode = b"0001")
        report "=================== Value not greater than ===================="
        severity error;
        wait for 10 ns;
    
        a <= std_logic_vector(to_unsigned(1, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0010")
        report "=================== Value not greater than ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(2, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0100")
        report "=================== Value not greater than ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(3, a'length));
        
        wait for 1 ns;
        assert (bcode = b"1000")
        report "=================== Value not greater than ===================="
        severity error;
        wait for 10 ns;
        
        assert false
        report "=================== END SIMULATION ===================="
        severity failure;
    end process simulation;
end behavioral;

