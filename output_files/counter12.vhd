

Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;



--COUNTER, PRESCALER, Pulse_COUNT15, and
--Sensor COUNTER. The COUNTER
entity counter12 is
port(
clk : in std_logic;
counterofsec: out std_logic_vector(3 downto 0));
end counter12;


architecture behavioral12 of counter12 is 
signal tick_per_second : std_logic_vector(25 downto 0 );
signal counterofsec1: std_logic_vector(3 downto 0);
constant clk_in_binary : std_logic_vector(25 downto 0) := "10111110101111000010000000";
begin 
process(clk)
begin
if (clk='1') then
if (counterofsec1="1100")then
counterofsec1 <= "0000";
end if ;
if(tick_per_second<clk_in_binary) then
    tick_per_second<=tick_per_second+1;
else
    tick_per_second<="00000000000000000000000000";
    counterofsec1<=counterofsec1+'1';
end if ;
end if ;
end process;
counterofsec <=counterofsec1;

end Behavioral12;


