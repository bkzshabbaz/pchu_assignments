----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/23/2018 11:19:41 PM
-- Design Name: 
-- Module Name: three_to_eight_decoder_tb - behavioral
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

entity three_to_eight_decoder_tb is
end three_to_eight_decoder_tb;

architecture behavioral of three_to_eight_decoder_tb is
signal a : std_logic_vector(2 downto 0);
signal bcode : std_logic_vector(7 downto 0);

begin

    uut: entity work.three_to_eight_decoder(structural)
    port map(
        a => a,
        bcode => bcode
    );

    simulation: process
    begin
        a <= std_logic_vector(to_unsigned(0, a'length));
       
        wait for 1 ns;
        assert (bcode = b"00000001")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
    
        a <= std_logic_vector(to_unsigned(1, a'length));
        
        wait for 1 ns;
        assert (bcode = b"00000010")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(2, a'length));
        
        wait for 1 ns;
        assert (bcode = b"00000100")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(3, a'length));
        
        wait for 1 ns;
        assert (bcode = b"00001000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(4, a'length));
        
        wait for 1 ns;
        assert (bcode = b"00010000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
    
        a <= std_logic_vector(to_unsigned(5, a'length));
        
        wait for 1 ns;
        assert (bcode = b"00100000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(6, a'length));
        
        wait for 1 ns;
        assert (bcode = b"01000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(7, a'length));
        
        wait for 1 ns;
        assert (bcode = b"10000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        assert false
        report "=================== END SIMULATION ===================="
        severity failure;
    end process simulation;
end behavioral;

