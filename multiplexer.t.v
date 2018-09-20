// Multiplexer testbench
`timescale 1 ns / 1 ps
`include "multiplexer.v"


module testMultiplexer ();
    reg in0, in1, in2, in3;
    reg addr0, addr1;
    wire out;

    //behavioralMultiplexer multiplexer (out, addr0,addr1,in0,in1,in2,in3);
    structuralMultiplexer multiplexer (out, addr0,addr1,in0,in1,in2,in3);


    initial begin

    $dumpfile("multiplexer.vcd");
    $dumpvars();

    $display("A0 A1| O0 O1 O2 O3 | Output | Expected Output");
    addr0=0;addr1=0;in0=1;in1=0;in2=0;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 00", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=0;in0=1;in1=0;in2=0;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 01", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=1;in0=1;in1=0;in2=0;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 02", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=1;in0=1;in1=0;in2=0;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 03", addr0, addr1, in0, in1, in2, in3, out);

    $display("----------------------------------");

    addr0=0;addr1=0;in0=0;in1=1;in2=0;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 00", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=0;in0=0;in1=1;in2=0;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 01", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=1;in0=0;in1=1;in2=0;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 02", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=1;in0=0;in1=1;in2=0;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 03", addr0, addr1, in0, in1, in2, in3, out);

    $display("----------------------------------");

    addr0=0;addr1=0;in0=0;in1=0;in2=1;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 00", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=0;in0=0;in1=0;in2=1;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 01", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=1;in0=0;in1=0;in2=1;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 02", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=1;in0=0;in1=0;in2=1;in3=0;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 03", addr0, addr1, in0, in1, in2, in3, out);

    $display("----------------------------------");

    addr0=0;addr1=0;in0=0;in1=0;in2=0;in3=1;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 00", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=0;in0=0;in1=0;in2=0;in3=1;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 01", addr0, addr1, in0, in1, in2, in3, out);
    addr0=0;addr1=1;in0=0;in1=0;in2=0;in3=1;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 02", addr0, addr1, in0, in1, in2, in3, out);
    addr0=1;addr1=1;in0=0;in1=0;in2=0;in3=1;#1000 
    $display("%b  %b | %b  %b  %b  %b | %b | Same As 03", addr0, addr1, in0, in1, in2, in3, out);

    $finish();

    end



endmodule


//iverilog -o hello hello.v
//./hello