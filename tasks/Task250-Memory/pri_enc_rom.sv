module pri_enc_rom
#(parameter DATA_WIDTH=3, parameter ADDR_WIDTH=3)
(
	input [(ADDR_WIDTH-1):0] addr,
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0] = '{
	
		3'b111, 3'b110, 3'b101, 3'b101,
		3'b100, 3'b100, 3'b100, 3'b000
		
		}; /* synthesis romstyle = "M9K" */

	assign q = rom[addr];

endmodule