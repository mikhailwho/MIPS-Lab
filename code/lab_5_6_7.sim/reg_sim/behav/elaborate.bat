@echo off
set xv_path=C:\\Xilinx\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto f43b84eaa28d409590d2aad397209aa2 -m64 --debug typical --relax --include "../../../0_common" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot regfile_test_behav xil_defaultlib.regfile_test xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
