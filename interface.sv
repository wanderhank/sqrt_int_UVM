
interface a_if (input logic clock);

  logic valid; 
  logic [7:0] rad; 
  logic start; 
  logic busy; 
  logic [7:0] root; 
  logic [7:0] rem; 


  modport inp (input clock, input rad, input start, output valid, output busy, output root, output rem);


endinterface

