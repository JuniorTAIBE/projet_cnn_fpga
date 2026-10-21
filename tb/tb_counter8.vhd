library IEEE;
use IEEE.STD_LOGIC_1164.ALL;    
use IEEE.NUMERIC_STD.ALL;

entity tb_counter8 is
end tb_counter8;

architecture Behavioral of tb_counter8 is

    -- Component Declaration for the Unit Under Test (UUT)
    component counter8
    Port ( clk : in STD_LOGIC;
           rst, enable : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

   --Inputs
   signal clk : STD_LOGIC := '0';
   signal rst : STD_LOGIC := '0';
   signal enable : STD_LOGIC := '0';

    --Outputs
   signal count : STD_LOGIC_VECTOR (7 downto 0);

begin
    
    -- Instantiate the Unit Under Test (UUT)
   uut: counter8 Port map (
          clk => clk,
          rst => rst,
          enable => enable,
          count => count
        );

   -- Clock process definitions
   clk_process :process
   begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
      rst <= '1';
      wait for 20 ns;
      rst <= '0';
      wait for 20 ns;
      
      enable <= '1';
      wait for 200 ns;
      
      enable <= '0';
      wait for 100 ns;
      
      enable <= '1';
      wait for 200 ns;
      
      -- insert stimulus here 

      wait;
   end process;

end Behavioral;