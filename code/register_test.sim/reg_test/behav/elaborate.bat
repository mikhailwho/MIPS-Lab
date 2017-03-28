@echo off
set xv_path=C:\\Xilinx\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 5a450648942640a8a3b391419483cf4c -m64 --debug typical --relax --include "../../../0_common" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_regs_behav xil_defaultlib.test_regs xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
