#!/bin/bash

app=Charles

while true
do

    while ! pgrep $app >/dev/null 2>&1
    do
        echo 'App not runing...'
        sleep 1
        echo 'Restarting...'
        open -a $app
        sleep 2
    done
    sleep 1740
    PID="$(pgrep -f $app)"
    kill -9 $PID
    sleep 2
done


