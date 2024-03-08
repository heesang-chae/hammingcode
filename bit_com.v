`timescale 1ns/100ps
module bit_com(info_bits, esti_bits, ham_dis);
input [11:0]info_bits, esti_bits;
output [3:0]ham_dis;
reg [3:0] ham_dis_1;

always @ (info_bits, esti_bits) begin
    ham_dis_1 = 0;
    ham_dis_1= (info_bits[11] ^ esti_bits[11]) + (info_bits[10] ^ esti_bits[10]) + (info_bits[9] ^ esti_bits[9]) + (info_bits[8] ^ esti_bits[8]) 
    + (info_bits[7] ^ esti_bits[7]) + (info_bits[6] ^ esti_bits[6]) + (info_bits[5] ^ esti_bits[5]) + (info_bits[4] ^ esti_bits[4]) 
    + (info_bits[3] ^ esti_bits[3]) + (info_bits[2] ^ esti_bits[2]) + (info_bits[1] ^ esti_bits[1]) + (info_bits[0] ^ esti_bits[0]);
end
assign ham_dis = ham_dis_1;
endmodule
