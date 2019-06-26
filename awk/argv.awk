#!/bin/awk -f
BEGIN {

    for (x=0;x<ARGC;x++)
	print ARGV[x]
	print ARGC

}
