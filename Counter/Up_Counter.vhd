library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Up_Counter is

               
               port(
                    clk:in std_logic;
                    rst:in std_logic;
                    en:in std_logic;
                    Q:out std_logic_vector(3 downto 0)
                    );
end Up_Counter;

architecture Behavioral of Up_Counter is
          
           signal count : unsigned(3 downto 0) := (others => '0');
begin
       process(clk)
begin
        if rising_edge(clk) then
          if rst='1' then 
              count<= (others => '0');
              
           elsif en='1' then
              count<= count + 1;
              
       end if;
     end if;
   end process;
   
      Q<= std_logic_vector(count);
          

end Behavioral;
