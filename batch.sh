#!/bin/sh

for first in `seq 56000 50 56950`;
    do sbatch para.slr first `bc <<< $first+49`;
    #do echo "$first" `bc <<< "$first"+49`;
done