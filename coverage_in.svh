class coverage_in extends bvm_cover #(a_tr);
   `uvm_component_utils(coverage_in)

   covergroup transaction_covergroup;  
      option.per_instance = 1;
      coverpoint coverage_transaction.rad { 
        bins d = {[0:255]}; 
        option.at_least = 3;  
      }
   endgroup
   `bvm_cover_utils(a_tr)
    
endclass

