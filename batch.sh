#!/bin/sh

#One way to do this is to pass variables to slurm with --export. 
for first in `seq 56000 50 56950`;
    do sbatch --export=first=$first,last=`bc <<< $first+49` -J "$first" -o "$first".out -e "$first".err para.slr;
    #do echo "$first" `bc <<< "$first"+49`;
done