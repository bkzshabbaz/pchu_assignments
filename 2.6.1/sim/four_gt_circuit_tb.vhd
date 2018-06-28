----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/27/2018 08:12:00 AM
-- Design Name: 
-- Module Name: four_gt_circuit_tb - Behavioral
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

entity four_gt_circuit_tb is
--  Port ( );
end four_gt_circuit_tb;

architecture behavioral of four_gt_circuit_tb is

signal a, b : std_logic_vector(3 downto 0);
signal gt, compare_out : std_logic;

begin

    uut: entity work.four_gt_circuit(dataflow)
    port map(
        a => a,
        b => b,
        gt => gt
    );
    
    simulation: process
    begin
        for i in 0 to 15 loop
            for j in 0 to 15 loop
                a <= std_logic_vector(to_unsigned(i, a'length));
                b <= std_logic_vector(to_unsigned(j, b'length));
               
                if (i > j) then
                    compare_out <= '1';
                else
                    compare_out <= '0';
                end if;
                
                wait for 1 ns;
                assert (gt = compare_out)
                report "=================== Value not greater than ===================="
                severity error;
                wait for 10 ns;
            end loop;
        end loop;
        assert false
        report "=================== END SIMULATION ===================="
        severity failure;
    end process simulation;
end behavioral;
