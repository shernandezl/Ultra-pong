module pwm (clk, in, pwm);

input clk;
input [7:0]in;
output reg pwm;

reg [27:0] contador;
reg [27:0] ciclo = 0;


always @(posedge clk) begin
		if(in=='h30|in=='h31|in=='h32|in=='h33|in=='h34
			|in=='h35|in=='h36|in=='h37|in=='h38|in=='h39) begin
			case(in)
				'h30: ciclo<=0;      // 0%  
				'h31: ciclo<=5_000;  // 10%
				'h32: ciclo<=10_000; // 20%
				'h33: ciclo<=15_000; // 30%
				'h34: ciclo<=20_000; // 40%
				'h35: ciclo<=25_000; // 50%
				'h36: ciclo<=30_000; // 60%
				'h37: ciclo<=35_000; // 70%
				'h38: ciclo<=40_000; // 80%
				'h39: ciclo<=45_000; // 90%
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