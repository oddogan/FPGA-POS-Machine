`timescale 1ns / 1ps

module clkgenerator(clk);

    reg clk_sig;
    output wire clk;
    assign clk = clk_sig;

    initial 
        clk_sig = 0;

    initial 
        begin
            forever 
                #20 clk_sig=~clk_sig;//25MHz
        end

endmodule