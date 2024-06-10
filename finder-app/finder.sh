#!/bin/bash
#Author: Wilson Javier Almario R.
#Date: 09/06/2024
#Description: Receive a path and one string the program
#returns how many file and subdirectories there are and how many matches

filesdir=$1
searchstr=$2
if [ -z $filesdir ] || [ -z $searchstr ]
then
    exit 1
fi

if [ -d $filesdir ]
then
    numberFiles=$( find ${filesdir} -type f | wc -l )
    NumberMatchs=$(grep -r ${searchstr} ${filesdir} | wc -l)
    echo "The number of files are ${numberFiles} and the number of matching lines are ${NumberMatchs}"
else
    echo $filesdir "Does not exist"
    exit 1
fi
