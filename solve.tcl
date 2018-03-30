#!/bin/sh
# solve.tcl \
exec tclsh "$0" ${1+"$@"}


namespace eval Support_mines {
	proc dec2bin {i {width {}}} {
    #returns the binary representation of $i
    # width determines the length of the returned string (left truncated or added left 0)
    # use of width allows concatenation of bits sub-fields
    set res {}
    if {$i<0} {
	set sign -
	set i [expr {abs($i)}]
    } else {
	set sign {}
    }
    while {$i>0} {
	set res [expr {$i%2}]$res
	set i [expr {$i/2}]
    }
    if {$res eq {}} {set res 0}

    if {$width ne {}} {
	append d [string repeat 0 $width] $res
	set res [string range $d [string length $res] end]
    }
    return $sign$res
}
}

puts "Mines by PH 18.03.2018"

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
#puts $result

#set aaa ""
catch {Support_mines::dec2bin 15 10} aaa
puts $aaa
