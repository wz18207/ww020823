import geocoder
#查询经纬度
#g = geocoder.google("1403 Washington Ave, New Orleans, LA 70130")
#g = geocoder.arcgis(u"陕西省西安市太乙路229号")
#print(g.latlng)
#print(g.geojson)

#查询ip
g = geocoder.ip('87.248.214.183')
print(g.latlng)
print(g.city)
g = geocoder.ip('me')
print(g.latlng)
print(g.city)
