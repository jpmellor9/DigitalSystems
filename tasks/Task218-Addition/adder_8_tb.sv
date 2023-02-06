module adder_8_tb;

parameter N = 4;
parameter M = N*2;
// examples 01011010+11000011
logic [M-1:0] A, B; // the below just define the test variables 
logic [M-1:0] SUM;
logic Cout1, Cout2;

adder_N #(.N(N)) u1(SUM[N-1:0], Cout1, A[N-1:0], B[N-1:0], 0); // example 1010 would go into A and 0011 would go into B and be added and output the sum and cout
adder_N #(.N(N)) u2(SUM[M-1:N], Cout2, A[M-1:N], B[M-1:N], Cout1); // example 0101 would go into A and 0011 would go into B with the Cout from the first adder and output sum and cout

initial
begin
automatic int S;
for (int i=0; i<2**M; i=i+1)begin
 for (int j=i; j<2**M; j=j+1)begin
  A = i; // the numbers here are just inputted into the moudules u1 and u2 above
  B = j;
  S = i+j;
  #10ps;
  assert ({Cout2,SUM} == S) $display("PASS"); else $display("ERROR %d + %d <> %d", A, B, SUM);
  end 
  end 
  end 
endmodule
