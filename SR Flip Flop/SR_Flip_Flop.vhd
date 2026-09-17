
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR_Flip_Flop is

        port(
             S:in std_logic;
             R:in std_logic;
             clk:in std_logic;
             reset:in std_logic;
             Q:out std_logic;
             Qbar:out std_logic
             );

end SR_Flip_Flop;

architecture Behavioral of SR_Flip_Flop is
     signal Q_int:std_logic:='0';
begin
     process(clk,reset)
begin
     if reset='1' then
     Q_int<='0';
     
     elsif rising_edge(clk) then
     
     if S='0' and R='0' then
     Q_int<=Q_int;
     
     elsif  S='0' and R='1' then
     Q_int<='0';
     
     elsif S='1' and R='0' then
     Q_int<='1';
     
     elsif S='1' and R='1' then
     Q_int<='X';
     
     end if;
     end if;
     end process;
     
     Q<= Q_int;
     Qbar<=not Q_int;

end Behavioral;
