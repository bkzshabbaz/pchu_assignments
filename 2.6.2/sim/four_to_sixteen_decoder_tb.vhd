----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/26/2018 10:59:32 PM
-- Design Name: 
-- Module Name: four_to_sixteen_decoder_tb - Behavioral
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

entity four_to_sixteen_decoder_tb is
end four_to_sixteen_decoder_tb;

architecture behavioral of four_to_sixteen_decoder_tb is
signal a : std_logic_vector(3 downto 0);
signal bcode : std_logic_vector(15 downto 0);

begin

    uut: entity work.four_to_sixteen_decoder(structural)
    port map(
        a => a,
        bcode => bcode
    );

    simulation: process
    begin
        a <= std_logic_vector(to_unsigned(0, a'length));
       
        wait for 1 ns;
        assert (bcode = b"0000000000000001")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
    
        a <= std_logic_vector(to_unsigned(1, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000000000000010")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(2, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000000000000100")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(3, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000000000001000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(4, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000000000010000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
    
        a <= std_logic_vector(to_unsigned(5, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000000000100000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(6, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000000001000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(7, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000000010000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        a <= std_logic_vector(to_unsigned(8, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000000000000001")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(9, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000001000000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(10, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000010000000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(11, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0000100000000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(12, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0001000000000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(13, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0010000000000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(14, a'length));
        
        wait for 1 ns;
        assert (bcode = b"0100000000000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        
        a <= std_logic_vector(to_unsigned(15, a'length));
        
        wait for 1 ns;
        assert (bcode = b"1000000000000000")
        report "=================== Wrong deocde ===================="
        severity error;
        wait for 10 ns;
        assert false
        report "=================== END SIMULATION ===================="
        severity failure;
    end process simulation;
end behavioral;

