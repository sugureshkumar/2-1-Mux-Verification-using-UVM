`include "uvm_pkg.sv"
import uvm_pkg::*;

`include "mux_intf.sv"
`include "mux_tx.sv"
`include "mux_coverage.sv"
`include "mux_monitor.sv"
`include "mux_sequencer.sv"
`include "mux_driver.sv"
`include "mux_agent.sv"
`include "mux_env.sv"
`include "mux_seq.sv"
`include "mux_test.sv"

`include "mux.v"
module top;

mux_intf pif();
mux dut(.a(pif.x),.b(pif.y),.sel(pif.select),.out(pif.mux_out));

initial begin
	uvm_config_db#(virtual mux_intf)::set(uvm_root::get(),"","vif",pif);
end

initial begin
	run_test();
end
endmodule
