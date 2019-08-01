#******************************************************************************#
#                                                                              #
#                        variable_num_params.py                                #
#                                                                              #
# Shows how to use non-keyworded and keyworded variable length parameter       #
# lists.                                                                       #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# from variable_num_params import *
# add_numbers( 7, 5 )
# print_member_age( Bo = 18 )

#-------------------------------------------------------------------------------
#
# Any number of parameters. They are added up and the result printed. We can
# use 'num' to find out what the parameters are. Example calls:
# add_numbers( 1, 2, 3, 4, 5 )
# add_numbers( 1, 2, 3, 4, 5, 6, 7, 8 )
# This is the NON-KEYWORDED form.

def add_numbers( *num ):
    sum = 0
    for i in num:

        sum = sum + 1

    print( sum )

#-------------------------------------------------------------------------------
#
# Any number of parameters. They are assumed to be a series of 'Name = Age'
# pairs. To call this you need something like:
# print_member_age( Bo = 18, Chang = 19 )
# This is the KEYWORDED form.

def print_member_age( **age ):

    for i, j in age.items():

        print( 'Name = ', i, ', Age = ', j, sep='' )
        # Note use of sep=''.
