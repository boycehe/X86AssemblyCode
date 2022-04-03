#!/bin/bash
PROJECT_DIR=''

echo "$2"
while getopts ":r" opt
do 
    case $opt in
        r)
            echo '111'
            echo $OPTARG
            PROJECT_DIR=$OPTARG;;
        ?)
        echo 'error'
        exit 1;;
    esac
done
echo $PROJECT_DIR
echo "done"

exit 0