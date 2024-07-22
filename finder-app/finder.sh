#!/bin/sh

FILESDIR="$1"	# first argument: path to direcotry
SEARCHSTR="$2"	# second argument: input to get searched in files

# check if given inputs are valid
if [ ! -d "$FILESDIR" ] || [ -z "$FILESDIR" ]  ;then
	echo "First Argument is not a directory: $FILESDIR\nPlease call the function again and insert a correct directory path"
	exit 1
fi

if [ -z "$SEARCHSTR" ]; then
	echo "Second argument is not a valid input: $SEARCHSTR\nPlease call the function with a valid input again."
	exit 1
fi

# read the content of the files
NBR_FILES=$(find "$FILESDIR" -type f | wc -l)
NBR_LINES=$(find "$FILESDIR" -name "*.txt" | xargs grep -l "$SEARCHSTR" | wc -l) # $(find "$FILESDIR" -type f | grep -Fr "$SEARCHSTR" | wc -l)

echo "The number of files are $NBR_FILES and the number of matching lines are $NBR_LINES"
