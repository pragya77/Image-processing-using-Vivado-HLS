
call xelab xil_defaultlib.apatb_kmeans_top -prj kmeans.prj --initfile "C:/Xilinx/Vivado/2016.3/bin/../data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s kmeans 
call xsim --noieeewarnings kmeans -tclbatch kmeans.tcl

