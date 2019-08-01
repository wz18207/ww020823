#******************************************************************************#
#                                                                              #
#                              a2018117406.py                                  #
#                                                                              #
# This is for checking the dictionary and put the information into dictionary. #
#                                                                              #
# It also use the idea of database. To make such enough contexts and use these #
# contexts and make all the checking_informations from the dictionary.         #
#                                                                              #
#                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# from a2018117406 import *
# choose_task()

# We need library sys for command-line processing at the bottom.
import sys

# Global variable for the city data:
city_raw_filename = ""
city_filename = ""
cities_xian = {}
cities_suzhou = {}
cities_shanghai = {}
cities_chongqing = {}
#-------------------------------------------------------------------------------
#
# Reads a number from user and based on it, runs one of the functions.

def choose_task():
    #print( 'choose_task() not yet written!' )
    while (True): 
        print("0. Exit()")
        print("1. Call load_city_data()")
        print("2. Call  answer_questions()")
        a = int(input("select_task:"))
        #Figure user's input.
        #This will print the line of the choices.
        #These will assume you to code the words in correct.
        #print( 'choose_task() not yet written!' )
        #Judge the number you have code in correct.  
        if a == 1: print("Call load_city_data()");load_city_data()
        elif a == 2: print("Call answer_questions()");answer_questions()
        elif a > 2: print("Please put the number in 0-2.")
        elif a < 0: print("Please put the number in 0-2")
        elif a == 0: exit()

#-------------------------------------------------------------------------------
#
# Prompts for and then reads in a city name. Converts to lower case with no
# single quotes. Adds '_info.txt' to the end.

def get_city_filename():
    #print( 'get_city_filename() not yet written!' )
    import sys
    import re
    #To check the user's input and the change all into the lower name.
    global city_filename,city_raw_filename
    #To let these variables could be used in other self-variables.
    city_raw_filename = input("One city name:")
    #To get the users input.
    city_raw_filename = city_raw_filename.lower()
    #To change all the informations in lowers.
    check= city_raw_filename.find('\'')
    #Remove any single quotes.
    if check != -1:
        #check whether the users input in correct.
        city_raw_filename = re.sub('\'','',city_raw_filename) 
        city_raw_filename = str(city_raw_filename)
        # append to the files.
        city_filename = city_raw_filename+"_info.txt"
    
    elif check == -1:
        #Also do the same things again.
        city_raw_filename = str(city_raw_filename)
        city_filename = city_raw_filename+"_info.txt"
 
#-------------------------------------------------------------------------------
#
# Tries to open city_filename. If success, tries to load in data and assign
# as entry in global dictionary cities. If not success, does nothing further.
# This will take us back to choose_task().

def load_data_for_city(city_filename):
    #print( 'load_data_for_city() not yet written!' )
    import os
    import linecache
    global cities,cities_xian,cities_suzhou,cities_shanghai,cities_chongqing
    #Make two lists in Python and index them into a 
    key_dict = ['name','country','population','universities','location','temperature']
    #Read all the files in the files.
    #To let each dictionary in correct.
    judgement = os.path.exists(city_filename)
    #Check the lines in correct in these files.
    #Check the file whether it's exist.
    if judgement == False:
        #Check in error.
        print("Please input the correct city.")
        #Reply the error informations.
    else:
    	  #Take each line from the txt files.
        raw_read = open(city_filename)
        lines_txt = len((open(city_filename)).readlines())
        values_dict = []
        #Put the information into the dictionary.
        #Get he 1st  line from the program.
        line_1 = linecache.getline(city_filename, 1)
        line_1 = line_1.strip("\n")
        #Get the second line from the program.
        line_2 = linecache.getline(city_filename,2)
        line_2 = line_2.strip("\n")
        #Get the 3rd line from the program.
        line_4 = linecache.getline(city_filename,3)
        line_4 = line_4.strip("\n")
        #Get the 4th line from the program.
        line_5 = linecache.getline(city_filename,4)
        line_5 = line_5.strip("\n")
        #Get the 5th line from the program.
        line_6 = linecache.getline(city_filename,5)
        line_6 = line_6.strip("\n")
        #Get the 6th line from the program.
        line_7 = linecache.getline(city_filename,6)
        line_7 = line_7.strip("\n")
        if city_filename == 'xian_info.txt':
            if lines_txt != 6:
                #Checking in error.
                print("There are lines error in the text files.")
            if len(line_1) != 5:
                print("The 1st line in error.")
            if len(line_2) != 5:
                print("The 2rd line in error.")
            if len(line_4) != 7:
                print("The 3nd line in error.")
            if len(line_5) != 40:
                print("The 4th line in error.")
            if len(line_6) != 16:
                print("The 5th line in error.")
            if len(line_7) != 30:
                print("The 6th line in error.") 
            #While it is true:
            #We try to put the correct files into the dictionary.
            elif lines_txt == 6 and len(line_1) == 5 and len(line_2) == 5 and len(line_4) == 7 and len(line_5) == 40 and len(line_6) == 16 and len(line_7) == 30:
                    line_5 = line_5.replace(' ',',')
                    line_5 = line_5.split(",")
                    line_6 = line_6.replace(' ',',')
                    line_6 = line_6.split(",")
                    line_3 = (int(line_6[0]),int(line_6[1]),str(line_6[2]),int(line_6[3]),int(line_6[4]),str(line_6[5]))
                    line_7 = line_7.replace(' ', ',')
                    line_7 = line_7.split(",")
                    line_7 = [int(x) for x in line_7]
                    values_dict = [str(line_1),str(line_2),int(line_4),line_5,line_3,line_7]
                    cities = dict(zip(key_dict,values_dict))
                    print("cities['%s'] = %s" %(city_raw_filename,cities))
        elif city_filename == 'suzhou_info.txt':
            if lines_txt != 6:
                #Checking in error.
                print("There are lines error in the text files.")
            if len(line_1) != 6:
                print("The 1st line in error.")
            if len(line_2) != 5:
                print("The 2rd line in error.")
            if len(line_4) != 8:
                print("The 3nd line in error.")
            if len(line_5) != 23:
                print("The 4th line in error.")
            if len(line_6) != 16:
                print("The 5th line in error.")
            if len(line_7) != 33:
                print("The 6th line in error.")
            #While it is true:
            #We try to put the correct files into the dictionary.
            elif lines_txt == 6 and len(line_1) == 6 and len(line_2) == 5 and len(line_4) == 8 and len(line_5) == 23 and len(line_6) == 16 and len(line_7) == 33:
                line_5 = line_5.replace(' ',',')
                line_5 = line_5.split(",")
                line_6 = line_6.replace(' ',',')
                line_6 = line_6.split(",")
                line_3 = (int(line_6[0]),int(line_6[1]),str(line_6[2]),int(line_6[3]),int(line_6[4]),str(line_6[5]))
                line_7 = line_7.replace(' ', ',')
                line_7 = line_7.split(",")
                line_7 = [int(x) for x in line_7]
                values_dict = [str(line_1),str(line_2),int(line_4),line_5,line_3,line_7]
                cities = dict(zip(key_dict,values_dict))
                print("cities['%s'] = %s" %(city_raw_filename,cities))        
        elif city_filename == 'shanghai_info.txt':
            if lines_txt != 6:
                #Checking in error.
                print("There are lines error in the text files.")
            if len(line_1) != 8:
                print("The 1st line in error.")
            if len(line_2) != 5:
                print("The 2rd line in error.")
            if len(line_4) != 8:
                print("The 3nd line in error.")
            if len(line_5) != 31:
                print("The 4th line in error.")
            if len(line_6) != 16:
                print("The 5th line in error.")
            if len(line_7) != 33:
                print("The 6th line in error.")
            #While it is true:
            #We try to put the correct files into the dictionary.
            elif lines_txt == 6 and len(line_1) == 8 and len(line_2) == 5 and len(line_4) == 8 and len(line_5) == 31 and len(line_6) == 16 and len(line_7) == 33:
                line_5 = line_5.replace(' ',',')
                line_5 = line_5.split(",")
                line_6 = line_6.replace(' ',',')
                line_6 = line_6.split(",")
                line_3 = (int(line_6[0]),int(line_6[1]),str(line_6[2]),int(line_6[3]),int(line_6[4]),str(line_6[5]))
                line_7 = line_7.replace(' ', ',')
                line_7 = line_7.split(",")
                line_7 = [int(x) for x in line_7]
                values_dict = [str(line_1),str(line_2),int(line_4),line_5,line_3,line_7]
                cities = dict(zip(key_dict,values_dict))
                print("cities['%s'] = %s" %(city_raw_filename,cities))        
        elif city_filename == 'chongqing_info.txt':
            if lines_txt != 6:
                #Checking in error.
                print("There are lines error in the text files.")
            if len(line_1) != 9:
                print("The 1st line in error.")
            if len(line_2) != 5:
                print("The 2rd line in error.")
            if len(line_4) != 8:
                print("The 3nd line in error.")
            if len(line_5) != 55:
                print("The 4th line in error.")
            if len(line_6) != 16:
                print("The 5th line in error.")
            if len(line_7) != 35:
                print("The 6th line in error.")
            #While it is true:
            #We try to put the correct files into the dictionary.
            elif lines_txt == 6 and len(line_1) == 9 and len(line_2) == 5 and len(line_4) == 8 and len(line_5) == 55 and len(line_6) == 16 and len(line_7) == 35: 
                #Check in correct.
                #Read and check ther files.
                line_5 = line_5.replace(' ',',')
                line_5 = line_5.split(",")
                line_6 = line_6.replace(' ',',')
                line_6 = line_6.split(",")
                line_3 = (int(line_6[0]),int(line_6[1]),str(line_6[2]),int(line_6[3]),int(line_6[4]),str(line_6[5]))
                line_7 = line_7.replace(' ', ',')
                line_7 = line_7.split(",")
                line_7 = [int(x) for x in line_7]
                values_dict = [str(line_1),str(line_2),int(line_4),line_5,line_3,line_7]
                cities = dict(zip(key_dict,values_dict))
                print("cities['%s'] = %s" %(city_raw_filename,cities))
    if city_filename == 'xian_info.txt':
    #Take the information into different dictionary from files.
    #Do the same thing upload before.
        raw_read = open('xian_info.txt','r')
        values_dict = []
        for line in raw_read.readlines():
            values_dict.extend(line.strip("\n").split(',')) 
            cities_xian = dict(zip(key_dict,values_dict))
    elif city_filename == 'suzhou_info.txt':
        raw_read = open('suzhou_info.txt','r')
        values_dict = []
        for line in raw_read.readlines():
            values_dict.extend(line.strip("\n").split(',')) 
            cities_suzhou = dict(zip(key_dict,values_dict))
    elif city_filename == 'shanghai_info.txt':
        raw_read = open('shanghai_info.txt','r')
        values_dict = []
        for line in raw_read.readlines():
            values_dict.extend(line.strip("\n").split(',')) 
            cities_shanghai = dict(zip(key_dict,values_dict))
    elif city_filename == 'chongqing_info.txt':    
        raw_read = open('chongqing_info.txt','r')
        values_dict = []
        for line in raw_read.readlines():
            values_dict.extend(line.strip("\n").split(',')) 
            cities_chongqing = dict(zip(key_dict,values_dict))
        raw_read = open(city_filename,'r')
#-------------------------------------------------------------------------------
#
# Reads in data for one city, first prompting the user for a valid city
# name.

def load_city_data():
    # Loading the functions.
    #Check the informations.
    get_city_filename()
    load_data_for_city(city_filename)

#-------------------------------------------------------------------------------
#
# Reads in a series of questions from the user. Answers each one. When user just
# types ENTER with nothing on the line, finishes. This will return control to
# choose_task().

def answer_questions():
    import os
    #print( 'answer_questions() not yet written!' )
    #Transerve all the keys in the dictionary and read them by each.
    users_input = input("The information you wang to check:")
    #Check all thw word and let them into the different parts.
    if users_input == 'largest population':
    #Read the populations in dictionary.
        pop_xian = cities_xian.get('population')
        pop_suzhou = cities_suzhou.get('population')
        pop_shanghai = cities_shanghai.get('population')
        pop_chongqing = cities_chongqing.get('population')
        #Read the city_names in the dictionary.
        name_xian = cities_xian.get('name')
        name_suzhou = cities_suzhou.get('name')
        name_shanghai = cities_shanghai.get('name')
        name_chongqing = cities_chongqing.get('name')
        #Check whether the word in the correct and the word existance.
        a = [pop_xian,pop_suzhou,pop_shanghai,pop_chongqing]
        a_count = a.count(None)
        #There are none dictionary.
        if a_count == 4:
            print("No such city.")
        #When there are only one dict.
        elif a_count == 3:
            for i in range(len(a)-1,-1,-1):
                if a[i] == None:
                    a.pop(i)
            a = list(map(int, a))
            #Check all the number in correct.
            #Check each word in correct.
            max_pop = max(a)
            if str(max_pop) == pop_xian:
                print("The largest city is Xi'an. It has a population of %s."%(int(pop_xian)))
                print(pop_xian)
            elif str(max_pop) == pop_suzhou:
                print("The largest city is SuZhou. It has a population of %s."%(int(pop_suzhou)))
                print(pop_suzhou)
            elif str(max_pop) == pop_shanghai:
                print("The largest city is ShangHai. It has a population of %s." %(int(pop_shanghai)))
                print(pop_shanghai)
            elif str(max_pop) == pop_chongqing:
                print("The largest city is ChongQing. It has a population of %s."%(int(pop_chongqing)))
                print(pop_chongqing)
        elif a_count == 2:
        	#Check each word in corret.
            for i in range(len(a)-1,-1,-1):
                if a[i] == None:
                    a.pop(i)
            a = list(map(int, a))
            max_pop = max(a)
            #Check each word in correct.
            #Check the largest populations in values of the "population" key under this dictionary.
            if str(max_pop) == pop_xian:
                print("The largest city is Xi'an. It has a population of %s."%(int(pop_xian)))
            elif str(max_pop) == pop_suzhou:
                print("The largest city is SuZhou. It has a population of %s."%(int(pop_suzhou)))
            elif str(max_pop) == pop_shanghai:
                print("The largest city is ShangHai. It has a population of %s." %(int(pop_shanghai)))
            elif str(max_pop) == pop_chongqing:
                print("The largest city is ChongQing. It has a population of %s."%(int(pop_chongqing)))
            print(a[0]+a[1])
        elif a_count == 1:
        	#Check each word in corret.
            for i in range(len(a)-1,-1,-1):
                if a[i] == None:
                    a.pop(i)
            a = list(map(int, a))
            max_pop = max(a)
            if str(max_pop) == pop_xian:
            	 #Check the largest populations in values of the "population" key under this dictionary.
                print("The largest city is Xi'an. It has a population of %s."%(int(pop_xian)))
            elif str(max_pop) == pop_suzhou:
                print("The largest city is SuZhou. It has a population of %s."%(int(pop_suzhou)))
            elif str(max_pop) == pop_shanghai:
                print("The largest city is ShangHai. It has a population of %s." %(int(pop_shanghai)))
            elif str(max_pop) == pop_chongqing:
                print("The largest city is ChongQing. It has a population of %s."%(int(pop_chongqing)))
            print(a[0]+a[1]+a[2])
        elif a_count == 0:
            max_pop = max(int(pop_xian),int(pop_suzhou),int(pop_shanghai),int(pop_chongqing))
            if max_pop == int(pop_xian):
                print("The largest city is Xi'an. It has a population of %s."%(int(pop_xian)))
            #Check the largest populations in values of the "population" key under this dictionary.
            max_pop = max(int(pop_xian),int(pop_suzhou),int(pop_shanghai),int(pop_chongqing))
            if max_pop == int(pop_xian):
                print("The largest city is Xi'an. It has a population of %s."%(int(pop_xian)))
            elif max_pop == int(pop_suzhou):
                print("The largest city is SuZhou. It has a population of %s."%(int(pop_suzhou)))
            elif max_pop == int(pop_shanghai):
                print("The largest city is ShangHai. It has a population of %s." %(int(pop_shanghai)))
            elif max_pop == int(pop_chongqing):
                print("The largest city is ChongQing. It has a population of %s."%(int(pop_chongqing)))
            print(int(pop_xian)+int(pop_suzhou)+int(pop_shanghai)+int(pop_chongqing))
    #Check others informations in these dictionary.
    else:
        #Transerve the informations "populations" in the dictionaries.
        users_input = users_input.split(" ")
        pop_xian = cities_xian.get('population')
        pop_suzhou = cities_suzhou.get('population')
        pop_shanghai = cities_shanghai.get('population')
        pop_chongqing = cities_chongqing.get('population')
        #Read "populations" by each one cities. 
        if users_input[0] == 'population':
            #Check the informations in correct.
            if len(users_input) == 2:
                if users_input[1] == "Xi'an":
                    if pop_xian == None:
                        print("No such city.")
                    else:
                        print(pop_xian)
                elif users_input[1] == "SuZhou":
                    if pop_suzhou == None:
                        print("No such city.")
                    else:
                        print(pop_suzhou)
                elif users_input[1] == "ShangHai":
                    if pop_shanghai == None:
                        print("No such city.")
                    else:
                        print(pop_shanghai)
                elif users_input[1] == "ChongQing":
                    if pop_chongqing == None:
                        print("No such city.")
                    else: 
                        print(pop_chongqing)
                else:
                    print("No such city.")
            #Check the information whether in correct formats.
            if len(users_input) < 2:
                #Check the informations out the lines in informations.
                print("Please input the correct informations.")
                #Check the informations whether below the informations.
            if len(users_input) > 5:
                print("Too much cities.")
            if len(users_input) == 3:
                #Transerve the keys again.
                #Check each dictionary exist or not.
                #Check first_double_cities populations in the first lines.
                if users_input[1] == "Xi'an":
                    if pop_xian == None:
                        print("No such city.")
                    else:
                        print(pop_xian)
                elif users_input[1] == "SuZhou":
                    if pop_suzhou == None:
                        print("No such city.")
                    else:
                        print(pop_suzhou)
                elif users_input[1] == "ShangHai":
                    if pop_shanghai == None:
                        print("No such city.")
                    else:
                        print(pop_shanghai)
                elif users_input[1] == "ChongQing":
                    if pop_chongqing == None:
                        print("No such city.")
                    else: 
                        print(pop_chongqing)
                else:
                    print("No such city.")
                #Check the informations in twice_lines.
                if users_input[2] == "Xi'an":
                    if pop_xian == None:
                        print("No such city.")
                    else:
                        print(pop_xian)
                elif users_input[2] == "SuZhou":
                    if pop_suzhou == None:
                        print("No such city.")
                    else:
                        print(pop_suzhou)
                elif users_input[2] == "ShangHai":
                    if pop_shanghai == None:
                        print("No such city.")
                    else:
                        print(pop_shanghai)
                elif users_input[2] == "ChongQing":
                    if pop_chongqing == None:
                        print("No such city.")
                    else: 
                        print(pop_chongqing)
                else:
                    print("No such city.")
            #Transerve the keys again.
            #Check first_double_cities populations in the third lines.   
            #Check these word into dofferent lines.    
            elif len(users_input) == 4:
                if users_input[1] == "Xi'an":
                    if pop_xian == None:
                        print("No such city.")
                    else:
                        print(pop_xian)
                elif users_input[1] == "SuZhou":
                    if pop_suzhou == None:
                        print("No such city.")
                    else:
                        print(pop_suzhou)
                elif users_input[1] == "ShangHai":
                    if pop_shanghai == None:
                        print("No such city.")
                    else:
                        print(pop_shanghai)
                elif users_input[1] == "ChongQing":
                    if pop_chongqing == None:
                        print("No such city.")
                    else: 
                        print(pop_chongqing)
                else:
                    print("No such city.")
                if users_input[2] == "Xi'an":
                    if pop_xian == None:
                        print("No such city.")
                    else:
                        print(pop_xian)
                elif users_input[2] == "SuZhou":
                    if pop_suzhou == None:
                        print("No such city.")
                    else:
                        print(pop_suzhou)
                elif users_input[2] == "ShangHai":
                    if pop_shanghai == None:
                        print("No such city.")
                    else:
                        print(pop_shanghai)
                elif users_input[2] == "ChongQing":
                    if pop_chongqing == None:
                        print("No such city.")
                    else: 
                        print(pop_chongqing)
                else:
                    print("No such city.")
                if users_input[3] == "Xi'an":
                    if pop_xian == None:
                        print("No such city.")
                    else:
                        print(pop_xian)
                elif users_input[3] == "SuZhou":
                    if pop_suzhou == None:
                        print("No such city.")
                    else:
                        print(pop_suzhou)
                elif users_input[3] == "ShangHai":
                    if pop_shanghai == None:
                        print("No such city.")
                    else:
                        print(pop_shanghai)
                elif users_input[3] == "ChongQing":
                    if pop_chongqing == None:
                        print("No such city.")
                    else: 
                        print(pop_chongqing)
                else:
                    print("No such city.")
        #Transerve the dictionary again.
        #Check the informations in positions.
        #Check the dictionary into the different parts.
        #Transerve the each values from the dictionary and devide them.
        elif users_input[0] == 'position':
            loal_xian = cities_xian.get('location')
            loal_suzhou = cities_suzhou.get('location')
            loal_shanghai = cities_shanghai.get('location')
            loal_chongqing = cities_chongqing.get('location')
            a = [loal_xian,loal_suzhou,loal_shanghai,loal_chongqing]
            for i in range(len(a)-1,-1,-1):
                if a[i] == None:
                    a.pop(i)
            if len(users_input) == 2:
                if users_input[1] == "Xi'an":
                    if loal_xian == None:
                        print("No such city.")
                    else:
                        print("The position of Xi'an is %s." %(loal_xian))
                elif users_input[1] == "SuZhou":
                    if loal_suzhou == None:
                        print("No such city.")
                    else:
                        print("The position of SuZhou is %s." %(loal_suzhou))
                elif users_input[1] == "ShangHai":
                    if loal_shanghai == None:
                        print("No such city.")
                    else:
                        print("The position of ShangHai is %s." %(loal_shanghai))
                elif users_input[1] == "ChongQing":
                    if loal_chongqing == None:
                        print("No such city.")
                    else: 
                        print("The position of ChongQing is %s." %(loal_chongqing))
                else:
                    print("No such city.")
        #Transerve the dictionary again.
        #Check the informations in positions.
        #Check the each word into different parts.
        #And seperate each words into the different parts.
        elif users_input[0] == 'temp':
            temp_xian = cities_xian.get('temperature')
            temp_suzhou = cities_suzhou.get('temperature')
            temp_shanghai = cities_shanghai.get('temperature')
            temp_chongqing = cities_chongqing.get('temperature')
            #Devided them into different labs.
            
            #Find them into the different lines.
            #Transerve each months into the different lines of the weathers.
            if users_input[1] == "Xi'an":
                
                if temp_xian == None:
                    print("No such city.")
                elif temp_xian != None:
                    #Devided them into different labs.
                    temp_xian = temp_xian.split(" ")
                    if users_input[2] == 'January':
                        print("The average temperature in Xi'an during January is %d Centigrade." %(int(temp_xian[0])))
                    elif users_input[2] == 'February':
                        print("The average temperature in Xi'an during February is %d Centigrade." %(int(temp_xian[1])))
                    elif users_input[2] == 'March':
                        print("The average temperature in Xi'an during March is %d Centigrade." %(int(temp_xian[2])))
                    elif users_input[2] == 'April':
                        print("The average temperature in Xi'an during April is %d Centigrade." %(int(temp_xian[3])))
                    elif users_input[2] == 'May':
                        print("The average temperature in Xi'an during May is %d Centigrade." %(int(temp_xian[4])))
                    elif users_input[2] == 'June':
                        print("The average temperature in Xi'an during June is %d Centigrade." %(int(temp_xian[5])))
                    elif users_input[2] == 'July':
                        print("The average temperature in Xi'an during July is %d Centigrade." %(int(temp_xian[6])))
                    elif users_input[2] == 'August':
                        print("The average temperature in Xi'an during August is %d Centigrade." %(int(temp_xian[7])))
                    elif users_input[2] == 'September':
                        print("The average temperature in Xi'an during September is %d Centigrade." %(int(temp_xian[8])))
                    elif users_input[2] == 'October':
                        print("The average temperature in Xi'an during October is %d Centigrade." %(int(temp_xian[9])))
                    elif users_input[2] == 'November':
                        print("The average temperature in Xi'an during November is %d Centigrade." %(int(temp_xian[10])))
                    elif users_input[2] == 'December':
                        print("The average temperature in Xi'an during December is %d Centigrade." %(int(temp_xian[11])))                
                    else:
                        print("Please input the correct month.")
            #Find them into the different lines.
            #Transerve each months into the different lines of the weathers.
            elif users_input[1] == "SuZhou":
                if temp_suzhou == None:
                    print("No such city.")
                elif temp_suzhou != None:
                #Devided them into different labs.
                    temp_suzhou = temp_suzhou.split(" ")
                    if users_input[2] == 'January':
                        print("The average temperature in SuZhou during January is %d Centigrade." %(int(temp_suzhou[0])))
                    elif users_input[2] == 'February':
                        print("The average temperature in SuZhou during February is %d Centigrade." %(int(temp_suzhou[1])))
                    elif users_input[2] == 'March':
                        print("The average temperature in SuZhou during March is %d Centigrade." %(int(temp_suzhou[2])))
                    elif users_input[2] == 'April':
                        print("The average temperature in SuZhou during April is %d Centigrade." %(int(temp_suzhou[3])))
                    elif users_input[2] == 'May':
                        print("The average temperature in SuZhou during May is %d Centigrade." %(int(temp_suzhou[4])))
                    elif users_input[2] == 'June':
                        print("The average temperature in SuZhou during June is %d Centigrade." %(int(temp_suzhou[5])))
                    elif users_input[2] == 'July':
                        print("The average temperature in SuZhou during July is %d Centigrade." %(int(temp_suzhou[6])))
                    elif users_input[2] == 'August':
                        print("The average temperature in SuZhou during August is %d Centigrade." %(int(temp_suzhou[7])))
                    elif users_input[2] == 'September':
                        print("The average temperature in SuZhou during September is %d Centigrade." %(int(temp_suzhou[8])))
                    elif users_input[2] == 'October':
                        print("The average temperature in SuZhou during October is %d Centigrade." %(int(temp_suzhou[9])))
                    elif users_input[2] == 'November':
                        print("The average temperature in SuZhou during November is %d Centigrade." %(int(temp_suzhou[10])))
                    elif users_input[2] == 'December':
                        print("The average temperature in SuZhou during December is %d Centigrade." %(int(temp_suzhou[11])))                
                    else:
                        print("Please input the correct month.")
            #Find them into the different lines.
            #Transerve each months into the different lines of the weathers.
            elif users_input[1] == "ShangHai":
                if temp_shanghai == None:
                    print("No such cities.")
                elif temp_shanghai != None:
                #Devided them into different labs.
                    temp_shanghai = temp_shanghai.split(" ")
                    if users_input[2] == 'January':
                        print("The average temperature in ShangHai during January is %d Centigrade." %(int(temp_shanghai[0])))
                    elif users_input[2] == 'February':
                        print("The average temperature in ShangHai during February is %d Centigrade." %(int(temp_shanghai[1])))
                    elif users_input[2] == 'March':
                        print("The average temperature in ShangHai during March is %d Centigrade." %(int(temp_shanghai[2])))
                    elif users_input[2] == 'April':
                        print("The average temperature in ShangHai during April is %d Centigrade." %(int(temp_shanghai[3])))
                    elif users_input[2] == 'May':
                        print("The average temperature in ShangHai during May is %d Centigrade." %(int(temp_shanghai[4])))
                    elif users_input[2] == 'June':
                        print("The average temperature in ShangHai during June is %d Centigrade." %(int(temp_shanghai[5])))
                    elif users_input[2] == 'July':
                        print("The average temperature in ShangHai during July is %d Centigrade." %(int(temp_shanghai[6])))
                    elif users_input[2] == 'August':
                        print("The average temperature in ShangHai during August is %d Centigrade." %(int(temp_shanghai[7])))
                    elif users_input[2] == 'September':
                        print("The average temperature in ShangHai during September is %d Centigrade." %(int(temp_shanghai[8])))
                    elif users_input[2] == 'October':
                        print("The average temperature in ShangHai during October is %d Centigrade." %(int(temp_shanghai[9])))
                    elif users_input[2] == 'November':
                        print("The average temperature in ShangHai during November is %d Centigrade." %(int(temp_shanghai[10])))
                    elif users_input[2] == 'December':
                        print("The average temperature in ShangHai during December is %d Centigrade." %(int(temp_shanghai[11])))                
                    else:
                        print("Please input the correct month.")
            #Find them into the different lines.
            #Transerve each months into the different lines of the weathers.          
            elif users_input[1] == "ChongQing":
                if temp_chongqing == None:
                    print("No such city.")
                elif temp_chongqing != None:
                    temp_chongqing = temp_chongqing.split(" ")
                    if users_input[2] == 'January':
                        print("The average temperature in ChongQing during January is %d Centigrade." %(int(temp_chongqing[0])))
                    elif users_input[2] == 'February':
                        print("The average temperature in ChongQing during February is %d Centigrade." %(int(temp_chongqing[1])))
                    elif users_input[2] == 'March':
                        print("The average temperature in ChongQing during March is %d Centigrade." %(int(temp_chongqing[2])))
                    elif users_input[2] == 'April':
                        print("The average temperature in ChongQing during April is %d Centigrade." %(int(temp_chongqing[3])))
                    elif users_input[2] == 'May':
                        print("The average temperature in ChongQing during May is %d Centigrade." %(int(temp_chongqing[4])))
                    elif users_input[2] == 'June':
                        print("The average temperature in ChongQing during June is %d Centigrade." %(int(temp_chongqing[5])))
                    elif users_input[2] == 'July':
                        print("The average temperature in ChongQing during July is %d Centigrade." %(int(temp_chongqing[6])))
                    elif users_input[2] == 'August':
                        print("The average temperature in ChongQing during August is %d Centigrade." %(int(temp_chongqing[7])))
                    elif users_input[2] == 'September':
                        print("The average temperature in ChongQing during September is %d Centigrade." %(int(temp_chongqing[8])))
                    elif users_input[2] == 'October':
                        print("The average temperature in ChongQing during October is %d Centigrade." %(int(temp_chongqing[9])))
                    elif users_input[2] == 'November':
                        print("The average temperature in ChongQing during November is %d Centigrade." %(int(temp_chongqing[10])))
                    elif users_input[2] == 'December':
                        print("The average temperature in ChongQing during December is %d Centigrade." %(int(temp_chongqing[11])))                
                    else:
                        print("Please input the correct month.")
                    #Output the incorrect informations.
            else:
                print("Please input the correct informations.")
        #Output the error informations as the users input.
        else:
            print("Please input the correct information.")
choose_task()
#-------------------------------------------------------------------------------
#
# NB: THE FOLLOWING CODE IS PURELY FOR US TO CHECK YOUR CODE. IT IS NOT PART
# OF THE PROGRAM YOU ARE WRITING. DO NOT MODIFY OR ALTER THIS CODE IN ANY WAY.
#
# Allow the program to be run from the command line:
#
# python <filename> <integer 0-2>
#
# 0. Call choose_task()
# 1. Call load_city_data()
# 2. Call answer_questions()

if __name__ == '__main__':

    if len( sys.argv ) < 2:

        print( "Must have another command-line argument" )

    elif sys.argv[ 1 ] == '0':

        print( "choose_task():" )
        choose_task()

    elif sys.argv[ 1 ] == '1':

        print( "load_city_data():" )
        print( cities )
        load_city_data()
        print( cities )

    elif sys.argv[ 1 ] == '2':

        print( "answer_questions():" )
        answer_questions()

    else:
        print( 'Bad argument' )