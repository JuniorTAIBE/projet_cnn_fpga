library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;   

entity counter8 is
    Port ( clk : in STD_LOGIC;
           rst, enable : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (7 downto 0));
end counter8;

architecture Behavioral of counter8 is
signal count_int : unsigned(7 downto 0) := (others => '0');
begin   

process(clk)

begin   

    if rising_edge(clk) then

        if rst = '1' then
        count_int <= (others => '0');
        elsif enable = '1' then
        count_int <= count_int + 1;
        end if;
    
    end if;

end process;

count <= std_logic_vector(count_int);

end Behavioral;