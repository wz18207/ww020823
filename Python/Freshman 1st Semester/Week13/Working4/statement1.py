temp_xian = { 'oct' : 15, 'nov' : 8, 'dec' : 2 }
for key in temp_xian:
   print(key)

for key in temp_xian:
    print(key, ' ', end='')
    print(temp_xian[ key ])

temp_xian = { 'oct' : 15, 'nov' : 8, 'dec' : 2 }
for item in temp_xian.items():
    print(item[ 0 ], item[ 1 ])
    
