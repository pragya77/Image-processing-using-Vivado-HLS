############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project kmeans
set_top kmeans
add_files kmeans.c
add_files -tb test.c
open_solution "solution1"
set_part {xc7z020clg400-3} -tool vivado
create_clock -period 10 -name default
#source "./kmeans/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog
