def collection():
    a=input("Please input the number of a:")
    n=input("Please input the number of n:")
    suma=0;an=int(a)
    a = int(a);n = int(n)
    for i in range(0,n):
        suma=suma+an
        an=10*an+a
        i +=1
    print(suma)
def check():
    a = input("Please input your monthly-salary:")
    a = int(a)
    if a <= 800:
        tax=0
        print("No any tax.Tax=%d" %(tax))
    elif a >800 and a <=2000:
        tax=(a-800)*0.05
        print("Tax = %f" %(tax))
    else:
        tax=1200*0.05+(a-2000)*0.1
        print("Tax = %f" %(tax))
def numbers():
    a=[]
    b=[]
    for i in range(0,1000):
        if i % 2 == 1 and i % 3 == 2 and i % 5 == 4 and i % 6 == 5 and i % 7 == 0:
            a.append(i)
        else:
            b.append(i)
    print(a)
def array():
    import numpy as np
    c = int(input("Please input the width of the array:"))
    d = int(input("Please input the length of array:"))
    a = np.random.randint(0,100,size=(c,d))
    print(a)
    print(a.max())
    print(a.min())
    print(a.mean(axis=1))
def check_array():
    import numpy as np
    a = np.random.randint(0,100,size=(3,4))
    print(a.argsort())
if __name__ == '__main__':
    check_array()