library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit is
    Port (
        CLK   : in  STD_LOGIC;
        RST   : in  STD_LOGIC;
        D     : in  STD_LOGIC_VECTOR(7 downto 0);
        Q     : out STD_LOGIC_VECTOR(7 downto 0)
    );
end Register_8bit;

architecture Behavioral of Register_8bit is

begin

    process(CLK, RST)
    begin
        if RST = '1' then
            Q <= "00000000";

        elsif rising_edge(CLK) then
            Q <= D;

        end if;
    end process;

end Behavioral;









