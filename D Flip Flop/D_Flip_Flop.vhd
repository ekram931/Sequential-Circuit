
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Flip_Flop is
                 
                 Port(
                 D:in std_logic;
                 clk:in std_logic; 
                 reset:in std_logic; 
                 Q:out std_logic
                 );
    
end D_Flip_Flop;

architecture Behavioral of D_Flip_Flop is

begin
  process(clk,reset)
  begin
  
        if reset='1' then
          Q<='0';
          
        elsif rising_edge(clk) then
        Q<= D;
        
        end if;
        end process;
          
          
end Behavioral;
