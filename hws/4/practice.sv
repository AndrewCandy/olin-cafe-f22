`timescale 1ns/1ps
`default_nettype none

module dflipflop(q, d, clk, reset);
    output logic q;
    input wire d, clk, reset; 
    always @(posedge clk) begin
        if (reset == 1'b1) //If not at reset
            q = 1'b0;
        else 
            q = d;
    end
endmodule


module practice(rst, clk, ena, seed, out);

input wire rst, clk, ena, seed;
output logic out;
logic internal[1:0];
wire inter_flop[3:2];

dflipflop dflipflop_a(
    .clk (clk),
    .reset (rst),
    .d (internal[1]),
    .q (inter_flop[2])
);

dflipflop dflipflop_b(
    .clk (clk),
    .reset (rst),
    .d (inter_flop[2]),
    .q (inter_flop[3])
);

dflipflop dflipflop_c(
    .clk (clk),
    .reset (rst),
    .d (inter_flop[3]),
    .q (out)
);

always_comb internal[0] = inter_flop[2] ^ inter_flop[3];
always_comb internal[1] = ena ? seed : internal[0];

endmodule
