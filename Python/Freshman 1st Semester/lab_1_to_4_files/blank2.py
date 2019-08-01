#******************************************************************************#
#                                                                              #
#                                blank2.py                                     #
#                                                                              #
# This is a blank program which shows the format to use and also includes some #
# example functions so you can see the overall structure.                      #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# from blank2 import *
# my_function1()
# my_function2()

# To make this into a program, do the following:
# 1. Update the box comment with the name of the program. Change the summary in
#    the box to say what the program does. HINT: Use Insert Key.
# 2. Update the 'import' line above - how do you import your program and run
#    it?
# 3. Add some functions at the bottom following exactly the format and style of
#    my_function1() and my_function2()
# 4. Delete my_function1() and my_function2().
# 5. Finally, delete these comments 1-5.

#-------------------------------------------------------------------------------
#
# This function when called accepts a number from the user and then prints out
# the square of that number. It does not return a value. The number can be
# either an int or a float.

def my_function1():

    print( 'Enter a number and I will square it:' )
    x = float( input() )
    print( 'The square of %f is %f' % ( x, x * x )

#-------------------------------------------------------------------------------
#
# This function takes as argument a number (either float or int) and returns as
# result the square of that number.

def my_function2( x ):

    return( x * x )
