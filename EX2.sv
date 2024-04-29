module EX2
(
	input logic clk_sys,				//KEY1
	input logic rst_sys,				//KEY0
	input logic cin_sys,				
	input logic [7:0] data_in,		//SW
	output logic [7:0] data_out,	//LEDR
	output logic overf,				//LEDG
	output logic c_o					//LEDG
);

wire [7:0] ff1_to_as;
wire [7:0] ff2_to_as;
wire as_co;
wire as_overflow;
//Instantiate ADDER 8 bit:
AS8B calc
(
	.A (ff1_to_as),
	.B (ff2_to_as),
	.cin (cin_sys),
	.sum (data_out),
	.cout(as_co),
	.v_flag(as_overflow)
);
	

//Because we have 4 D-flip flops so we need to instantiate them:
// D-flip flop no.1	----> INTO ADDER
DFF8B dff_inst1 			
(
	.clk (clk_sys),
	.rst (rst_sys),
	.D (data_in),
	.Q (ff1_to_as)
);

// D-flip flop no.2	----> OUTA ADDER
DFF8B dff_inst2
(
	.clk (clk_sys),
	.rst (rst_sys),
	.D (data_out),
	.Q (ff2_to_as)
);

// D-flip flop no.3	----> OVERFLOW FLAG
DFF1B dff_inst3
(
	.clk (clk_sys),
	.rst (rst_sys),
	.D (as_overflow),
	.Q (overf)
);	

// D-flip flop no.4	----> c_o FLAG
DFF1B dff_inst4
(
	.clk (clk_sys),
	.rst (rst_sys),
	.D (as_co),
	.Q (c_o)
);

endmodule

	