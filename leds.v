module leds(clk,num,salidaled);

input clk;
input [7:0]num;
output reg salidaled;

always @(posedge clk) begin
	if(num=='h63|num=='h78|num=='h30|num=='h31|num=='h32|num=='h33|
		num=='h34|num=='h35|num=='h36|num=='h37|num=='h38|num=='h39) begin
		if(num=='h30) salidaled<=0;
		else          salidaled<=1;
	end
end

endmodule 