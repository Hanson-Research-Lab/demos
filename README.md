demos

These examples do not actually run as is. 

dep.sh is an example of implementing a multi stage analysis in which later
stages depend on prior stages. 

para.slr is an example of how to wrap jobs in parallel. This allows multiple
jobs to run on the same node. This does NOT allow for these processes to 
interact with one another.

batch.sh shows an example of using a separate bash script to spawn multiple 
slurm jobs. These may or may not be running the parallel command. In this
example, I am simulating a population history in which the main variable is 
divergence time between two populations. So, the arugments I am passing are
divergence times. The first and last variables set a range of divergence times
to be run on each node. You do not need to pass two arguments. You could just 
do one. In fact, your parallel job does not ghave to use the argument at all, 
but it does need to have one to differentiate between jobs. 

push.sh is what I use so that I do not need to manually check the status of 
jobs. The app I use is simplepush on android. I assume there is an iOS 
equivalent, but I do not know what it is. 