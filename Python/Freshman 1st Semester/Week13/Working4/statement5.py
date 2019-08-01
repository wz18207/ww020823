x = 0
for x in range(0, 4):
    print(x)
    if x == 1:
        continue
    print('Last line') 

x = 1
y = 0
try:
    print(x / y)
except:
    print('Error')

x = 1
y = 2
try:
    print(x / y)
except:
    print('Error')

x = 1
y = 0
try:
    print(x / y)
except Exception as e:
    print('Error', e)

