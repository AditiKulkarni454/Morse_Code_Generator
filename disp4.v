module disp4(shift,output1);
input [4:0]shift;
output reg [6:0]output1;
reg [6:0] temp;
always @(shift)
begin
case(shift)
5'b00101 : temp = 7'b1100000;
5'b00001 : temp = 7'b0001000;
5'b00111 : temp = 7'b0110001;
//4'b0011 : o = 7'b0000110;
//4'b0100 : o = 7'b1001100;
//4'b0101 : o = 7'b0100100;
//4'b0110 : o = 7'b0100000;
//4'b0111 : o = 7'b00]01111;
//4'b1000 : o = 7'b0000000;
//4'b1001 : o = 7'b0000100;
//4'b1010 : o = 7'b0000010;
//4'b1011 : o = 7'b1100000;
//4'b1100 : o = 7'b0110001;
//4'b1101 : o = 7'b1000010;
//4'b1110 : o = 7'b0110000;
//4'b1111 : o = 7'b0111000;
endcase
output1 <= {temp[6:0]};
end
endmodule