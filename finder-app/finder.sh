#!/bin/bash

# Check if the number of arguments provided is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Check if filesdir argument is not provided or does not represent a directory
if [ ! -d "$1" ]; then
    echo "Error: '$1' is not a valid directory."
    exit 1
fi

# Assign command line arguments to variables
filesdir="$1"
searchstr="$2"

# Count the number of files in the directory and subdirectories
num_files=$(find "$filesdir" -type f | wc -l)

# Count the number of matching lines in files
num_matching_lines=$(grep -r "$searchstr" "$filesdir" | wc -l)

# Print the result
echo "The number of files are $num_files and the number of matching lines are $num_matching_lines"

