import "DPI-C" function real compute_sqrt(real rad);
import "DPI-C" function real rem_sqrt(real rad);

class refmod extends uvm_component;
   `uvm_component_utils(refmod)

   uvm_get_port #(a_tr) in; 
   uvm_blocking_put_port #(a_tr) out; 

   function new(string name, uvm_component parent=null);
      super.new(name,parent);
      in  = new("in",  this);
      out = new("out", this);
   endfunction : new

   task run_phase (uvm_phase phase);

     a_tr tr_in, tr_out;

     forever begin
        in.get(tr_in);

        #10;
        `bvm_end_tr(tr_in);

        tr_out = a_tr::type_id::create("tr_out", this);
        tr_out.rad = tr_in.rad; //tr_in.start; 
        tr_out.root = compute_sqrt(tr_in.rad) ;
        tr_out.rem =  rem_sqrt(tr_in.rad);  

        `bvm_begin_tr(tr_out)
        #10;
        out.put(tr_out);
     end

   endtask

endclass

