

`timescale 1ns / 1ps

module alu_control(
    input      [31:0] instruction,
    input      [2:0]  ALUOp,
    output reg [5:0]  ALUFn
);

always @(*)
begin
    case (ALUOp)
        3'b010: ALUFn = instruction[5:0];
        3'b000: ALUFn = 6'b000000;
        3'b001: ALUFn = 6'b000001;
        3'b011: ALUFn = 6'b000000;
        3'b100: ALUFn = 6'b000100;
        3'b101: ALUFn = 6'b000110;
        3'b110: ALUFn = 6'b001011;
        default: ALUFn = 6'b000000; // Default case to avoid latches
    endcase
end

endmodule
