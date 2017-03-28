@echo off
set xv_path=C:\\Xilinx\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 15fbc250eef4449888eda5f52c250a64 -m64 --debug typical --relax --include "../../../0_common" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot instr_mem_test_behav xil_defaultlib.instr_mem_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
