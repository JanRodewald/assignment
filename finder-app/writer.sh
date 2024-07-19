#!/bin/sh

FILESPATH="$1"	# first argument: path to file
WRITESTR="$2"	# second argument: input to insert in file

# check if given inputs are valid
if [ -z "$FILESPATH" ]  ;then
	echo "First Argument is not a file: $FILESPATH\nPlease call the function again and insert a correct file path"
	exit 1
fi

if [ -z "$WRITESTR" ]; then
	echo "Second argument is not a valid input: $WRITESTR\nPlease call the function with a valid input again."
	exit 1
fi

# write the content in the file
mkdir -p $(dirname "$FILESPATH")

$(echo "$WRITESTR" > "$FILESPATH")

if [ $? -eq 0 ]; then
	exit 0
else
	echo "Error while writing file: $FILESPATH"
	exit 1
fi
