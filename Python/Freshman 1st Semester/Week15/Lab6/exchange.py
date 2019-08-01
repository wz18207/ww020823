#Lab 6: To read the line from the txt and get them in a dictionary.
import linecache

line = linecache.getline("xian_info.txt", 1)
line = line.strip("\n")
print(line)
a = [(str("country"),line)]
a = dict(a)

l = linecache.getline("xian_info.txt", 2)
l = l.strip("\n")
b = [(str("population"),int(l))]
b = dict(b)

i = linecache.getline("xian_info.txt",3)
i = i.strip("\n")
i = i.split(" ")
s = [(str("universities"),i)]
s = dict(s)

n = ()
n = linecache.getline("xian_info.txt",4)
n = n.strip("\n")

d = [(str("location"),n)]
d = dict(d)

e = linecache.getline("xian_info.txt",5)
e = e.strip("\n")
e = e.split(" ")
e = list(map(int, e))

x = [(str("temperature"),e)]
x = dict(x)

info = {}
info.update(a)
info.update(b)
info.update(s)
info.update(d)
info.update(x)
print("xian_info=%s" %(info))