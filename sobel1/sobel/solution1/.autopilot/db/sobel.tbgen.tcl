set C_TypeInfoList {{ 
"sobel" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"input_image": [[], {"array": [ {"array": [ {"scalar": "int"}, [256]]}, [256]]}] }, {"output_image": [[], {"array": [ {"array": [ {"scalar": "int"}, [256]]}, [256]]}] }],[],""]
}}
set moduleName sobel
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set C_modelName {sobel}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_image int 32 regular {array 65536 { 1 1 } 1 1 }  }
	{ output_image int 32 regular {array 65536 { 0 0 } 0 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_image", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "input_image","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 255,"step" : 1},{"low" : 0,"up" : 255,"step" : 1}]}]}]} , 
 	{ "Name" : "output_image", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "output_image","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 255,"step" : 1},{"low" : 0,"up" : 255,"step" : 1}]}]}]} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_image_address0 sc_out sc_lv 16 signal 0 } 
	{ input_image_ce0 sc_out sc_logic 1 signal 0 } 
	{ input_image_q0 sc_in sc_lv 32 signal 0 } 
	{ input_image_address1 sc_out sc_lv 16 signal 0 } 
	{ input_image_ce1 sc_out sc_logic 1 signal 0 } 
	{ input_image_q1 sc_in sc_lv 32 signal 0 } 
	{ output_image_address0 sc_out sc_lv 16 signal 1 } 
	{ output_image_ce0 sc_out sc_logic 1 signal 1 } 
	{ output_image_we0 sc_out sc_logic 1 signal 1 } 
	{ output_image_d0 sc_out sc_lv 32 signal 1 } 
	{ output_image_address1 sc_out sc_lv 16 signal 1 } 
	{ output_image_ce1 sc_out sc_logic 1 signal 1 } 
	{ output_image_we1 sc_out sc_logic 1 signal 1 } 
	{ output_image_d1 sc_out sc_lv 32 signal 1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_image_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_image", "role": "address0" }} , 
 	{ "name": "input_image_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_image", "role": "ce0" }} , 
 	{ "name": "input_image_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_image", "role": "q0" }} , 
 	{ "name": "input_image_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_image", "role": "address1" }} , 
 	{ "name": "input_image_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_image", "role": "ce1" }} , 
 	{ "name": "input_image_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "input_image", "role": "q1" }} , 
 	{ "name": "output_image_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_image", "role": "address0" }} , 
 	{ "name": "output_image_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_image", "role": "ce0" }} , 
 	{ "name": "output_image_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_image", "role": "we0" }} , 
 	{ "name": "output_image_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_image", "role": "d0" }} , 
 	{ "name": "output_image_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_image", "role": "address1" }} , 
 	{ "name": "output_image_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_image", "role": "ce1" }} , 
 	{ "name": "output_image_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_image", "role": "we1" }} , 
 	{ "name": "output_image_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "output_image", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "sobel",
		"VariableLatency" : "1",
		"AlignedPipeline" : "0",
		"UnalignedPipeline" : "0",
		"ProcessNetwork" : "0",
		"Combinational" : "0",
		"ControlExist" : "1",
		"Port" : [
		{"Name" : "input_image", "Type" : "Memory", "Direction" : "I"},
		{"Name" : "output_image", "Type" : "Memory", "Direction" : "O"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.image_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.sobel_sdiv_32ns_3bkb_U0", "Parent" : "0"}]}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2714264", "Max" : "2976408"}
	, {"Name" : "Interval", "Min" : "2714265", "Max" : "2976409"}
]}

set Spec2ImplPortList { 
	input_image { ap_memory {  { input_image_address0 mem_address 1 16 }  { input_image_ce0 mem_ce 1 1 }  { input_image_q0 mem_dout 0 32 }  { input_image_address1 mem_address 1 16 }  { input_image_ce1 mem_ce 1 1 }  { input_image_q1 mem_dout 0 32 } } }
	output_image { ap_memory {  { output_image_address0 mem_address 1 16 }  { output_image_ce0 mem_ce 1 1 }  { output_image_we0 mem_we 1 1 }  { output_image_d0 mem_din 1 32 }  { output_image_address1 mem_address 1 16 }  { output_image_ce1 mem_ce 1 1 }  { output_image_we1 mem_we 1 1 }  { output_image_d1 mem_din 1 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
