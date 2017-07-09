library IEEE;
use IEEE.std_logic_1164.all;

entity automat is    
--  descrhierea circuitului ca un bloc functional
	port(
		clk, clrn, ina, inb : in std_logic;
		state : out std_logic_vector(2 downto 0)
	    );
end entity;

architecture structural of automat is 
-- descrierea componentelor si legaturilor circuitului

	component ic163 is 
	-- declarare componenta : numarator
		port(
			clk, clrn, loadn, enp, ent, a, b, c, d : in std_logic;
			rco, qa, qb, qc, qd : out std_logic
		    );	
	end component;

	component inv is 
	-- declarare componenta : inversor
		port(
			a: in std_logic; 
			F: out std_logic 
		    );
	end component;

	component mux4 is 
	-- declarare componenta : mux4:1
		port( 
			A1, A0 : in std_logic;
			I3, I2, I1, I0 : in std_logic;
			Y : out std_logic
		     );
	end component;	

	signal loadn, qa, qb, qc : std_logic;
	signal net1, net2, net3 : std_logic;
	signal net_a, net_c : std_logic;
	signal a_n, b_n : std_logic;

	begin
		U0 : ic163 port map( 
					clk => clk, clrn => clrn,
					loadn => loadn, enp => '0', ent => '0',
					d => '0', c => net_c, b => qc, a => net_a,
					qc => qc, qb => qb, qa => qa 
				   );	
		U1 : mux4 port map(
					I0 => '1', I1 => '0',
					I2 => '0', I3 => '0',
					A0 => ina, A1 => '0', 		
					Y => a_n
				   );
		U2 : mux4 port map(
					I0 => '1', I1 => '0',
					I2 => '0', I3 => '0',
					A0 => inb, A1 => '0', 		
					Y => b_n
				   );
		U3 : mux4 port map(
					I0 => a_n, I1 => b_n,
					I2 => net1, I3 => a_n,
					A0 => qb, A1 => qc, 		
					Y => loadn
				   ); 
		U4 : mux4 port map(
					I0 => '0', I1 => b_n,
					I2 => '0', I3 => '0',
					A0 => qa, A1 => '0', 		
					Y => net1
				   );
		U5 : mux4 port map(
					I0 => '1', I1 => qa,
					I2 => net2, I3 => '0',
					A0 => qb, A1 => qc, 		
					Y => net_c
				   );
		U6 : mux4 port map(
					I0 => ina, I1 => '0',
					I2 => '0', I3 => '0',
					A0 => qa, A1 => '0', 		
					Y => net2
				   );
		U7 : mux4 port map(
					I0 => '0', I1 => qa,
					I2 => net3, I3 => '1',
					A0 => qb, A1 => qc, 		
					Y => net_a
				   );
		U8 : mux4 port map(
					I0 => a_n, I1 => '0',
					I2 => '0', I3 => '0',
					A0 => qa, A1 => '0', 		
					Y => net3
				   );

		state <= qc & qb & qa;

end architecture;