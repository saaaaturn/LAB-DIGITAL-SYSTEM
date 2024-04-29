module clock 
(
	input logic CLOCK_50,
	output logic clock_out
);

integer i = 0;

// Initialize output signal
assign clock_out = 1'b0;

always_ff @(posedge CLOCK_50)
begin 
	i<=i+1;
	if (i==2500000)
		begin 
			clock_out <= ~clock_out;
			i<=0;
		end
end

endmodule

module clock2 (
	input logic clock_in,
	output logic clock_out
);

reg [15:0] count;

always_ff @(posedge clock_in)
begin 
	count <= count + 1;
	if (count == 6250000)
		begin 
			clock_out <= ~clock_out;
			count<=0;
		end 
end

endmodule