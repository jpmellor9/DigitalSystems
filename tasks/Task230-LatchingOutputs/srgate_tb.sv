module srgate_tb;

logic Q, Qbar, S, R;

srgate u1(Q, Qbar, S, R);

initial
begin

#100ps;
assert(Q===1'bx) $display("PASS"); else $error("ERROR");
assert(Qbar===1'bx) $display("PASS"); else $error("ERROR");

{S,R} = 2'b00;
#100ps
assert(Q===1'bx) $display("PASS"); else $error("ERROR");
assert(Qbar===1'bx) $display("PASS"); else $error("ERROR");

{S,R} = 2'b10;
#100ps
assert(Q===1'b1) $display("PASS"); else $error("ERROR");
assert(Qbar===1'b0) $display("PASS"); else $error("ERROR");

{S,R} = 2'b00;
#100ps
assert(Q===1'b1) $display("PASS"); else $error("ERROR");
assert(Qbar===1'b0) $display("PASS"); else $error("ERROR");

{S,R} = 2'b01;
#100ps
assert(Q===1'b0) $display("PASS"); else $error("ERROR");
assert(Qbar===1'b1) $display("PASS"); else $error("ERROR");

{S,R} = 2'b00;
#100ps
assert(Q===1'b0) $display("PASS"); else $error("ERROR");
assert(Qbar===1'b1) $display("PASS"); else $error("ERROR");

{S,R} = 2'b11;
#100ps
assert(Q===1'bz) $display("PASS"); else $error("ERROR");
assert(Qbar===1'bz) $display("PASS"); else $error("ERROR");

end
endmodule