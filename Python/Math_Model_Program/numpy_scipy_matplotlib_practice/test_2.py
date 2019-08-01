def m_n():
    b = False
    i = int(input('enter an integer please:'))
    for a in range(0, i):
        for c in range(2, a):
            if a % c == 0:
                b= False
                break
            else:
                b = True
        if b == True:
            print(a)
if __name__ == '__main__':
    m_n()