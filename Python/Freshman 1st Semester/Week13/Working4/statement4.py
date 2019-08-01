population = { 'Beijing' : 18590000, \
'Shanghai' : 24150000, 'Suzhou' : 10658000, 'Xi\'an' : 8705600 }
for city, pop in population.items():
    if pop < 12000000:
        print(city)
        break
 
