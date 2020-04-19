#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("image_in_address0", 16, hls_out, 0, "ap_memory", "mem_address", 1),
	Port_Property("image_in_ce0", 1, hls_out, 0, "ap_memory", "mem_ce", 1),
	Port_Property("image_in_q0", 16, hls_in, 0, "ap_memory", "mem_dout", 1),
	Port_Property("final_address0", 16, hls_out, 1, "ap_memory", "mem_address", 1),
	Port_Property("final_ce0", 1, hls_out, 1, "ap_memory", "mem_ce", 1),
	Port_Property("final_we0", 1, hls_out, 1, "ap_memory", "mem_we", 1),
	Port_Property("final_d0", 16, hls_out, 1, "ap_memory", "mem_din", 1),
};
const char* HLS_Design_Meta::dut_name = "kmeans";
