
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK_Latch is
 
               Port(
               J:in std_logic;
               K:in std_logic;
               En:in std_logic;
               RST:in std_logic;
               Q:out std_logic;
               Qbar:out std_logic
               );

end JK_Latch;

architecture Behavioral of JK_Latch is
     Signal Q_int: std_logic:='0';
begin
     Process (J,K,En,RST)
begin
     
     if 
       RST='1' then
       Q_int<='0';
       
     elsif
       En='1' then
     if
       J='0'and K='0' then
       Q_int<=Q_int;
     
     elsif
       J='0' and K='1' then
       Q_int<= '0';
       
     elsif
       J='1' and K='0' then
       Q_int<= '1';
       
     elsif
       J='1' and K='1' then
       Q_int<=not Q_int;
       
       
     end if;
   end if;
   end Process;
   Q<=Q_int;
   Qbar<=not Q_int;
end Behavioral;
