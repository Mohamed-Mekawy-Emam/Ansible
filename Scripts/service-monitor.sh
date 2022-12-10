#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Error: Invlaid number of arguments. expection 1 argument"
    exit
fi

# Check the service status
# [ + ] (running)
# [ - ] (stopped)
# [ ? ] (without status)
checkStatus() {
    service_status="$(service --status-all | grep $1)"

    if [ "$service_status" = "" ]; then
        echo "[$1] Service not found!"
        return 3
    fi

    status=${service_status:3:1}

    if [ $status = "+" ]; then
        echo "[$1] was running."
        return 0
    elif [ $status = "-" ]; then
        echo "[$1] Service was stopping."
        return 1
    else
        echo "[$1] Service is without status."
        return 2
    fi
}

# Restart the service
restartService() {
    service $1 restart
    status=$?
    
    if [ $status -eq 0 ]; then
        echo "[$1] Service is restarted"
    fi

    return $status
}

# Services array
services=()

# Check if the first parameter not file. (if not file then it's a service name)
if [ ! -e $1 ]; then
    services+=($1) # Append the service name to the service array
else
    # Store the values of the file in the services array
    services=$(cat $1)
fi

for service in $services; do

    # checkStatus $service > /dev/null 2>&1
    checkStatus $service
    exitStatus=$?

    if [ $exitStatus -ne 0 ] && [ $exitStatus -ne 3 ]; then
        restartService $service
    fi

done
