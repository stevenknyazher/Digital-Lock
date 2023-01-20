library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FSM is
    Port( clk : in std_logic;
          reset : in std_logic;
          n : in std_logic;
          code : in std_logic_vector(3 downto 0);
          unlock : out std_logic);
end entity FSM;

architecture Behavioral of FSM is
    type state_type is (S0, S1, S2, S3, ERR);
    signal current_state, next_state : state_type;
    
begin

    process(clk, reset, current_state)
    begin
        if (reset = '1' or current_state = ERR or current_state = S3) then
            current_state <= S0;
        elsif (rising_edge(clk)) then
            current_state <= next_state;
        end if;
    end process;
    
    process(current_state, code, n)
    begin
        case current_state is
            when S0 =>
                if (n = '1') then
                    if (code = "0110") then
                        next_state <= S1;
                        unlock <= '0';
                    else
                        next_state <= ERR;
                    end if;
                else
                    next_state <= current_state;
                end if;
            when S1 =>
                if (n = '1') then
                    if (code = "0001") then
                        next_state <= S2;
                        unlock <= '0';
                    else
                        next_state <= ERR;
                    end if;
                else
                    next_state <= current_state;
                end if;
            when S2 =>
                if (n = '1') then
                    if (code = "1001") then
                        next_state <= S3;
                        unlock <= '1';
                    else
                        next_state <= ERR;
                    end if;
                else
                    next_state <= current_state;
                end if;
            when others =>
                next_state <= ERR;
        end case;
    end process;
    
end Behavioral;
