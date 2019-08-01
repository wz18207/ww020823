import math
print(math.factorial(5))  # 5 * 4 * 3 * 2 * 1
print(math.factorial(1000))  # !!
print(math.fabs(10))  # Absolute value
print(math.fabs(-10))
print(math.gcd(6, 10))  # Greatest common divisor of 6 and 10
print(math.modf(1.3))  # Fractional and integer parts of 1.3
print(math.log10(100))  # Logarithm, Base 10
print(math.pi)  # The constant pi 
 
print(math.radians(30))
# Degrees converted to Radians,
# 2pi Radians = 360 Degrees 
 
print(math.sin(math.radians(30)))
# Sin 30 Degrees. math.sin etc work in Radians only! 
 
# We will show it. 30 Degrees = 30/360 * 2 * pi Radians
print(math.sin((30 / 360) * 2 * math.pi)) 
 
print(math.degrees(2 * math.pi))  # Convert Radians to Degrees 
 
