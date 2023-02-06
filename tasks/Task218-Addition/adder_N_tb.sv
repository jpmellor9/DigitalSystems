module adder_N_tb;

	parameter N = 3;

	logic [N-1:0] P, P2, Q, Q2;
	logic [N-1:0] SUM, SUM2;
	logic Cout, Cout2;
	logic Cin, Cin2;
	
	//Most significant bit of SUM = Cout
	adder_N #(.N(N)) u1(SUM, Cout, P, Q, Cin);
        ripple_adder #(.N(N)) u2(SUM2, Cout2, P2, Q2, Cin2);

	initial 
	begin
	  automatic int S, S2;
	  for (int c = 0; c<= 1; c = c + 1) begin
            Cin = c;
            Cin = c;
	    for (int i=0; i<2**N; i = i + 1) begin
              for (int j=i; j<2**N; j = j + 1) begin
                P = i;
                P2 = i;
                Q = j;
                Q2 = j;
		S = c + i + j;	//Integer summation
                S2 = c + i + j;
                #10ps;
		assert ({Cout,SUM} == S) $display("PASS"); else $display("ERROR %d + %d + %d <> %d", c, i, j, SUM);
                assert ({Cout2,SUM2} == S2) $display("PASS"); else $display("ERROR %d + %d + %d <> %d", c, i, j, SUM2);

              end
            end
	  end
	end
endmodule
