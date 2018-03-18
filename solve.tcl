#!/bin/sh
# solve.tcl \
exec tclsh "$0" ${1+"$@"}


puts "Mines by PH 18.03.2018"
puts "albo grubo albo wcale"

set SIZE 5


proc RandomBit {} {
	return [expr {int(rand()*(2))}]
}

set result "" 
for {set i 0} {$i < 10} {incr i} {
	catch RandomBit s
	set result $result$s
	#puts [RandomBit()]
}
puts $result