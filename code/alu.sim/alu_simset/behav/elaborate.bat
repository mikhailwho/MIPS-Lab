@echo off
set xv_path=C:\\Xilinx\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto ea0a07043f5b4d8bae531d2b856e86a0 -m64 --debug typical --relax --include "../../../0_common" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot aluControl_testbench_behav xil_defaultlib.aluControl_testbench xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
