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
    
    if [ -d $(dirname $writefile) ]
    then
        echo "FOLDER EXISTS"
        if [ -e $writefile ]
        then
            rm $writefile
            touch $writefile
            if [ -e $writefile ]
            then
                echo $writestr >> $writefile
            else
                exit 1
            fi
        else
            echo "Could not be created file ${writefile}" 
            exit 1    
        fi

    else
        mkdir -p $(dirname $writefile)
        if [ -d $(dirname $writefile) ]
        then
            #$fileDir=$(dirname $writefile)            
            #echo "Folder Created"

            touch $writefile
            if [ -e $writefile ]
            then
                echo $writestr >> $writefile
            else
                #echo "Could not be created file ${writefile}" 
                exit 1    
            fi


        else
            #echo "Error 2"
            exit 1
        fi
    fi
fi

<<comment
if [ -e $filesdir ]
then
    echo "FOLDER EXIST = ${filesdir}"
    touch $writefile
    if [ -e $writefile ]
    then
        echo $writestr >> $writefile
    else
        echo "Could not be created file ${writefile}" 
        exit 1    
    fi
else
    echo "FOLDER DOES NOT EXIST"
    mkdir $filesdir
    if [ -d $filesdir ]
    then
        touch $writefile
        if [ -e $writefile ]
        then
            echo $writestr >> $writefile
        else
            echo "Could not be created file ${writefile}" 
            exit 1    
        fi
    else
        echo "Could not be created folder ${filesdir}" 
        exit 1    
    fi
fi
comment