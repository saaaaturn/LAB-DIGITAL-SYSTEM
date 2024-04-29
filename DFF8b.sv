module DFF8B
(
	input logic clk,
	input logic rst,
	input logic [7:0]D,
	output logic [7:0]Q
);

always_ff @(posedge clk or negedge rst)
begin 
	if (!rst)
	Q<= 8'b00000000;
	else 
	Q<= D;
end 
endmodule