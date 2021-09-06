module uart_rx(clk,s,rx,reset,dato);

input clk;
input s;
input rx;
input reset;
output reg [7:0] dato=8'b0;
 
parameter NO_LEER=1'b0, LEER=1'b1;
reg status;
reg iniciar;
reg [8:0] contador;
reg tick;
reg [4:0] c;
reg control;
reg [3:0] numero_bits;
reg [7:0] temp;
reg done;

initial begin
	status=NO_LEER;
	done=1'b0;
	iniciar=1'b0;
	contador=9'b0;
	c=5'b0;
	tick=1'b0;
	control=1'b1;
	numero_bits=4'b0;
	temp=8'b0;
	
end	

always@(posedge clk)begin

	case (status)
		NO_LEER: begin
			iniciar=0;
			if((!rx && !done))begin
				status=LEER;
			end
		end
		LEER: begin
			iniciar=1;
			if(done && rx)begin
				status=NO_LEER;
			end
		end
	
	endcase

end


always@(posedge clk)begin //divisor de frecuencia x16

	// 9600 Hz  x 16 = 153_600 Hz
	// 50MHZ/(153_600 Hz x 2) = 162,7 pulsos
	
	if(contador<163)begin
		contador=contador+1;
	end
	else begin
		contador=9'b0;
		tick=!tick;
	end
end

always@(posedge tick)begin
	if(!reset)begin
		dato=0;
	end
	
	if(iniciar && reset)begin
		c=c+1;
		if((c==8) && control)begin
			control=1'b0;
			c=0;
		end
		if((c==16) && (!control) && numero_bits<9)begin
			temp = {rx,temp[7:1]};
			numero_bits=numero_bits+1;
			c=0;
		end
		if(numero_bits==8 && c==8 && rx )begin
			control=1'b1;
			c=1'b0;
			done=1'b1;
			numero_bits=4'b0;
			dato=temp;
			temp=8'b0;
			
		end
	
	end
	else begin
		done=0;
	end
	if(s==0) dato<='h30;

end




endmodule 