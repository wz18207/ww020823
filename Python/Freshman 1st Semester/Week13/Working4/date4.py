xian_info = {'country' : 'China' , 'population' : 8705600, \
'universities' : [ 'Northwest', 'Chang\'an', 'Shaanxi Normal', \
'Xidian' ] } 
print(xian_info)
print(xian_info['country'])
print(xian_info['population'])

xian_info ['universities']
# Access individual universities:
print(xian_info ['universities'][0])
print(xian_info ['universities'][1])

# Add to dictionary:
xian_info ['Location'] = (34, 16, 'N', 108, 54, 'E')
# NBUsing a tuple of six elements for Latitude and Longitude
print(xian_info['Location'])
print(xian_info['Location'] [0])

print(xian_info)
del xian_info ['population']
print(xian_info)
