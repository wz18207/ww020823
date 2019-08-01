brand = 'Xiaomi'
type = 'Air 13'
cost = 4980  # Yuan
exchange_rate = 8.69115  # Yuan to Pound
print('brand =\'Xiaomi\'')
print('type =\'Air 13\'')
print('cost = 4980 ')  # Yuan
print('exchange_rate = 8.69115')  # Yuan to Pound
print('message =\'The price of this %s laptop is %d yuan and the exchange \
rate is %4.2f yuan to 1 pound\'' % (brand, cost, exchange_rate))
print('message =\'The price of this {0:s} laptop is {1:d} yuan and the \
exchange rate is {2:4.2f} yuan to 1 pound\''.format(brand, cost, exchange_rate))
