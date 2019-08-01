#******************************************************************************#
#                                                                              #
#                           scope_example2.py                                  #
#                                                                              #
# This demonstrates what happens when a local variable has the same name as a  #
# global variable                                                              #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# import scope_example1

message1 = 'Global Variable'

#-------------------------------------------------------------------------------
#
# This accesses the global variable message1 and also the local variable
# message2

def my_function():

    message1 = 'Local Variable'
    print( '\nInside the function:' )
    print( message1, '\n' )

my_function()

def my_function2():
    
    message1 = 'Another Local Variable'
    print( '\nAnother inside the function:' )
    print( message1, '\n')
my_function2()

print( 'Outside the function:' )
print( message1 )
