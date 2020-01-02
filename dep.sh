#!/bin/bash

#This will spawn many jobs, and wait for some of them to finish before
#moving on to the next stage of the analysis.

# Slurm pipeline.  sbatch returns a string of form "Submitted batch
# job 123456". We only want the last word in this string. The sbatch
# steps below initially set a variable equal to the entire
# string. Then we extract the last word with a command like j1=${j1##*
# }. 

#dependency types
#after:jobid[:jobid...]	job can begin after the specified jobs have started
#afterany:jobid[:jobid...]	job can begin after the specified jobs have terminated
#afternotok:jobid[:jobid...]	job can begin after the specified jobs have failed
#afterok:jobid[:jobid...]	job can begin after the specified jobs have run to 
#completion with an exit code of zero (see the user guide for caveats).
#singleton	jobs can begin execution after all previously launched jobs with 
#the same name and user have ended. This is useful to collate results of a swarm 
#or to send a notification at the end of a swarm.

export SBATCH_ACCOUNT=camp-kp
export SBATCH_PARTITION=camp-kp

#In this example, we have the main analysis and a series of bootstraps.
#the second part of the anlaysis depends both, so we need to wait for
#j1 and j2 to be done. 

# Stage 1 of analysis.
j1=$(sbatch a1.slr) #you could even throw something like para.slr in here to better
j2=$(sbatch --array=0-49 a1boot.slr) #use each node. 
j1=${j1##* }
j2=${j2##* }

# Stage 2 of analysis.
j3=$(sbatch --dependency=afterok:$j1:$j2 a2.slr)
j4=$(sbatch --dependency=afterok:$j1:$j2 --array=0-49 a2boot.slr)
j3=${j3##* }
j4=${j4##* }

push "Your job has finished."