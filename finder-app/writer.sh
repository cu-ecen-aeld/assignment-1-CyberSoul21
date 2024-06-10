#!/bin/bash
#Author: Wilson Javier Almario R.
#Date: 09/06/2024
#Description: Receive a path/file and one string the program
#create the file and write the string

writefile=$1
writestr=$2
if [ -z $writefile ] || [ -z $writestr ]
then
    #echo "Error 1"
    exit 1
else
    if [ -d $( dirname $writefile ) ]
    then
        #echo "FOLDER EXISTS"
        echo $writestr > $writefile
        if [ ! -f "$writefile" ]
        then
            echo "${writefile} could not be created."
            exit 1
        fi
    else
        mkdir -p $( dirname $writefile )
        if [ -d $( dirname $writefile ) ]
        then
            echo $writestr > $writefile
            if [ ! -f "$writefile" ]
            then
                echo "${writefile} could not be created."
                exit 1
            fi
        else
            #echo "Error 2"
            exit 1
        fi
    fi
fi