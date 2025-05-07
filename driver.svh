class driver_master extends uvm_driver #(a_tr);
  `uvm_component_utils(driver_master)

   function new(string name, uvm_component parent);
     super.new(name, parent);
   endfunction

   // a virtual interface must be substituted later with an actual interface instance
   virtual a_if a_vi; 

   function void build_phase(uvm_phase phase);
     super.build_phase(phase);
     // get interface instance from database
     assert( uvm_config_db #(virtual a_if)::get(this, "", "a_vi", a_vi) );
   endfunction

   task run_phase(uvm_phase phase);
     a_vi.start <= 'x;
     a_vi.rad  <= 'x;   
     fork // reset may occur at any time, therefore let's treat is in a separate task

       get_and_drive();
     join
   endtask

   task get_and_drive();
      a_tr tr_sequencer; // transaction coming from sequencer

      forever begin
         
          seq_item_port.get_next_item(tr_sequencer); // get transaction

          // wiggle interface signals
          @(posedge a_vi.clock);
          a_vi.start <= 1;
          a_vi.rad <= tr_sequencer.rad;

          seq_item_port.item_done(); // notify sequencer that transaction is completed

          @(posedge a_vi.clock);
          a_vi.start <= 0;
          @(posedge a_vi.clock iff a_vi.busy === 0);
        end
   endtask

endclass

