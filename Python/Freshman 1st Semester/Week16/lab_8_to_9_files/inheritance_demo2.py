#******************************************************************************#
#                                                                              #
#                          inheritance_demo2.py                                #
#                                                                              #
# Demonstration of inheritance in Python Object-Oriented programming.          #
#                                                                              #
# This version shows the overloading of the + operator to apply to Staff       #
# objects.                                                                     #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# from inheritance_demo2 import *
# Enter the following when prompted: 120, 15, 150, 20, A
# (For more explanation on these figures, see start of inheritance_demo.py)
# Total Pay for Both Staff should be 5800

import class_demo4
# This version of class_demo has the overloading of +

jiahao = class_demo4.BasicStaff( 'Jiahao', 0 )
mei = class_demo4.ManagementStaff( 'Mei', 0, 1000, 0 )

print( jiahao )
print( mei )

print( 'Jiahao\'s Pay = ', jiahao.calculate_pay() )

print( 'Mei\'s Pay = ', mei.calculate_pay() )
print( 'Mei\'s Performance Bonus = ', mei.calculate_perf_bonus() )

total_pay = jiahao + mei
print( '\nTotal Pay for Both Staff = ', total_pay )
