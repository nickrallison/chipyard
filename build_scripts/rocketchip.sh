#!/bin/sh

cd generators/rocket-chip
git submodule update --init
make verilog CONFIG=freechips.rocketchip.system.DefaultConfig
