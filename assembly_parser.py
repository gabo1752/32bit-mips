import sys
import os

# Check a file exists
# Check that only one file was given
# Check correct number of things given in every column
# Check: register naming and instruction names exist

if len(sys.argv) > 2:
    raise IndexError("Expecting only one argument. Can only assemble one script at a time.")

if ~(os.path.exists(sys.argv[1])):
    raise NameError("File provided does not exist.")
else:
    filename = sys.argv[1]


# add instruction dictionary
# register map

