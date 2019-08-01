#******************************************************************************#
#                                                                              #
#                          format_strings_numbers.py                           #
#                                                                              #
# Format strings and numbers in different ways. You need to add code to it and to update the        #
# comments.                                                                    #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# import format_strings_numbers

print("{value:>12}".format(value='Northwest'))
print("{value:>12}".format(value='University'))
print("{value:>12}".format(value='in'))
print("{value:>12}".format(value='Xi\'an'))
print("{value:>12}".format(value='was'))
print("{value:>12}".format(value='found'))
print("{value:>12}".format(value='in'))
print("{value:>12}".format(value='1902'))

a1 = round(345.45,2)
a2 = round(213525.3456,2)
a3 = round(3.1,2)
a4 = round(2,2)

print("{value:<10}".format(value='%10.2f') %a1)
print("{value:<10}".format(value='%10.2f') %a2)
print("{value:<10}".format(value='%10.2f') %a3)
print("{value:<10}".format(value='%10.2f') %a4)

