library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity JK_Flip_Flop is

              Port(
                  J:in std_logic; 
                  K:in std_logic;
                  clk:in std_logic;
                  reset:in std_logic;
                  Q:out std_logic;
                  Q_bar:out std_logic
                  );

end JK_Flip_Flop;

architecture Behavioral of JK_Flip_Flop is
    signal Q_tmp: std_logic:='0';
begin
        process(clk,reset)
begin
      if reset='1' then
      Q_tmp<='0';
        
      elsif (rising_edge(clk)) then
        if J='0' and K='0' then
        Q_tmp<=Q_tmp;
        
        elsif J='0' and K='1' then
        Q_tmp<='0';
        
        elsif J='1' and K='0' then
        Q_tmp<='1';
        
        elsif J='1' and K='1' then
        Q_tmp<=not Q_tmp;
        
        
     end if;
    
   end if;
   end process;
   Q<=Q_tmp;
   Q_bar<=not Q_tmp;
   
   end Behavioral;
        

