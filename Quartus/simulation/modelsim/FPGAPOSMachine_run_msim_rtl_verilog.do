transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/onatd/Desktop/Projects/FPGA-POS-Machine/Quartus {C:/Users/onatd/Desktop/Projects/FPGA-POS-Machine/Quartus/FPGAPOSMachine.v}
vlog -vlog01compat -work work +incdir+C:/Users/onatd/Desktop/Projects/FPGA-POS-Machine/Quartus {C:/Users/onatd/Desktop/Projects/FPGA-POS-Machine/Quartus/vgasync.v}
vlog -vlog01compat -work work +incdir+C:/Users/onatd/Desktop/Projects/FPGA-POS-Machine/Quartus {C:/Users/onatd/Desktop/Projects/FPGA-POS-Machine/Quartus/imageloader.v}

