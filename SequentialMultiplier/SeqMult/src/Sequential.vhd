-------------------------------------------------------------------------------
--
-- Title       : seq_ent
-- Design      : SeqMult
-- Author      : khater
-- Company     : TFE
--
-------------------------------------------------------------------------------
--
-- File        : Sequential.vhd
-- Generated   : Mon Apr 23 23:32:36 2018
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {seq_ent} architecture {seq_arch}}


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity seq_ent is
	 port(
		 m : in STD_LOGIC_VECTOR(7 downto 0);
		 q : in STD_LOGIC_VECTOR(7 downto 0);
		 prod : out STD_LOGIC_VECTOR(15 downto 0); 
		 clk : in std_logic
	     );
end seq_ent;

--}} End of automatically maintained section

architecture behavior of seq_ent is	 	 
signal c_tmp:std_logic_vector(8 downto 0); 
signal s_tmp:std_logic_vector(7 downto 0);
begin	
	process(clk) 
	variable acc:std_logic_vector(16 downto 0);
	begin  	
	acc(7 downto 0) := q;
	acc(16 downto 8) := "000000000";
	N1:for i in 0 to 7 loop	 
		c_tmp <= "000000000";	 
		if (acc(0) = '1') then 
			for j in 0 to 7 loop
			c_tmp(j + 1) <= (acc(j + 8) and m(j)) or (m(j) and c_tmp(j)) or (acc(j + 8) and c_tmp(j));
			acc(j + 8) := acc(j + 8) xor m(j) xor c_tmp(j);
			end loop;
		end if;		
		acc(16 downto 0) := c_tmp(8) & acc(16 downto 1);
	end loop;	
	prod(15 downto 0) <= acc(15 downto 0);
	end process;
end architecture;
	
		
		


