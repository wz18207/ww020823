#******************************************************************************#
#                                                                              #
#                           default_parameters.py                              #
#                                                                              #
# Shows how to define them and also what happens when they are not specified   #
# when a function is called.                                                   #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# import default_parameters

#-------------------------------------------------------------------------------
#
# Parameters a and b must be specified; c, d, e are optional and have defaults.

def some_function( a, b, c=1, d=2, e=3 ):

    print( a, b, c, d, e )

# Call with all parameters specified
print( 'Specify all parameters:')
some_function( 10, 20, 30, 40, 50 )

# Call with c, d, e not specified
print( '\nOnly specify first two parameters:')
some_function( 10, 20 )
