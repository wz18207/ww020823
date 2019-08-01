# This is a dictionary of basic data in our class
datas_varchar = ['number', 'id', 'names', 'address']
i = 1
number = i
print(number)
a = input('id = ')
b = input('names = ')
c = input('address = ')
data = dict(id=int(a), names=str(b), address=str(c))

print(data)

#  Loops on user's input datas here
i = 1
while i < 10:
     i = i + 1
     number = i
     del a;del c;del b;
     print(number)
     a = input('id = ')
     b = input('names = ')
     c = input('address = ')
     data = dict(id=int(a), names=str(b), address=str(c))

     print(data)

