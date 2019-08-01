#lab9: For the factorial calculation and the incestgation calls.
def factoral(n):
    result = n;
    if n == 0:return( 1 ) 
    else:return( n * factorial( n - 1 ) ) 
def factoral_1(n):
    print('factoral called with argument',n)
    if n == 0:return( 1 ) 
    else:return( n * factorial( n - 1 ) ) 
