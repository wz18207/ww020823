#Lab 7: For the range in the two sentence you have give.
#Lab 7: And check with ASCII in lens.
a = input("The first list you have to check:")
b = input("THe second list you want to check:")
a = a.encode("ASCII")
b = b.encode("ASCII")
a_1 = len(a)
b_1 = len(b)
min(a_1,b_1)
if a_1 < b_1: 
    print("True")
else: 
    print("False")
    