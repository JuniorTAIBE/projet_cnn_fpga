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

   --signal to end the simulation
   signal end_simulation : boolean := false;

   --signal to count the number of errors
   signal errors : integer := 0;

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

      while not end_simulation loop
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
      end loop;
      wait;
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
      -- Test that the counter works properly
      if unsigned(count) /= 10 then
         report "Erreur : compteur ne marche pas correctement " & integer'image(to_integer(unsigned(count)))
         severity error;
         errors <= errors + 1;
      end if;
      
      enable <= '0';
      wait for 100 ns;
      -- Test that the counter keeps its value when enable is low
      if unsigned(count) /= 10 then
         report "Erreur : Le compteur ne garde pas sa valeur quand enable est bas " & integer'image(to_integer(unsigned(count)))
         severity error;
         errors <= errors + 1;
      end if;

      rst <= '1';
      wait for 20 ns;
      -- Test that the counter is reset to zero
      if unsigned(count) /= 0 then
         report "Erreur : compteur pas remis à zéro après reset " & integer'image(to_integer(unsigned(count)))
         severity error;
         errors <= errors + 1;
      end if;

      rst <= '0';
      enable <= '1';
      wait for 5100 ns;

      -- Test that the counter reached its maximum value and wrapped around to zero
      if unsigned(count) /= 255 then
         report "Erreur : compteur n'atteint pas sa valeur maximale après 255 cycles" & integer'image(to_integer(unsigned(count)))
         severity error;
         errors <= errors + 1;
      end if;

      wait for 20 ns;

      -- Test that the counter is working properly
      if unsigned(count) /= 0 then
         report "Erreur : compteur pas remis à zéro après 256 cycles" & integer'image(to_integer(unsigned(count)))
         severity error;
         errors <= errors + 1;
      end if;

       wait for 60 ns;

       if errors = 0 then
         report "TEST PASSED";
         else
         report "TEST FAILED : " & integer'image(errors) & " erreur(s)" severity error;
      end if;
      
      end_simulation <= true;

      wait;
   end process;

end Behavioral;