#******************************************************************************#
#                                                                              #
#                     read_write_append_text_files.py                          #
#                                                                              #
# Shows how to open a text file, read the lines in it one by one and write     #
# them out.                                                                    #
#                                                                              #
#******************************************************************************#

# first, check you have a file myfile.txt in the same directory as this module.
# To run this program, start Python and then type:
# from read_write_append_text_files import *
# print_file( 'myfile.txt' )
# print_file( 'nosuchfile.txt' )
# safe_print_file( 'myfile.txt' )
# safe_print_file( 'nosuchfile.txt' )
#
# Now, outside Python, copy myfile.txt to myfile2.txt. In Python again:
# append_file( 'myfile2.txt', 'another line' )
# safe_print_file( 'myfile2.txt' )
#
# print_file_with_buffer_size( 'myfile.txt', 5 )
# print_file_with_buffer_size( 'myfile.txt', 10 )

#-------------------------------------------------------------------------------
#
# Opens a file and prints the contents. NB the file must exist in the Current
# Working Directory (CWD)!

def print_file( filename ):
    
    f = open( filename, 'r' )

    for line in f:

        print( line, end = '' )

    f.close()
    # Always close files when finished with

#-------------------------------------------------------------------------------
#
# Opens a file and prints the contents. NB the file must exist in the Current
# Working Directory (CWD)!

def safe_print_file( filename ):

    try:

        f = open( filename, 'r' )

        for line in f:

            print( line, end = '' )

        f.close()
        # Always close files when finished with

    except:

        print( filename, 'could not be opened.' )

#-------------------------------------------------------------------------------
#
# Opens a file for append and adds text_line to the end. Note that f.write does
# not write a \n at the end so we need to add it.

def append_file( filename, text_line ):

    f = open( filename, 'a' )
    f.write( text_line + '\n' )
    f.close()
    # Always close files when finished with

#-------------------------------------------------------------------------------
#
# Opens a file for reading. Reads from it buffer_size bytes at a time and
# writes them out. We put a newline at the end of each line so you can see the
# effect with different values of buffer_size.
#
# In myfile.txt, each line ends with a newline. This appears in the output as
# well. In consequence, not all lines of output are of length buffer_size.


def print_file_with_buffer_size( filename, buffer_size ):

    try:

        f = open( filename, 'r' )

        msg = f.read( buffer_size )
        # Read buffer_size bytes at a time

        while len( msg ):

            print( msg )
            # This will print a newline at the end
            # for illustration purposes
            msg = f.read( buffer_size )            

        f.close()
        # Always close files when finished with

    except:

        print( filename, 'could not be opened.' )
