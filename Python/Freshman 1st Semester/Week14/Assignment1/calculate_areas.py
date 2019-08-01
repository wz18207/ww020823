#******************************************************************************#
#                                                                              #
#                                calculate_areas.py                            #
#                                                                              #
# Calculate areas of geometric shapes. You need to add code to it and toupdate the #
# comments.                                                                    #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# import calculate_areas


rect_length = 10
rect_height = 20
a = rect_length * rect_height
print('rect_length',rect_length)
print('rect_height',rect_height)
print('The area of a rectangle of lehgth %d and height %d is %d.'\
           %(rect_length ,rect_height, a))

circle_radius = 10
import math
a =math.pi * circle_radius * circle_radius
print('circle_radius',circle_radius)
print('The area of a circle of radius %2d is %16.13f.'%(circle_radius,a))

a = math.pi*circle_radius**2
print('The area of a circle of radius %2d is %16.13f.'%(circle_radius,a))
