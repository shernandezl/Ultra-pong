module pwm2 (clk, in, pwm);

input clk;
input [7:0]in;
output reg pwm;

reg [27:0] contador;
reg [27:0] ciclo = 0;

always @(posedge clk) begin
		if(in=='h63|in=='h78|in=='h30) begin
			case(in)
				'h30: ciclo<=0;         // 0%
				'h63: ciclo<=20_000;    // 40%  
				'h78: ciclo<=50_000;    // 100%
			endcase 
		end
end


always @(posedge clk) begin
	contador=contador+1;
	
	if (contador == 50_000)begin
		contador=0;
	end
	
	if (contador <= ciclo)begin
		pwm=1;
	end else begin
		pwm=0;
	end
	
end

endmodule 