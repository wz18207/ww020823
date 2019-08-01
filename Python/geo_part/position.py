import geocoder
#反向编译
#可以换成arcgis的服务试试
g = geocoder.arcgis([34.7725, 113.727], method='reverse')
print(g)
print(g.address)
print(g.city)
print(g.state)
print(g.country)