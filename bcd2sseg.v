module bcd2sseg(BCD,sseg);

input [3:0] BCD;
output reg [0:6] sseg;

always@(*)begin

case(BCD)

4'b0000:sseg=7'b0000001;
4'b0001:sseg=7'b1001111;
4'b0010:sseg=7'b0010010;
4'b0011:sseg=7'b0000110;
4'b0100:sseg=7'b1001100;
4'b0101:sseg=7'b0100100;
4'b0110:sseg=7'b0100000;
4'b0111:sseg=7'b0001111;
4'b1000:sseg=7'b0000000;
4'b1001:sseg=7'b0000100;
4'b1010:sseg=7'b0001000;
4'b1011:sseg=7'b1100000;
4'b1100:sseg=7'b0110001;
4'b1101:sseg=7'b1000010;
4'b1110:sseg=7'b0110000;
4'b1111:sseg=7'b0111000;

default:
sseg=7'b1111111;

endcase

end
endmodule 