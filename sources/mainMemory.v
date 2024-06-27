module MainMemoryModule(
    input wire clk,
    input wire [31:0] address,
    input wire readEnable,
    input wire writeEnable,
    input wire [31:0] dataIn,
    output reg [31:0] dataOut
);
    reg [31:0] memory[0:1023]; // Example size of 1024 entries, adjust as needed

    // Initial block for memory initialization
    initial begin
        memory[0] = 32'b00000000001000100001100000000000;
        // Initialize other memory locations as needed
    end

    // Synchronous read and write logic
    always @(posedge clk) begin
        if (writeEnable & !readEnable) begin
            memory[address] <= dataIn;
        end
        if (readEnable & !writeEnable) begin
            dataOut <= memory[address];
        end
    end
endmodule

