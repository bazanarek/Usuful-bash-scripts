#!/bin/bash

#README
# Script restarts choosen app at specified time, to modify app name or time change value of
# app and time (in seconds) variable
 
# To run script:
# make the file exacutable by running command 'chmod +x RestartApp.sh
# Run by specifying file location ./RestartApp.sh
 
app=Charles
time=1740

while true
do

    while ! pgrep $app >/dev/null 2>&1 		# checks if app is running or not
    do						                # when opening app will fail then loop will try to run it again after 2s and will repeat it until it will be succesfull
        sleep 1
        echo 'Restarting...'
        open -a $app                        # open app
        sleep 2
    done
    echo "$app opened succesfully, sleeping..."
    sleep $time					            # wait
    PID="$(pgrep -f $app)"			        #get app PID
    kill -9 $PID				            # kills app's process
    sleep 2					                # sleep prevents error accuring when script wants to open app immediately after kill
done


