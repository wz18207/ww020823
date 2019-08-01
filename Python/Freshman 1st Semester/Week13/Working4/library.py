from operator import itemgetter
test_dict = dict(z=1, v=5, g=8, a=12)

sorted(test_dict.items(), key=itemgetter(0))

sorted(test_dict.items(), key=itemgetter(1))

import statistics
data = [ 1, 2, 2, 3, 4, 4, 4, 4, 4, 5 ]
print('Mean:', statistics.mean(data))
print('Harmonic Mean:', statistics.harmonic_mean(data))
print('Median:', statistics.median(data))
print('Mode:', statistics.mode(data))

data = [ 1, 2, 2, 3, 4, 4 ]
print('Median:', statistics.median(data)) 
