#******************************************************************************#
#																			   #
#						show_ascii_codes.py									   #
#																			   #
# Shows the characters corresponding to different ASCII codes.    			   #
#																			   #
#******************************************************************************#

# To run this program, start python and then type:
# from show_ascii_codes import *
# show_ascii_codes()

#-------------------------------------------------------------------------------
#
# Shows the chars for a range of numbers

def show_ascii_codes():

    for char in range( 0x41, 0x5B ):

        print( chr( char ), ' ', end = '' )
        # Remember, end = '' means no newline.
    print( '' )
# Newline at end.
