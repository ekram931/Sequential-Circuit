
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Latch is
           
           port(
           S:in std_logic;
           R:in std_logic;
           Q:out std_logic; 
           Qbar:out std_logic);



end SR_Latch;

architecture Behavioral of SR_Latch is

signal Q_int:std_logic:='1';
signal Qbar_int:std_logic:='0';

begin
   
   Q_int<=S nand Qbar_int;
   Qbar_int<=R nand Q_int;
   Q<=Q_int;
   Qbar<=Qbar_int;

end Behavioral;
