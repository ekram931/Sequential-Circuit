
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_Flip_Flop is

          port(
              
              T:in std_logic;
              clk:in std_logic;
              reset:in std_logic;
              Q:out std_logic;
              Qbar:out std_logic
              );
        
end T_Flip_Flop;

architecture Behavioral of T_Flip_Flop is
     signal q_reg:std_logic:='0';
begin

     process(clk,reset)
     
begin
  
      if reset='1' then
      q_reg<='0';
      
      elsif(rising_edge(clk)) then
           if T='1' then
              q_reg<=not q_reg;
  
          else
             q_reg<=q_reg;
             
       end if;
       end if;
       end process;
       
       
       Q<=q_reg;
       Qbar<=not q_reg;
        
  
end Behavioral;
