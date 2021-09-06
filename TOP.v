module TOP(clk,boton,rx,pwm1,pwm2,sseg,an,sensor,salidaled);

input clk;
input boton;
input rx;
input sensor;

output pwm1;
output pwm2;
output reg [7:0]an = 8'b01111111;
output [0:6]sseg;
output salidaled;

wire [7:0] num;
wire s;

Sensor (clk, sensor, s);
uart_rx(clk, s, rx, boton, num);
pwm (clk, num, pwm1);
pwm2 (clk, num, pwm2);
bcd2sseg(num,sseg);
leds(clk, num, salidaled);


endmodule 


