#******************************************************************************#
#                                                                              #
#                              self_demo.py                                    #
#                                                                              #
# Shows how 'self' works in a class.                                           #
#                                                                              #
#******************************************************************************#

# To run this program, start Python and then type:
# from self_demo import *

#-------------------------------------------------------------------------------
#
# Class ProgStaff
#
# Note we are using 'camelcase' for class names.
#
# Class has a variable 'company_name' which is not defined in any method. It is
# a 'class variable'. If ever that changes, it will also change in all
# instances of the class .
#
# __init__ method has a variable 'salary' prefixed by 'self'. This is an
# instance variable. It can be different for each instance of the class.
#
# print_info is an instance method. In that we use 'ProfStaff.' to access the
# class variable 'company_name' and we use 'self.' to access the instance
# variable 'salary'.

class ProgStaff:

    company_name = 'Programming Lab'

    def __init__( self, p_salary ):

        self.salary = p_salary

    def print_info( self ):

        print( 'Company name is', ProgStaff.company_name )
        print( 'Salary is', self.salary )

jiahao = ProgStaff( 2500 )
mei = ProgStaff( 2500 )
print( jiahao.company_name )
print( mei.company_name )

ProgStaff.company_name = 'Programming School'
# This affects all existing instances of ProgStaff

print( jiahao.company_name ) # Company name has now changed for both
print( mei.company_name )

jiahao.salary = 2700
# Only the salary of jiahao is updated because salary is an instance variable
print( jiahao.salary )
print( mei.salary )

mei.print_info()
# 'mei' gets mapped to 'self' so self.salary becomes mei.salary inside the
# method

ProgStaff.print_info( mei )
# This has the same effect. We put the class name first and pass the name of
# the instance variable as argument, whereupon it becomes 'self' inside the
# method
