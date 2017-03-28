@echo off
set xv_path=C:\\Xilinx\\Vivado\\Vivado\\2014.4\\bin
call %xv_path%/xsim iFetch_sequential_test_behav -key {Behavioral:ifetch:Functional:iFetch_sequential_test} -tclbatch iFetch_sequential_test.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
