module mux2_structural (output logic y, input logic a, b, s);
// Write HDL here

wire M1, M2, nots;

not i1 (nots, s);
and A1 (M1, nots, a);
and A2 (M2, s, b);
or out (y, M1, M2);
endmodule