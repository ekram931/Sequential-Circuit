library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T_Latch is
    Port (
          T:in std_logic;
          En:in std_logic;
          RST:in std_logic; 
          Q:out std_logic;
          Qbar:out std_logic
          );
        
end T_Latch;

architecture Behavioral of T_Latch is
    signal Q_int: std_logic :='0';
begin
    Process(T,En,RST)
begin
      if 
        RST='1' then
        q_int<='0';
     
     elsif
          En='1' then
    
     if
          T='1'then
          Q_int<=not Q_int;
     else
          Q_int<=Q_int;
          
        end if;
     end if;
     
    end process;
     
    Q<=Q_int;
    Qbar<=not Q_int;
     
    end Behavioral;
     