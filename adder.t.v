// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg addr0, addr1, carryin;
    wire sum, carryout;

    //behavioralFullAdder adder (sum, carryout, addr0, addr1, carryin);
    structuralFullAdder adder(sum, carryout, addr0, addr1, carryin);
    
    initial begin

    $dumpfile("adder.vcd");
    $dumpvars();

    $display("A B| CarryIn | CarryOut | Carry Out Should Be | Sum | Sum Should Be");

    addr0=0;addr1=0;carryin=0; #1000 
    $display("%b  %b | %b | %b | False | %b | False", addr0, addr1, carryin, carryout, sum );
    addr0=0;addr1=0;carryin=1; #1000 
    $display("%b  %b | %b | %b | False | %b | True", addr0, addr1, carryin, carryout, sum );

    addr0=0;addr1=1;carryin=0; #1000 
    $display("%b  %b | %b | %b | False | %b | True", addr0, addr1, carryin, carryout, sum );
    addr0=0;addr1=1;carryin=1; #1000 
    $display("%b  %b | %b | %b | True  | %b | False", addr0, addr1, carryin, carryout, sum );

    addr0=1;addr1=0;carryin=0; #1000 
    $display("%b  %b | %b | %b | False | %b | True", addr0, addr1, carryin, carryout, sum );
    addr0=1;addr1=0;carryin=1; #1000 
    $display("%b  %b | %b | %b | True  | %b | False", addr0, addr1, carryin, carryout, sum );

    addr0=1;addr1=1;carryin=0; #1000 
    $display("%b  %b | %b | %b | True  | %b | False", addr0, addr1, carryin, carryout, sum );
    addr0=1;addr1=1;carryin=1; #1000 
    $display("%b  %b | %b | %b | True  | %b | True", addr0, addr1, carryin, carryout, sum );

    $finish();

    end

endmodule
