module top;
   import uvm_pkg::*;
   import test_pkg::*;

   // Clock generator
   logic clock;
   initial begin
     clock = 0;
     forever #5 clock = ~clock;
   end

     a_if in(.clock(clock));

// Instância do DUT
    sqrt_int #(8) u_dut (
      .clk(in.clock),              
      .start(in.start),             
      .busy(in.busy),              
      .valid(in.valid),            
      .rad(in.rad),                 
      .root(in.root),              
      .rem(in.rem)
    );  

   initial begin
      // vendor dependent waveform recording
      `ifdef INCA
        $shm_open("waves.shm");
        $shm_probe("AS");
      `endif
      `ifdef VCS
        $vcdpluson;
      `endif
      `ifdef QUESTA
        $wlfdumpvars();
      `endif

      // register the input and output interface instance in the database
      uvm_config_db #(virtual a_if)::set(null, "uvm_test_top.env_h.agent_in_h.*", "a_vi", in);
      uvm_config_db #(virtual a_if)::set(null, "uvm_test_top.env_h.agent_out_h.*", "a_vi", in);

      run_test("test");
   end
endmodule

