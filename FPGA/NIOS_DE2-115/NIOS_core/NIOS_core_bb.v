
module NIOS_core (
	clk_clk,
	key_export,
	ledg_export,
	ledr_export,
	reset_reset_n,
	sw_export);	

	input		clk_clk;
	input	[3:0]	key_export;
	output	[7:0]	ledg_export;
	output	[15:0]	ledr_export;
	input		reset_reset_n;
	input	[15:0]	sw_export;
endmodule
