## LEDs on AC701 main board
set_property PACKAGE_PIN M26 [get_ports Q[0]]
set_property IOSTANDARD LVCMOS33 [get_ports Q[0]]
set_property PACKAGE_PIN T24 [get_ports Q[1]]
set_property IOSTANDARD LVCMOS33 [get_ports Q[1]]
set_property PACKAGE_PIN T25 [get_ports Q[2]]
set_property IOSTANDARD LVCMOS33 [get_ports Q[2]]
set_property PACKAGE_PIN R26 [get_ports Q[3]]
set_property IOSTANDARD LVCMOS33 [get_ports Q[3]]

## LEDs on external board
set_property PACKAGE_PIN F25 [get_ports nCO]
set_property IOSTANDARD LVCMOS25 [get_ports nCO]
set_property PACKAGE_PIN G25 [get_ports nBO]
set_property IOSTANDARD LVCMOS25 [get_ports nBO]
#set_property PACKAGE_PIN G26 [get_ports ledsboard[2]]
#set_property IOSTANDARD LVCMOS25 [get_ports ledsboard[2]]
#set_property PACKAGE_PIN H26 [get_ports ledsboard[3]]
#set_property IOSTANDARD LVCMOS25 [get_ports ledsboard[3]]

## Pushbuttons
set_property PACKAGE_PIN P6 [get_ports DOWN]
set_property IOSTANDARD LVCMOS15 [get_ports DOWN]
set_property PACKAGE_PIN R5 [get_ports CLR]
set_property IOSTANDARD SSTL15 [get_ports CLR]
set_property PACKAGE_PIN U6 [get_ports nLOAD]
set_property IOSTANDARD SSTL15 [get_ports nLOAD]
#set_property PACKAGE_PIN U5 [get_ports nLOAD]
#set_property IOSTANDARD SSTL15 [get_ports nLOAD]
#set_property PACKAGE_PIN T5 [get_ports pushbuttons[4]]
#set_property IOSTANDARD SSTL15 [get_ports pushbuttons[4]]

## DIP switches
set_property PACKAGE_PIN R8 [get_ports X[0]]
set_property IOSTANDARD SSTL15 [get_ports X[0]]
set_property PACKAGE_PIN P8 [get_ports X[1]]
set_property IOSTANDARD SSTL15 [get_ports X[1]]
set_property PACKAGE_PIN R7 [get_ports X[2]]
set_property IOSTANDARD SSTL15 [get_ports X[2]]
set_property PACKAGE_PIN R6 [get_ports X[3]]
set_property IOSTANDARD SSTL15 [get_ports X[3]]

## System clock 200 MHz
#set_property PACKAGE_PIN R3 [get_ports UP]
#set_property IOSTANDARD LVDS_25 [get_ports UP]
#set_property PACKAGE_PIN P3 [get_ports sysclk_n]
#set_property IOSTANDARD LVDS_25 [get_ports sysclk_n]
set_property PACKAGE_PIN P16 [get_ports UP]
set_property IOSTANDARD LVCMOS33 [get_ports UP]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets UP_IBUF]

## Rotary switch
#set_property PACKAGE_PIN N21 [get_ports rotarysw[0]]
#set_property IOSTANDARD LVCMOS33 [get_ports rotarysw[0]]
#set_property PACKAGE_PIN N22 [get_ports rotarysw[1]]
#set_property IOSTANDARD LVCMOS33 [get_ports rotarysw[1]]
#set_property PACKAGE_PIN P20 [get_ports rotarysw[2]]
#set_property IOSTANDARD LVCMOS33 [get_ports rotarysw[2]]

## UART
#set_property PACKAGE_PIN T19 [get_ports uart_tx]
#set_property IOSTANDARD LVCMOS18 [get_ports uart_tx]
#set_property PACKAGE_PIN U19 [get_ports uart_rx]
#set_property IOSTANDARD LVCMOS18 [get_ports uart_rx]
