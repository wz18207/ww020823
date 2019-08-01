#******************************************************************************#
#                                                                              #
#                           inheritance_demo.py                                #
#                                                                              #
# Demonstration of inheritance in Python Object-Oriented programming.          #
#                                                                              #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# from inheritance_demo import *
# Then you will be prompted:
# Hours worked for Jiahao, enter 120
# Hourly rate for Jiahao, enter 15
# It will give Jiahao's pay, i.e. 1800
# Hours worked for Mei, enter 150
# Hourly rate for Mei, enter 20
# It will give Mei's pay, i.e. 4000
# Performance grade for Mei, enter A
# It will give performance bonus for Mei, i.e. 1000

import class_demo3

jiahao = class_demo3.BasicStaff( 'Jiahao', 0 )
mei = class_demo3.ManagementStaff( 'Mei', 0, 1000, 0 )

print( jiahao )
print( mei )

print( 'Jiahao\'s Pay = ', jiahao.calculate_pay() )

print( 'Mei\'s Pay = ', mei.calculate_pay() )
print( 'Mei\'s Performance Bonus = ', mei.calculate_perf_bonus() )
