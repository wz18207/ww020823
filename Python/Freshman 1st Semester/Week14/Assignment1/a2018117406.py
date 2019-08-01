#******************************************************************************#
#                                                                              #
#                               a2018117406.py                                 #
#                                                                              #
# This is your starting point for the first assignment. It has stubs for some  #
# of the functions you need and you can add any more as required.              #
#                                                                              #
# It also contains code at the end to allow the program to be called from the  #
# command line. This is mainly for us to evaluate your work but you can use it #
# as well. You can type from the CMD line:                                     #
#                                                                              #
# python a2018117406                                                           #
# python assignment_1_blank 2                                                  #
# etc.                                                                         #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# from a2018117406 import *
# choose_task()

# We need library sys for command-line processing at the bottom.
import sys
# Global variable for the dictionary
word_dict = {}
#-------------------------------------------------------------------------------
#
# Reads a number from user and based on it, runs one of the functions.

def choose_task():
    while (True): 
        print(" ")
        print("0. Exit()")
        print("1. Call calc_rectangle()")
        print("2. Call calc_triangle()")
        print("3. Call draw_triangle()") 
        print("4. Call set_dictionary()")
        print("5. Call lookup_sentence()")
        a = int(input("select_task:"))
        #Figure user's input.
        #This will print the line of the choices.
        #These will assume you to code the words in correct.
        #print( 'choose_task() not yet written!' )
        #Judge the number you have code in correct.  
        if a == 1: print("Call calc_rectangle()");calc_rectangle()
        elif a == 2: print("Call calc_triangle()");calc_triangle()
        elif a == 3: print("Call draw_triangle()");draw_triangle()
        elif a == 4: print("Call set_dictionary()");set_dictionary()
        elif a == 5: print("Call lookup_sentence()");lookup_sentence()
        elif a > 5: print("Please put the number in 0-5.")
        elif a < 0: print("Please put the number in 0-5")
        elif a == 0: print("Exit");exit()
    
#-------------------------------------------------------------------------------
#
# Reads two numbers from user and based on them, finds area of rectangle.

def calc_rectangle():
    #Try to input the number you wanted to calculate in this S'triangle functions.
    #print( 'calc_rectangle() not yet written!' )
    print("Please code all things in numbers.")
    rect_length = float(input("The length of rectangle:"))
    rect_height = float(input("The height of rectangle:")) 
    #Catch user's input,and running the function of this program.
    b3 = rect_length * rect_height
    print("The area of a rectangle  of length %.2f and height %.2f is %.2f "\
         %(rect_length,rect_height,b3))

#-------------------------------------------------------------------------------
#
# Reads three numbers from user and based on them, finds area of triangle using
# Heron's Formula.

def calc_triangle():
    #print( 'calc_triangle() not yet written!' )
    #Try to input the number you wanted to calculate in this S'triangle functions.
    print("Please code all things in numbers.")
    a = float(input("The first side-length of the triangle:"))
    b = float(input("The second side-length of the triangle:"))
    c = float(input("The third side-length of the triangle:"))
    p = (a+b+c)/2
    #Catch user's input,and running the function of this program.
    from math import sqrt
    area = sqrt(p*(p-a)*(p-b)*(p-c))
    print('The area of a circle of dimensions a = %5.2f, b = %5.2f, c = %5.2f using  Heron\'s Formula is %5.2f'\
          %(a,b,c,area))


#-------------------------------------------------------------------------------
#
# Reads a number from user and based on it, draws triangle on the screen using
# stars. e.g. if number is 3, we get:
# *
# **
# ***

def draw_triangle():
    #Use two loops to translates the users input and translates their idea.
    #Double loops in order to make the triangle in correct.
    #print( 'draw_triangle() not yet written!' )
    print("Please code all things in number.")
    d1 = int(input("The line you want in this triangle n:"))
    for d2 in range(d1):
        for d2 in range(0,d2+1):
            print("*",end = "")
        print(" ")


#-------------------------------------------------------------------------------
#
# Reads string from user containing dictionary information and converts to
# Python dictionary which is saved in a global variable word_dict.
# So if input was 'hello hi students everyone' then word_dict would become
# { 'hello': 'hi', 'students': 'everyone' }

def set_dictionary():
    #set down the dictionary in double words.
    #print( 'set_dictionary() not yet written!' )
    #"zip"means judge the words in key_parts and the value_parts in dictionary.
    e1 = input("Words you want to say in English and each divided in blank: ")
    e2 = e1.split(" ")
    #Catch the user's input.
    e3 = len(e2)
    #Check words in correct.
    global word_dict
    #Put this varable in golbal varable.
    word_dict = dict(zip(e2[::2],e2[1::2]))
    #Divide these words in dictionary's key and value by each two parts.
    if e3 % 2 !=0 : print("Please code in the even numbers and choose it again.")
    if e3 % 2 == 0: print(word_dict)
    #Running the correct variables.
     
#-------------------------------------------------------------------------------
#
# Reads a string from the user and converts it using the current dictionary in
# the global variable word_dict.
# So if input was 'hello students' and dictionary was { 'hello': 'hi',
# 'students': 'everyone' } then output would be 'hi everyone'.
def lookup_sentence():
    #print( 'lookup_sentence() not yet written!' )
    #Check the values you have put in this dictionary.
    print("Please code the words belongs to the part what you have coded in and each divide in blank:")
    f1 = input("Words you want to say:")
    f2 = f1.split(" ")
    
    for key in f2:
        print(word_dict[key],"",end="")
        #Use a loop to print the words difined in golbal varable.
      
choose_task()
      

#-------------------------------------------------------------------------------
#
# NB: THE FOLLOWING CODE IS PURELY FOR US TO CHECK YOUR CODE. IT IS NOT PART
# OF THE PROGRAM YOU ARE WRITING. DO NOT MODIFY OR ALTER THIS CODE IN ANY WAY.
#
# Allow the program to be run from the command line:
#
# python <filename> <integer 1-5>
#
# 0. Call choose_task()
# 1. Call calc_rectangle()
# 2. Call calc_triangle()
# 3. Call draw_triangle()
# 4. Call set_dictionary()
# 5. Call lookup_sentence()

if __name__ == '__main__':

    if len( sys.argv ) < 2:

        print( "Must have another command-line argument" )

    elif sys.argv[ 1 ] == '0':

        print( "choose_task():" )
        choose_task()

    elif sys.argv[ 1 ] == '1':

        print( "calc_rectangle():" )
        calc_rectangle()

    elif sys.argv[ 1 ] == '2':

        print( "calc_triangle():" )
        calc_triangle()

    elif sys.argv[ 1 ] == '3':

        print( "draw_triangle():" )
        draw_triangle()

    elif sys.argv[ 1 ] == '4':

        print( "set_dictionary():" )
        set_dictionary()

    elif sys.argv[ 1 ] == '5':

        print( "lookup_sentence():" )
        lookup_sentence()

    else:
        print( 'Bad argument')
