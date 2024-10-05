`timescale 1ns / 1ps

module master_fsm(
		  input	       clk,
		  input	       prog_sw, 
		  input	       clr,
		  input [3:0]  combo_1,
		  input [3:0]  combo_2,
		  input [3:0]  combo_3,
		  input [3:0]  combo_4,
		  input [3:0]  combo_press,
		  input	       pressed,
		  output [3:0] state_out
		  );

   localparam		       IDLE = 0;
   localparam		       ONE_CORRECT = 1;
   localparam		       TWO_CORRECT = 2;
   localparam		       THREE_CORRECT = 3;
   localparam		       FOUR_CORRECT = 4;
   localparam		       ONE_WRONG = 5;
   localparam		       TWO_WRONG = 6;
   localparam		       THREE_WRONG = 7;
   localparam		       FOUR_WRONG = 8;
   localparam		       PROGRAM_MODE = 9;
   localparam		       ONE_SET = 10;
   localparam		       TWO_SET = 11;
   localparam		       THREE_SET = 12;
   localparam		       FOUR_SET = 13;

   reg [3:0]		       state = IDLE;
   reg [3:0]		       next_state;

   assign state_out = state;
   
   always @(posedge clk)
     begin
	state <= next_state;
     end

   always @(*)
     begin
	next_state = state;

	case (state)
	  IDLE:
	    if (prog_sw) begin
	       next_state = PROGRAM_MODE;
	    end else if (pressed) begin
	       if (combo_press == combo_1)
		 next_state = ONE_CORRECT;
	       else
		 next_state = ONE_WRONG;
	    end

	  PROGRAM_MODE:
	    if (~prog_sw) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       next_state = ONE_SET;
	    end

//
// Write the other cases to create the complete FSM.
// You will need to write the verilog for every state.
// Make sure if "clr" goes high, you go back to the IDLE state.
//

	  default:
	      next_state = IDLE;
	      
	endcase
     end

endmodule
   
