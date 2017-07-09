library IEEE;
use IEEE.std_logic_1164.all;


architecture testbench of circuit is
	component automat is
		port(	
			clk, clrn, ina, inb : in std_logic;
			state : out std_logic_vector(2 downto 0)
		    );
	end component;
	
	signal state : std_logic_vector (2 downto 0);

	begin

		UUT : automat port map(
					clk => clk, clrn => clrn, ina => ina,
					inb => inb, state => state
				      );
		gen_clk : process
		begin
			clk <= '0';
			wait for 10 ns;
			clk <= '1';
			wait for 10 ns;
		end process;

		scenariu : process
		begin
			wait for 20 ns;
			clrn <= '1';
			wait for 40 ns;
			ina <= '0';
			wait for 40 ns;
			inb <= '0';
			wait;
		end process;

end architecture;