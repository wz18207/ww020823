import re
print(re.findall('a', 'abfffad'))
# All instances of 'a' in the string
print(re.findall('a.', 'abfffad'))
# All instances of 'a' followed by any one character in the string
print(re.findall('a.*a', 'abfffad'))
# All instances of 'a' followed by one or more characters followed
# by another 'a'
print(re.findall('a|d', 'abfffad'))
# A single 'a' or a single 'd'
print(re.split(' |,', 'This, is a sentence'))
# Split a string where the pattern matches, i.e. a single space or
# a single comma
print(re.split(' |,|\.', 'This, is a sentence.'))
# Split a string where the pattern matches, i.e. a single space or
# a single comma, or a single fullstop
# Note: '.' matches any one character, '\.' matches the fullstop
# itself 
 
