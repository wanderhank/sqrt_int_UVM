class monitor extends uvm_monitor;  
   `uvm_component_utils(monitor)

   uvm_analysis_port #(a_tr) out_refmod;
   uvm_analysis_port #(a_tr) out_comp;
    
   virtual a_if a_vi; 

   function new(string name, uvm_component parent);
      super.new(name, parent);
      out_refmod = new("out_refmod", this);
      out_comp= new("out_comp", this);

   endfunction: new
    
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      assert( uvm_config_db #(virtual a_if)::get(this, "", "a_vi", a_vi) );
   endfunction
   
   task run_phase(uvm_phase phase);
      a_tr tr;
      forever begin
         
         tr = a_tr::type_id::create("tr");

         

            @(posedge a_vi.clock iff (a_vi.start)); // at next rising clock which has valid set
            `bvm_begin_tr(tr) // start transaction recording
             tr.rad = a_vi.rad; // get transaction property value

             out_refmod.write(tr);


            @(posedge a_vi.clock iff (a_vi.valid)); 

             tr.root = a_vi.root; 
             tr.rem = a_vi.rem; 

             out_comp.write(tr); 
        
      end
   endtask

endclass

