#!/bin/bash

echo “This information is brought to you by $0.”

#Welcome the user
echo “Welcome, $USER on `date`”
echo

#Currently active users.
echo “Following users are presently active:”
w | cut -d ' ' -f 1 | grep -v USER | sort -u
echo

#System information using uname command
echo “This is `uname -s` running on a `uname -m` processor.”
echo

#Information of uptime
echo “uptime”
uptime
echo

#Showing free memory
echo “free”
free
echo

#Disk space usage using df command
echo “Disk Space Utilization:df -mh”
df -mh
echo 
