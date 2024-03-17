module morse_encoder(key,dot,dash,ssd);
input [1:0] key;
input dot;
input dash;
output wire [6:0] ssd;
parameter a_in = 5'b00100,
			b_in = 5'b01101,
			c_in = 5'b00111;
parameter inp = 2'b00,
			resetn = 2'b01,
			disp1 = 2'b10;
reg [2:0] counter;
reg [4:0] shift_reg;
reg [6:0] outp;
reg [1:0] ps,ns;
reg [1:0] state = 2'b00;
reg DOT = 1'b0;
reg DASH = 1'b0;


always @(negedge dot)
	DOT = ~DOT;
	
always @(negedge dash)
	DASH = ~DASH;
	
always @(key)
begin
	if(key[0])
		ps <= 2'b01;
	else
		ps <= ns;
	end 
always @(DOT,DASH)
begin
	if(DASH)begin
		shift_reg <= {shift_reg[3:0],1'b1};
	end 
				
	else if(DOT)begin
		shift_reg <= {shift_reg[3:0],1'b0};
	end
		$display("%b",shift_reg);
end	
always @(key or ps)
begin
	case(ps)
		resetn:begin
			if(!key[1] && !key[0])begin
				ns<=2'b00;
				outp = 7'b1111110;
			end else if(key[1] && !key[0])begin
				ns <= 2'b10;
				outp = 7'b1111111;
			end else begin
				ns <= 2'b01;
				outp = 7'b1111111;
			end
		inp:begin
				if(key[1] && !key[0])begin
					ns <= 2'b10;
				end else begin
					ns <= 2'b01;
				end
			end
		disp1:begin
		//disp4(shift_reg,ssd);
					if(!key[1] && !key[0])begin
						ns<=2'b00;
					end
				end
			end
	endcase
	//disp4(shift_reg,ssd);
	end
	disp4(shift_reg,ssd);
	endmodule
	