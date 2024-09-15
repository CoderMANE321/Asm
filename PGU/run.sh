#!/bin/bash

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filename_without_extension>"
  exit 1
fi

# Variables
FILENAME="$1"
SOURCE_FILE="${FILENAME}.s"
OBJECT_FILE="${FILENAME}.o"
EXECUTABLE_FILE="${FILENAME}"

# Assemble the .s file into .o
as "$SOURCE_FILE" -o "$OBJECT_FILE"
if [ $? -ne 0 ]; then
  echo "Assembly failed."
  exit 1
fi

# Link the .o file to create an executable
ld "$OBJECT_FILE" -o "$EXECUTABLE_FILE"
if [ $? -ne 0 ]; then
  echo "Linking failed."
  exit 1
fi

# Run the executable
./"$EXECUTABLE_FILE"
EXEC_STATUS=$?

# Print the exit status
echo "Exit status: $EXEC_STATUS"
