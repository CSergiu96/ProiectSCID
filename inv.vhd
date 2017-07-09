library ieee;
use ieee.std_logic_1164.all;


entity inv is                 -- declararea entitatii si 
                               -- interfetei portii and2
port (a: in  std_logic;      -- porturile de intrare
      F: out std_logic       -- portul de iesire      
      );
end inv;    

architecture primitive of inv is   -- descrierea arhitecturii 
begin
  
   F <= not a;                    -- descrierea functionarii  
                                    -- folosind functia logica not  
end primitive;    
