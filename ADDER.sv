module AS8B	
(
	input logic [7:0]A,B,	//INPUT A AND B
	input logic cin,			//INPUT cinERATOR
	output logic [7:0]sum, 	//RESULT
	output logic cout, 		//FINAL CARRY OUT
	output logic v_flag		//OVER FLOW
);
	
logic [7:0] co; 				//CARRY OUT

AS1B as0( .a(A[0]), .b(B[0]^cin), .cin(cin),	  .s(sum[0]), .cout(co[0]));
AS1B as1( .a(A[1]), .b(B[1]^cin), .cin(co[0]), .s(sum[1]), .cout(co[1]));
AS1B as2( .a(A[2]), .b(B[2]^cin), .cin(co[1]), .s(sum[2]), .cout(co[2]));
AS1B as3( .a(A[3]), .b(B[3]^cin), .cin(co[2]), .s(sum[3]), .cout(co[3]));
AS1B as4( .a(A[4]), .b(B[4]^cin), .cin(co[3]), .s(sum[4]), .cout(co[4]));
AS1B as5( .a(A[5]), .b(B[5]^cin), .cin(co[4]), .s(sum[5]), .cout(co[5]));
AS1B as6( .a(A[6]), .b(B[6]^cin), .cin(co[5]), .s(sum[6]), .cout(co[6]));
AS1B as7( .a(A[7]), .b(B[7]^cin), .cin(co[6]), .s(sum[7]), .cout(co[7]));
assign cout= co[7];
assign v_flag = co[7] ^ co[6];
endmodule

module AS1B
(
	input logic a,
	input logic b,
	input logic cin,
	output logic s,
	output logic cout
);
assign s=a^b^cin;
assign cout = (a & b)| (cin & (a ^ b));
endmodule