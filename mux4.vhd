library IEEE;
use IEEE.std_logic_1164.all;

entity mux4 is
	port( 
		A1, A0 : in std_logic;
		I3, I2, I1, I0 : in std_logic;
		Y : out std_logic
	     );
end entity;

architecture behavioural of mux4 is
begin
	process(I3, I2, I1, I0, A1, A0)
	variable a: std_logic_vector(1 downto 0);
	
	begin
		a:=A1&A0;
		case a is
			when "00" => Y<=I0;
			when "01" => Y<=I1;
			when "10" => Y<=I2;
			when "11" => Y<=I3;
			when others => Y<=I0;
		end case;
	end process;

end architecture;
