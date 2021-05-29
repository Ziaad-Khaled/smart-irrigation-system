LIBRARY ieee;
USE ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;




ENTITY MyProject IS 
PORT (
 Temp0,Temp1: In std_logic_vector(3 downto 0);                  --The two temperature digits (each in binary)
 Moisture:In std_logic_vector(2 downto 0);  							 --The moisture level (in bianary)
 Seg7_1, Seg7_2, Seg7_4 : Buffer std_logic_vector(6 downto 0);	 --To display the readings on the segment displays
 Operate : Out std_logic; 													 -- Our Output that "operates" the pump
 O_Led : Out std_logic  	)	;											 -- A Led to display the output for debugging
 END MyProject; 

 
 
 ARCHITECTURE Seg7 Of MyProject IS 

 BEGIN
 process(Temp0)
 
 --Temperature unit digit display on first 7 segment display
 begin
 
	case Temp0 is   
	 when "0000" => Seg7_1 <= "1000000"; ---0
	 when "0001" => Seg7_1 <= "1111001"; 
	 when "0010" => Seg7_1 <= "0100100";
	 when "0011" => Seg7_1 <= "0110000";
	 when "0100" => Seg7_1 <= "0011001";
	 when "0101" => Seg7_1 <= "0010010";
	 when "0110" => Seg7_1 <= "0000010";
	 when "0111" => Seg7_1 <= "1111000";
	 when "1000" => Seg7_1 <= "0000000";
	 when "1001" => Seg7_1 <= "0011000";
	 when Others => Seg7_1 <= "1111111";
	end case;
end process;


 --Temperature tenth digit display on second 7 segment display

 process(Temp1)
 
 begin
	case Temp1 is   
	 when "0000" => Seg7_2 <= "1000000"; ---0
	 when "0001" => Seg7_2 <= "1111001"; 
	 when "0010" => Seg7_2 <= "0100100";
	 when "0011" => Seg7_2 <= "0110000";
	 when "0100" => Seg7_2 <= "0011001";
	 when "0101" => Seg7_2 <= "0010010";
	 when "0110" => Seg7_2 <= "0000010";
	 when "0111" => Seg7_2 <= "1111000";
	 when "1000" => Seg7_2 <= "0000000";
	 when "1001" => Seg7_2 <= "0011000";
	 when Others => Seg7_2 <= "1111111";

	end case;
end process;


 --Moisture level (0-7) display on fourth 7 segment display

 process(Moisture)
 
 begin
	case Moisture is   
	 when "000" => Seg7_4 <= "1000000"; ---0
	 when "001" => Seg7_4 <= "1111001"; 
	 when "010" => Seg7_4 <= "0100100";
	 when "011" => Seg7_4 <= "0110000";
	 when "100" => Seg7_4 <= "0011001";
	 when "101" => Seg7_4 <= "0010010";
	 when "110" => Seg7_4 <= "0000010";
	 when "111" => Seg7_4 <= "1111000";
	 when Others => Seg7_4 <= "1111111";

	end case;
end process;

	process(Moisture,Temp0,Temp1)
	begin 
	
	if(Moisture>"100" or (Temp0>"0101" and Temp1>"0011") or (Temp1>"0100") ) then
	Operate<='1' ;
	O_Led<='1';
	else
	Operate<='0';
	O_Led<='0';
	End if;
	
	end process;
	
	

 
 END Seg7;
 
 
 

