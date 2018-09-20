// Adder circuit

`define AND and #50
`define OR or #50
`define NOT not #50
`define XOR xor #50

module behavioralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum, 
    output carryout,
    input a, 
    input b, 
    input carryin

);

 wire AxorB, AxorBxorC, AxorBC, AB;

 `XOR xorGate(AxorB, a, b);
 `XOR xorGate(sum, AxorB, carryin);
 `AND andGate(AB, a, b);
 `AND andGate(AxorBC, carryin, AxorB);
 `OR orGate( carryout, AB, AxorBC);



endmodule
