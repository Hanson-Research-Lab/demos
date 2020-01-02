#!/bin/sh

for first in `seq 56000 50 56950`;
    do sbatch --export=first=$first,last=`bc <<< $first+49` para.slr;
    #do echo "$first" `bc <<< "$first"+49`;
done