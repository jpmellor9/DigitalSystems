module d_ff (output logic Q, input logic D, CLK);

//D-Type Flip-Flop (without asynchronous reset)
always_ff @(posedge CLK) begin
	//Q is equal to D when the clock rises
	Q <= D;
end
	
endmodule
	
//D-Type Flip-Flop (with asynchronous reset)
module d_ff1 (output logic Q, input logic D, CLK, n_Reset);

always_ff @(posedge CLK,  negedge n_Reset) begin // if reset is low the output will go to 0 on the falling edge of the reset  
	//Reset takes precedence                 // the input changes on the rising edge of the clock when reset is high
	if (n_Reset == 1'b0)                     // so the input either changes due to clock or the reset.
		Q <= 0;
	else
		//Otherwise Q = D (and latches)
		Q <= D;
end
	
endmodule