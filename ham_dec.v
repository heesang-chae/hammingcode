`timescale 1ns/100ps
module ham_dec(codeword, esti_bits);
input [16:0]codeword;
output [11:0]esti_bits;
reg [11:0]esti_bits_1;
reg [4:0] syndrome; 
reg [16:0] temporarycode;
parameter [4:0] No_error = 5'b00000;

always @ (codeword) begin
    syndrome[4] = codeword[16]^codeword[15];
    syndrome[3] = codeword[14]^codeword[13]^codeword[12]^codeword[11]^codeword[10]^codeword[9]^codeword[8]^codeword[7];
    syndrome[2] = codeword[14]^codeword[13]^codeword[12]^codeword[11]^codeword[6]^codeword[5]^codeword[4]^codeword[3];
    syndrome[1] = codeword[14]^codeword[13]^codeword[10]^codeword[9]^codeword[6]^codeword[5]^codeword[2]^codeword[1];
    syndrome[0] = codeword[16]^codeword[14]^codeword[12]^codeword[10]^codeword[8]^codeword[6]^codeword[4]^codeword[2]^~codeword[0]; //codeword[0] error 내줌
    temporarycode = codeword; //임시로 codeword 저장
    
    case (syndrome) 
        No_error : begin //syndrome = 0 이면 error 없으므로 그대로 값 저장
            esti_bits_1[11] = temporarycode[16];
            esti_bits_1[10:4] = temporarycode[14:8]; 
            esti_bits_1[3:1] = temporarycode[6:4];
            esti_bits_1[0] = temporarycode[2];
         end 
        default : begin
            temporarycode[syndrome-'b1] = ~temporarycode[syndrome-'b1];  //Error correcting
            esti_bits_1[11] = temporarycode[16];
            esti_bits_1[10:4] = temporarycode[14:8]; 
            esti_bits_1[3:1] = temporarycode[6:4];
            esti_bits_1[0] = temporarycode[2];
        end
    endcase
end
assign esti_bits = esti_bits_1;
endmodule
