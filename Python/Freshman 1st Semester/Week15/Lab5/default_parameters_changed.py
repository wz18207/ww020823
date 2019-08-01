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

def another_function( a ="a", b=3.14, c={"a":3.14} ):
    print( a ,b ,c )

print( '\nOnly specify none parameters:' )
another_function()

print( '\nOnly specify a parameters:' )
another_function(10)

print( '\nOnly specify two parameters:' )
another_function(10,20)
    
print('\nOnly specify three parameters:' ) 
another_function(10,20,30) 

print('\nOnly specify four parameters:' )  
another_function(10,20,30,40)

print('\nOnly specify five parameters:' )
another_function(10,20,30,40,50)

print('\nOnly specify six parameters:' )
another_function(10,20,30,40,50,60)