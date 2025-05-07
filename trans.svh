class a_tr extends uvm_sequence_item;

 
  rand int rad;
  bit [7:0] root; 
  bit [7:0] rem; 
 

  constraint rad_positive { rad >= 0; }
  constraint rad_max_size { rad < 256; }

  `uvm_object_utils_begin(a_tr)  
        `uvm_field_int(rad, UVM_ALL_ON | UVM_DEC)
        `uvm_field_int(root, UVM_ALL_ON | UVM_DEC)
        `uvm_field_int(rem, UVM_ALL_ON | UVM_DEC)
  `uvm_object_utils_end

endclass

