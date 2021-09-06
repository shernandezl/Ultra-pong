module Sensor (clk, entrada, salida);

input clk;
input  entrada;

output reg salida;

reg detecta=0;
reg [28:0] c=0;

always @(posedge clk) begin
	case(entrada)
		'b0: detecta<=1; 
		'b1: detecta<=0;
	endcase
end

always @(posedge clk) begin
	if(detecta) begin c<=0; salida<=1; end
	else if(c<300_000_000) begin
		c<=c+1;
	end
	if(c==300_000_000) salida<=0;
end


endmodule 