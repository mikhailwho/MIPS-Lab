@echo off
set xv_path=C:\\Xilinx\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 1d4046d28d4b4665bac9eed39f79e8e1 -m64 --debug typical --relax --include "../../../0_common" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot test_regs_behav xil_defaultlib.test_regs xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
