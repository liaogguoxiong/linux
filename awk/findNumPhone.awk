#!/bin/awk -f 
#Description:
#		input name and output numPhone

BEGIN {

	FS="/";
	if (ARGC > 2)
	    
	    {
		name=ARGV[1]
		delete ARGV[1]
	    }

	esle
	    {
		while (!name){print "please input a name";getline name< "-"}		
	    }
}
	$1~name {print $1,$4}


