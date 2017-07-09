library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ic163 is
-- declarare structura numaratorului
	port (	
		clk, clrn, loadn, enp, ent : in std_logic;
		a, b, c, d : in std_logic;
		rco, qa, qb, qc, qd : out std_logic);

end entity;

architecture behavioral of ic163 is
-- declarare comportament numarator
signal counter : std_logic_vector(3 downto 0);
begin
	process (clk, clrn)
	begin
		-- initializare numarator
		if clrn = '0' then
			counter <= "0000";
		elsif rising_edge(clk) then
			-- incarcarea numaratorului cu valori
			if (loadn = '0') then
				counter <= d & c & b & a;
			elsif (enp = '1' and ent = '1') then
				counter <= counter + '1';	
			end if;
		end if;
	end process;
	
	qd <= counter(3) after 5 ns;
	qc <= counter(2) after 5 ns;
	qb <= counter(1) after 5 ns;
	qa <= counter(0) after 5 ns;
	rco <= '1' after 5 ns when (ent = '1' and counter = "1111")
	else '0' after 5 ns;

end architecture;
