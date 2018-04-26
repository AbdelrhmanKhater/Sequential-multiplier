library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

	-- Add your library and packages declaration here ...

entity seq_ent_tb is
end seq_ent_tb;

architecture TB_ARCHITECTURE of seq_ent_tb is
	-- Component declaration of the tested unit
	component seq_ent
	port(
		m : in STD_LOGIC_VECTOR(7 downto 0);
		q : in STD_LOGIC_VECTOR(7 downto 0);
		prod : out STD_LOGIC_VECTOR(15 downto 0);
		clk : in STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal m : STD_LOGIC_VECTOR(7 downto 0);
	signal q : STD_LOGIC_VECTOR(7 downto 0);
	signal clk : STD_LOGIC;
	-- Observed signals - signals mapped to the output ports of tested entity
	signal prod : STD_LOGIC_VECTOR(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : seq_ent
		port map (
			m => m,
			q => q,
			prod => prod,
			clk => clk
		);

	-- Add your stimulus here ...
	 process
	begin	
		clk <= '0';
		q <= "00000100";
		m <= "00000100";
		wait for 100 ns;
		clk <= '1';
		q <= "00000100";
		m <= "00000010";
		wait for 100 ns;  
		end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_seq_ent of seq_ent_tb is
	for TB_ARCHITECTURE
		for UUT : seq_ent
			use entity work.seq_ent(behavior);
		end for;
	end for;
end TESTBENCH_FOR_seq_ent;

