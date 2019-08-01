#******************************************************************************#
#                                                                              #
#                             create_dictionary.py                             #
#                                                                              #
# This is a program which shows the dictionary to use and also includes some   #
# words and datas so you can input and get the whole words in this dictionary. #                                                                              #
#******************************************************************************#

# To run this program, start python and then type:
# import create_dctionary.py
e1 = input("Words you want to say in English: ")
e2 = e1.split(" ")
e3 = len(e2)
if e3 % 2 !=0 : print("Please code in the even numbers and choose it again.")
if e3 % 2 == 0:
     
       
       word_dict = dict(zip(e2[::2],e2[1::2]))


       print(word_dict)
