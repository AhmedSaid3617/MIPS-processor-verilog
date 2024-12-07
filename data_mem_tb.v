`include "modules/data_mem.v"

module top ();

    wire [31:0] read_data;
    reg clk, mem_write, mem_read;
    reg [31:0] write_data, address;

    data_mem RAM(read_data, clk, mem_write, mem_read, write_data, address);

    integer i;
    initial begin
        clk <= 0;
        for (i = 0; i<20; i = i + 1) begin
            #1
            clk <= ~ clk;
        end
    end

    initial begin
        mem_read = 1;
        address <= 1;
        #5
        address <= 4;
        #5
        address <= 11;
        #5
        mem_read = 0;
        mem_write = 1;
        address = 'h1f;
        write_data = 'habcdef78;
        #5;
        mem_write = 0;
        address = 'h1c;
        mem_read = 1;
    end

    initial begin
        $monitor("Time %d: Address: %x \tInstruction: %x", $time, address, read_data); 
    end

endmodule