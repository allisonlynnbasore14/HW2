// Decoder circuit


`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);


  wire nA;
  wire nB;

  `NOT Ainv(nA, address0);
  `NOT Binv(nB, address1);

  `AND OutZero(out0, nA, enable, nB);

  `AND OutTwo(out2, nA, enable, address1);

  `AND OutOne(out1, address0, enable, nB);

  `AND OutThree(out3, address0, enable, address1);


endmodule

