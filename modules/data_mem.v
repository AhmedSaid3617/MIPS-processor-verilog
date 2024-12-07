module data_mem (read_data, clk, mem_write, mem_read, write_data, address);

    output reg [31:0] read_data;
    input wire clk, mem_write, mem_read;
    input wire [31:0] write_data, address;

    reg [31:0] memory [0:4095];
    wire [11:0] address_needed;
    assign address_needed = address[12:2];

    initial begin
        memory[0] = 'h60;
        memory[1] = 'h70;
        memory[2] = 'h30;
    end

    always @(*) begin
        if (mem_read & !mem_write) begin
            read_data <= memory[address_needed];
        end
    end

    always @(posedge clk) begin
        if (mem_write & !mem_read) begin
            memory[address_needed] = write_data;
        end
    end

    integer i;
    initial begin
        #100
        $display("\nData memory:");
        for (i = 0; i<5; i=i+1) begin
            $display("%x", memory[i]);
        end
    end

endmodule