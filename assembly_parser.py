import sys
import os

# Check a file exists
# Check that only one file was given
# Check correct number of things given in every column
# Check: register naming and instruction names exist

if len(sys.argv) > 2:
    raise IndexError("Expecting only one argument. Can only assemble one script at a time.")

if (os.path.exists(sys.argv[1]) == False):
    raise NameError("Provided path does not exist.")
else:
    filename = sys.argv[1]

file = open(filename, "r")
instructions = file.readlines()
print(instructions)
for line in instructions:
    line = line.split(",")
    
    
file.close()

# add instruction dictionary
# register map

