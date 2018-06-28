----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Sammy Lin
-- 
-- Create Date: 06/26/2018 11:31:56 PM
-- Design Name: 
-- Module Name: cmp_circuit_tb - Behavioral
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

entity cmp_circuit_tb is
end cmp_circuit_tb;

architecture behavioral of cmp_circuit_tb is
signal a, b : std_logic_vector(1 downto 0);
signal eq, eq_out, compare_out : std_logic;

begin

    uut: entity work.cmp_circuit(dataflow)
    port map(
        a => a,
        b => b,
        eq => eq
    );
    
    simulation: process
    begin
        for i in 0 to 3 loop
            for j in 0 to 3 loop
                a <= std_logic_vector(to_unsigned(i, a'length));
                b <= std_logic_vector(to_unsigned(j, b'length));
               
                if (i = j) then
                    compare_out <= '1';
                else
                    compare_out <= '0';
                end if;
                
                wait for 1 ns;
                assert (eq = compare_out)
                report "=================== Value not equal ===================="
                severity error;
                wait for 10 ns;
            end loop;
        end loop;
        assert false
        report "=================== END SIMULATION ===================="
        severity failure;
    end process simulation;
end Behavioral;
