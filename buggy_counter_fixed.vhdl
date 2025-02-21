```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity buggy_counter_fixed is
  port (
    clk : in std_logic;
    rst : in std_logic;
    count : out std_logic_vector(3 downto 0)
  );
end entity buggy_counter_fixed;

architecture behavioral of buggy_counter_fixed is
  signal internal_count : integer range 0 to 15 := 0;
begin
  process (clk, rst)
  begin
    if rst = '1' then
      internal_count <= 0;
    elsif rising_edge(clk) then
      if internal_count = 15 then
        internal_count <= 0;
      else
        internal_count <= internal_count + 1;
      end if;
    end if;
  end process;

  count <= std_logic_vector(to_unsigned(internal_count, count'length));

end architecture behavioral;
```