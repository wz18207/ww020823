#******************************************************************************#
#                                                                              #
#                      read_write_binary_files.py                              #
#                                                                              #
# Shows how to read from and write to binary files.                            #
#                                                                              #
#******************************************************************************#

# You need the file it_building.jpg.
# To run this program, start python and then type:
# from read_write_binary_files import *
# copy_binary_file( 'it_building.jpg', 'picture.jpg', 10 )

#-------------------------------------------------------------------------------
#
# Opens a file and prints the contents. NB the file must exist in the Current
# Working Directory (CWD)!

def copy_binary_file( source_file, target_file, buffer_size ):

    try:

        sf = open( source_file, 'rb' )
        tf = open( target_file, 'wb' )

        msg = sf.read( buffer_size )
        # Read buffer_size bytes at a time

        while len( msg ):

            tf.write( msg )
            msg = sf.read( buffer_size )            

        sf.close()
        tf.close()
        # Always close files when finished with

    except:

        print( source_file, 'could not be opened.' )
