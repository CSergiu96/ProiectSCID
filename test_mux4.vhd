library IEEE;
use IEEE.std_logic_1164.all;

entity test_mux4 is
end test_mux4;

architecture testbench of test_mux4 is

	component mux4
		port(
			I0, I1, I2, I3, A0, A1 : in std_logic;
			Y : out std_logic
		     );
	end component;
	
	signal inI0, inI1, inI2, inI3, inA0, inA1, outY : std_logic;

	begin
		U1: mux4 port map( 
					I0 => inI0, I1 => inI1, 
					I2 => inI2, I3 => inI3,
					A0 => inA0, A1 => inA1, 		
					Y => outY
				  );
		gen_I0: process
		begin
			inI0 <= '0';
			wait for 0.5 ns;
			inI0 <= '1';
			wait for 0.5 ns;
		end process;

		gen_I1: process
		begin
			inI1 <= '0';
			wait for 1 ns;
			inI1 <= '1';
			wait for 1 ns;
		end process;

		gen_I2: process
		begin
			inI2 <= '0';
			wait for 1.5 ns;
			inI2 <= '1';
			wait for 1.5 ns;
		end process;

		gen_I3: process
		begin
			inI3 <= '0';
			wait for 2 ns;
			inI3 <= '1';
			wait for 2 ns;
		end process;

		gen_A0: process
		begin
			inA0 <= '0';
			wait for 5 ns;
			inA0 <= '1';
			wait for 5 ns;
		end process;
		gen_A1: process
		begin
			inA1 <= '0';
			wait for 8 ns;
			inA1 <= '1';
			wait for 8 ns;
		end process;

end testbench;