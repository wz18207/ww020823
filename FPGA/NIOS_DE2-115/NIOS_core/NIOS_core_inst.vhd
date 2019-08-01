	component NIOS_core is
		port (
			clk_clk       : in  std_logic                     := 'X';             -- clk
			key_export    : in  std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			ledg_export   : out std_logic_vector(7 downto 0);                     -- export
			ledr_export   : out std_logic_vector(15 downto 0);                    -- export
			reset_reset_n : in  std_logic                     := 'X';             -- reset_n
			sw_export     : in  std_logic_vector(15 downto 0) := (others => 'X')  -- export
		);
	end component NIOS_core;

	u0 : component NIOS_core
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			key_export    => CONNECTED_TO_key_export,    --   key.export
			ledg_export   => CONNECTED_TO_ledg_export,   --  ledg.export
			ledr_export   => CONNECTED_TO_ledr_export,   --  ledr.export
			reset_reset_n => CONNECTED_TO_reset_reset_n, -- reset.reset_n
			sw_export     => CONNECTED_TO_sw_export      --    sw.export
		);

