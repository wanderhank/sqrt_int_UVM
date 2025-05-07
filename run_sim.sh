
g++ -c compute_sqrt.cpp -o compute_sqrt.o 
g++ -c rem_sqrt.cpp -o rem_sqrt.o 
xrun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 -coverage all compute_sqrt.o  rem_sqrt.o -covoverwrite -DSYSTEM_CLOCK_UNITS_PER_SECOND=100 ./bvm/system_clock.c +incdir+./bvm ./bvm/*.sv *.sv +UVM_VERBOSITY=LOW -gui
# imc -load cov_work/scope/test
