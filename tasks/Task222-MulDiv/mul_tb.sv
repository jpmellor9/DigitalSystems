module mul_tb;

parameter N = 4;

//These are unsigned by default
logic [2*N - 1 : 0] Y;
logic [N-1:0] A, B;

//Connect the multiplier
mul m1(Y,A,B);

initial
begin
automatic int S;
	for (int i=0; i<2**N; i=i+1)begin
         for (int j=0; j<2**N; j=j+1)begin
          A=i;
          B=j; 
          S = i*j;
          #10ps;
          assert (Y == S) $display("PASS %d x %d = %d", A, B, Y); else $display("ERROR %d", Y);
         end
          end     
end

endmodule