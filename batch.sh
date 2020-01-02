#!/bin/sh

#One way to do this is to pass variables to slurm with --export. 
for first in `seq 56000 50 56950`;
    # If we iterate over the values, be sure that the job, out, and err names are 
    # unique for each set. 
    do sbatch --export=first=$first,last=`bc <<< $first+49` -J "$first" -o "$first".out -e "$first".err para.slr;
    #do echo "$first" `bc <<< "$first"+49`;
done