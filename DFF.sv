module DFF1B
(
	input logic clk,
	input logic rst,
	input logic D,
	output logic Q
);

always_ff @(posedge clk or negedge rst)
begin 
	if (!rst)
	Q<= 1'b0;
	else 
	Q<= D;
end 
endmodule