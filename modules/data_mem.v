module data_mem (read_data, clk, mem_write, mem_read, write_data, address);

    output reg [31:0] read_data;
    input wire clk, mem_write, mem_read;
    input wire [31:0] write_data, address;

    reg [31:0] memory [0:4095];
    wire [11:0] address_needed;
    assign address_needed = address[12:2];

    initial begin
        memory[0] = 'h00305060;
        memory[1] = 'h40ffffff;
        memory[2] = 'h80ffffff;
    end

    always @(*) begin
        if (mem_read) begin
            read_data <= memory[address_needed];
        end
        else if (mem_write) begin
            memory[address_needed] = write_data;
        end
    end

endmodule