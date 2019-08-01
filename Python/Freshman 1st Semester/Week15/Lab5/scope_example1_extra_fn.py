#******************************************************************************#
#                                                                              #
#                           scope_example1.py                                  #
#                                                                              #
# This demonstrates the difference between local and global variables in terms #
# of where they can be accessed.                                               #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# import scope_example1

message1 = 'Global Variable'
message2 = ''
#-------------------------------------------------------------------------------
#
# This accesses the global variable message1 and also the local variable
# message2

def my_function():

    print( '\nInside the function:' )
    print( message1 )
    message2 = 'Local Variable'
    print( message2, '\n' )

my_function()
def my_function2():
    message2 = 'Another Local Variable'
    print(message2, '\n')
my_function2()

print( 'Outside the function:' )
print( message1 )
print( message2 )
 
# Will give error
