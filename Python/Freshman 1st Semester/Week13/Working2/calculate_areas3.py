a = 30; b = 24; c = 18;
p = (a + b + c) / 2
from math import sqrt
area = sqrt(p * (p - a) * (p - b) * (p - c))
print('The area of a circle of dimensions a = %d, b = %d, c = %d using  Heron\'s Formula is %d' % (a, b, c, area))
print(p)
print(area)
