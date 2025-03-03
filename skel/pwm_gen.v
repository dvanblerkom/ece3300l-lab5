`timescale 1ns / 1ps

// each instance of pwm_gen can be programmed with the parameter PWM_PERCENT to 
// output a different duty cycle.

module pwm_gen #(parameter PWM_PERCENT = 25) (
	      input  clk,
	      output pwm_out
	 );

   reg [11:0] pwm_cnt = 0;
		 
   always @(posedge clk)
     begin
	pwm_cnt <= pwm_cnt + 1;
     end

   // the 12-bit counter goes from 0 to 4095
   //  we want to check if pwm_cnt < (PWM_PERCENT / 100) * 4096
   //  to avoid division and fractions, we use:

   assign pwm_out = pwm_cnt < (PWM_PERCENT * 41);
   
endmodule

