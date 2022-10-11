`timescale 1ns / 1ps
`default_nettype none

`define SIMULATION

module test_adder_1;
  logic a;
  logic b;
  logic c_in;
  wire sum, c_out;

  adder_1 UUT(a, b, c_in, sum, c_out);

  initial begin
    // Collect waveforms
    $dumpfile("adder_1.fst");
    $dumpvars(0, UUT);
    
    $display("a b c_in | sum c_out");
    for (int i = 0; i < 8; i = i + 1) begin
        a = i[2];
        b = i[1];
        c_in = i[0];
        #1 $display("%1b %2b %3b | %4b %5b", a, b, c_in, sum, c_out);
    end
        
    $finish;      
  end

endmodule