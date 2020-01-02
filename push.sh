#!/bin/bash
#This needs to be either part of your script or in your PATH

#this particular version uses the date and time as the subject
#and a user argument as the body. 
push () {
        foo="`date`";
        bar="$@";
        curl "https://api.simplepush.io/send/g8kB44/$foo/$bar";
        echo; #this is only here to force a new line when using it directly in the shell. 
}
export -f push