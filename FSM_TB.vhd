library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM_TB is
--  Port ( );
end FSM_TB;

architecture Behavioral of FSM_TB is

component FSM is
    Port( clk : in std_logic;
          reset : in std_logic;
          n : in std_logic;
          code : in std_logic_vector(3 downto 0);
          unlock : out std_logic);
end component FSM;

signal clk_TB: std_logic;
signal reset_TB: std_logic;
signal n_TB: std_logic;
signal code_TB: std_logic_vector(3 downto 0);
signal unlock_TB: std_logic;
constant CP: time := 10 ns;

begin

uut: FSM port map (clk => clk_TB, reset => reset_TB, n => n_TB, code => code_TB, unlock => unlock_TB);

process
begin
clk_TB <= '1';
wait for CP / 2;
clk_TB <= '0';
wait for CP / 2;
end process;

process
begin
reset_TB <= '1';
wait for CP;
reset_TB <= '0';
wait;
end process;

process
begin
n_TB <= '1';
code_TB <= "0110";
wait for CP;
n_TB <= '1';
code_TB <= "0001";
wait for CP;
n_TB <= '0';
code_TB <= "1101";
wait for CP;
n_TB <= '1';
code_TB <= "1001";
wait for CP;
n_TB <= '1';
code_TB <= "0110";
wait for CP;
n_TB <= '0';
code_TB <= "1010";
wait for CP;
n_TB <= '0';
code_TB <= "0110";
wait for CP;
n_TB <= '1';
code_TB <= "0101";
wait for CP;
n_TB <= '1';
code_TB <= "1111";
wait for CP;
n_TB <= '1';
code_TB <= "1100";
wait for CP;
n_TB <= '1';
code_TB <= "1011";
wait for CP;
n_TB <= '0';
code_TB <= "1110";
wait for CP;
n_TB <= '1';
code_TB <= "0110";
wait for CP;
n_TB <= '1';
code_TB <= "0001";
wait for CP;
n_TB <= '0';
code_TB <= "1111";
wait for CP;
n_TB <= '1';
code_TB <= "1001";
wait for CP;
n_TB <= '1';
code_TB <= "0000";
wait;
end process;

end Behavioral;
