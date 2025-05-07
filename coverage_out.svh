class coverage_out extends bvm_cover #(a_tr);
   `uvm_component_utils(coverage_out)

       covergroup transaction_covergroup;  
      option.per_instance = 1;
      coverpoint coverage_transaction.rad { 
        bins d1 = {[0:15]}; 
        option.at_least = 3; 
      }
      coverpoint coverage_transaction.rem { 
        bins d2 = {[0:30]};
        option.at_least = 3;  
    }
    endgroup
    `bvm_cover_utils(a_tr)
endclass

