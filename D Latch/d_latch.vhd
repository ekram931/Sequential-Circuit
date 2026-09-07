
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_latch is
        Port(
             D:in std_logic;
             EN:in std_logic;
             Q:out std_logic
             );

end d_latch;
architecture Behavioral of d_latch is
begin
      process(D,EN)
begin  
      if En='1' then
      Q<=D;
      end if;
      
    end process;  

end Behavioral;
   