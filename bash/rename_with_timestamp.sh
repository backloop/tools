#!/bin/bash

if [ $# != 1 ]; then
    echo "ERROR: One argument is required, no more, no less."
    exit 1
fi

# get the directory to change
path=$1

# trim eventual trailing slash
path=${path%%\/}

# check that directory exists
if [ ! -d "$path" ]; then
    echo "ERROR: Directory ($path) cannot be found"
    exit 1
fi

# change some chars (need unicode/utf8) support
mpath=$(basename "$path")
mpath=$(echo $mpath | sed s/å/a/g)
mpath=$(echo $mpath | sed s/ä/a/g)
mpath=$(echo $mpath | sed s/ö/o/g)
mpath=$(echo $mpath | sed s/Å/A/g)
mpath=$(echo $mpath | sed s/Ä/A/g)
mpath=$(echo $mpath | sed s/Ö/O/g)
mpath=$(echo $mpath | sed s/\&/_/g)
# whitespaces
mpath=$(echo $mpath | sed -e "s/\s/-/g")

# reconstruct the modified full path
mpath=$(dirname "$path")/$mpath

# hack to prefix the path when not absolute
path=$(dirname "$path")/$(basename "$path") 

if [ "$path" != "$mpath" ]; then
    echo "Do you wish to rename the directory?"
    echo "<-$path"
    echo "->$mpath"
    while true; do
        read -p "Continue [y/n]? " yn
        case $yn in
            [Yy]* ) break
                    ;;
            [Nn]* ) exit
                    ;;
            * )     echo "Please answer yes or no."
                    ;;
        esac
    done
fi

# rename the directory
mv "$path" "$mpath"

# Rename files in directory with jhead to allow chronological listing
# files with same date attributes will be correctly ordered by the
# trailing original filename
# use -nf flag to avoid problems with upper and lower case file extensions
jhead -nf%Y%m%d-%H-%M-%S-%f -q $mpath/*

# Rename files in directory with jhead with better name
# previous jhead command created lower case file extensions
# for all files, but for consistency use of the same flag is preferred
# use -nf flag to avoid problems with upper and lower case file extensions
jhead -nf%Y%m%d-%H-%M-%S-%04i -q $mpath/*
