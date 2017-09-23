@echo off
set xv_path=D:\\BSUIR\\Xilinx\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto 4d8454aefa9845ad8bd230ec49311da8 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot main_tb_behav xil_defaultlib.main_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
