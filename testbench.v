`timescale 1ns/100ps
module tb_top();
reg [11:0]info_bits;
wire [11:0]esti_bits;
wire [3:0]ham_dis;

//top module instantiation
top top0(info_bits, esti_bits, ham_dis);

initial begin
	info_bits = 12'b0110_1001_1111;
	#1
	info_bits = 12'b0000_1001_1111;
	#1
	info_bits = 12'b0110_1001_1001;
	#1
	info_bits = 12'b0110_1011_1011;
	#1
	info_bits = 12'b0000_1001_1101;
	#1
	info_bits = 12'b0110_1101_0000;
	#1
	info_bits = 12'b0100_0000_0111;
	#1
	info_bits = 12'b1111_1001_1100;
	#1
	info_bits = 12'b0110_1011_1010;
	
end
endmodule

module tb_ham_enc();
reg [11:0]info_bits;
wire [16:0]codeword;
ham_enc ham_enc0(.info_bits(info_bits), .codeword(codeword));
initial begin

	info_bits = 12'b0000_0101_1010;
	#20
	info_bits = 12'b0011_0101_1110;
	#20
	info_bits = 12'b0100_0101_1010;
	#20
	info_bits = 12'b1001_0101_0110;
	#20
	info_bits = 12'b0010_0111_1010;
	#20
	info_bits = 12'b1000_0001_1000;
	

end

endmodule

module tb_ham_dec();
reg [16:0]codeword;
wire [11:0]esti_bits;
ham_dec hem_dec0 (codeword, esti_bits);
initial begin
	codeword = 17'b00000_0000_0000_0000;
	#20
	codeword = 17'b00000_1100_0001_0110;
	#20
	codeword = 17'b00101_0101_0000_0011;
	#20
	codeword = 17'b00010_1100_0011_0010;
	#20
	codeword = 17'b00110_1001_1001_1001;
	#20
	codeword = 17'b01110_0110_0110_0010;

end

endmodule

module tb_bit_com();
reg [11:0]info_bits, esti_bits;
wire [3:0]ham_dis;

bit_com bit_com0(.info_bits(info_bits), .esti_bits(esti_bits), .ham_dis(ham_dis));

initial begin

	info_bits = 12'b0000_0001_1111;
	esti_bits = 12'b0000_0001_1111; 
	#20
	info_bits = 12'b0110_0001_1111;
	esti_bits = 12'b0000_0001_1101; 
	#20
	info_bits = 12'b0011_0001_1111;
	esti_bits = 12'b0010_0001_1010; 
	#20
	info_bits = 12'b0110_0101_1010;
	esti_bits = 12'b1100_0001_1101; 
	#20
	info_bits = 12'b0001_0001_1001;
	esti_bits = 12'b0000_1001_1001; 
	#20
	info_bits = 12'b1111_0001_1111;
	esti_bits = 12'b0000_0001_1001; 
	
end
endmodule
