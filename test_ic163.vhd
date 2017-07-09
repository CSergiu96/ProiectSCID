library IEEE;
use IEEE.std_logic_1164.all;

entity test_ic163 is
end entity;

architecture testbench of test_ic163 is 	
	component ic163 	
    		port( 	
			signal  clk, clrn, loadn, enp, ent, a, b, c, d : in   std_logic; 	
			signal  rco, qa, qb, qc, qd : out   std_logic
		     ); 	
	end component; 	
  	
	signal clk, clrn, loadn, enp, ent, a, b, c, d : std_logic; 	
	signal rco, qa, qb, qc, qd : std_logic; 	
	constant period : time := 40 ns;	
begin  	
  -- instan?ierea modulului testat 	
    UUT : ic163 port map (clk => clk, clrn => clrn, loadn => loadn, 	
    enp => enp, ent => ent, a => a, b => b, c => c, d => d, 	
    rco => rco, qa => qa, qb => qb, qc => qc, qd => qd); 	
     	
  -- scenariu 	
  scenario : process  	
  begin 	
    -- valori initiale 	
    clrn <= '1'; 	
    loadn <= '1'; 	
    a <= '0'; b <= '0'; c <= '1'; d <= '1'; 	
    enp <= '0'; ent <= '0'; 	
    wait for 28 ns; 	
    clrn <= '0';   -- activarea semnalului CLRN 	
    wait for 52 ns;  -- se mentine semnalul CLRN timp de 52 ns 	
    clrn <= '1'; 	

    loadn <= '0';  	-- activarea semnalului LOADN 	
    wait for period;  	-- mentinerea comenzii (1 ciclu de tact) 	
    loadn <= '1';  	-- dezactivarea semnalului LOADN 	
    enp <= '1';   	-- activarea semnalelor ENP si ENT 	
    ent <= '1'; 		
    wait for 6 * period; 	-- mentinerea comenzii (6 cicli de tact) 	
    enp <= '0';   	-- dezactivarea ENP 	
    wait for 3 * period; 	-- mentinerea comenzii (3 cicli de tact) 	
    enp <= '1';   	-- activarea ENP 	
    ent <= '0';   	-- dezactivarea ENT 	
    wait;    	-- astepta pana la infinit 	
  end process; 		
   		
  gen_clk : process 		
  begin 		
    clk <= '0'; 		
    wait for period / 2; 		
    clk <= '1'; 		
    wait for period / 2;  		
  end process; 		
     		
end testbench;		
