// Multiplexer circuit

`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);

  wire Naddress0, Naddress1, Nadd1Nadd2, ZeroOut, OneOut, TwoOut, ThreeOut, Nadd1add2, add1Nadd2, add1add2, outVal2, outVal1;

  `NOT addInv(Naddress0, address0);
  `NOT addInv(Naddress1, address1);
  `AND andgate(Nadd1Nadd2, Naddress0, Naddress1);
  `AND andgate(ZeroOut, in0, Nadd1Nadd2);

  `AND andgate(add1Nadd2, address0, Naddress1);
  `AND andgate(OneOut, in1, add1Nadd2);


  `AND andgate(Nadd1add2, Naddress0, address1);
  `AND andgate(TwoOut, in2, Nadd1add2);


  `AND andgate(add1add2, address0, address1);
  `AND andgate(ThreeOut, in3, add1add2);


  `OR orgate(outVal1, ZeroOut, OneOut);
  `OR orgate(outVal2, TwoOut, outVal1);

  `OR orgate(out, outVal2, ThreeOut);



endmodule

