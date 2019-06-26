#!/bin/awk -f

BEGIN {

    data[10]="0613"
    if( "10.15" in data)
	print "element in arrary"
    else
	print "not in"
}

