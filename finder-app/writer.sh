#!/bin/bash

# Check if the number of arguments provided is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Assign command line arguments to variables
writefile="$1"
writestr="$2"

# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the content to the file
echo "$writestr" > "$writefile"

# Check if file creation was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to create file '$writefile'."
    exit 1
fi

echo "File '$writefile' created successfully."

