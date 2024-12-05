module top ();
    
    reg clk;
    reg  [31:0] address;
    wire [31:0] instruction;

    i_memory mips_i_memory(.instruction(instruction), .address(address), .clk(clk));

    integer i;
    initial begin
        clk <= 0;
        for (i = 0; i<20; i = i + 1) begin
            #1
            clk <= ~ clk;
        end
    end

    initial begin
        address <= 1;
        #5
        address <= 2;
        #5
        address <= 0;
    end
    
    initial begin
        $monitor("Time %d: Address: %x \tInstruction: %x", $time, address, instruction); 
    end

    

endmodule