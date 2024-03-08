`timescale 1ns/100ps
module top(info_bits, esti_bits, ham_dis);
input [11:0]info_bits;
output [11:0]esti_bits;
output [3:0]ham_dis;
wire [16:0]code;

ham_enc ham_enc0(info_bits, code);
ham_dec ham_dec0(code, esti_bits);
bit_com bit_com0(info_bits, esti_bits, ham_dis);

endmodule
