module invN_tb;

reg[3:0] X;
reg[3:0] Y;

reg[3:0] mt;

invN u1 (Y,X);

initial
begin

assign {X} = mt;

mt = 0;
#100ps assert (Y==4'b0101) $display("passed %b", mt); else $error("Failed for %b", mt);

mt = 1;
#100ps assert (Y==4'b0100) $display("passed %b", mt); else $error("Failed for %b", mt);

mt = 2;
#100ps assert (Y==4'b0111) $display("passed %b", mt); else $error("Failed for %b", mt);

mt = 3;
#100ps assert (Y==4'b0110) $display("passed %b", mt); else $error("Failed for %b", mt);


end

endmodule