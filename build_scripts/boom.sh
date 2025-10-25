#!/bin/sh

sh scripts/init-submodules-no-riscv-tools.sh
bash build-setup.sh
source env.sh

cd sims/verilator
unset VERILATOR_ROOT
make CONFIG=SmallBoomV3Config verilog
cat $(cat filelist.f | grep -v Sim | grep -v ".cc") > boom_full_netlist.sv
cat $(find . -name "chipyard*") >> boom_full_netlist.sv

yosys -p "verific -sv boom_full_netlist.sv" -p "hierarchy -top BoomCore" -p "flatten" -p "write_verilog boom_flattened.v"