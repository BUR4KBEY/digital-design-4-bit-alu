module top(
    input [1:0] screen,
    input [2:0] opcode,
    input [3:0] A,
    input [3:0] B,
    input carry_in,
    
    output carry_out,
    output overflow,
    output [11:0] bcd,
    output error
);
  alu u0(
    .screen(2'b00),
    .opcode(3'b000),
    .A(4'b1010),
    .B(4'b1100),
    .carry_in(1'b0),
    .carry_out_output(carry_out),
    .overflow(overflow),
    .bcd(bcd),
    .error(error)
  );
endmodule
