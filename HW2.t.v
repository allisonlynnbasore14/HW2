

`include "multiplexer.t.v"
`include "decoder.t.v"
`include "adder.t.v"

module testAll (); 

	testMultiplexer multiplexer ();
	testDecoder decoder ();
	testFullAdder adder ();

endmodule
