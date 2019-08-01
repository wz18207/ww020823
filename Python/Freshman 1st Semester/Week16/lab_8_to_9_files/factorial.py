#******************************************************************************#
#                                                                              #
#                                factorial.py                                  #
#                                                                              #
# Factorial defined as a recursive function.                                   #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# from factorial import *
# factorial( 5 )

#-------------------------------------------------------------------------------
#
# factorial( 0 ) = 1
# factorial( n ) = n * factorial( n - 1 )
#
# We create a recursive function based on this algorithm.

def factorial( n ):

    if n == 0:

        return( 1 )

    else:

        return( n * factorial( n - 1 ) )
