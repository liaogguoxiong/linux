#!/bin/awk -f
{print NF}
{if(NF != MAX)
    
    print("the line "NR" have not "MAX" region!")}
