`timescale 1ns / 1ps

module fsm_outputs(
		  input [3:0]  state,
		  output       enable_store,
		  output reg [1:0] location,
		  output reg [1:0] color_out
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

   localparam		       RED = 0;
   localparam		       YELLOW = 1;
   localparam		       GREEN = 2;
   localparam		       BLUE = 3;

   // write verilog here to create these signals:
   //
   //    enable_store, location[1:0], and color_out[1:0] 
   // 
   // from the current state.  You can use multiple always blocks or assign statements.
   //
   // Make sure a value is determined for every possible state, since this is a combinatorial module.
   
endmodule
   
