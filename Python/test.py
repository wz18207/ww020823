import matplotlib.pyplot as plt
import numpy as np
import math
import random
def k():
	x=np.linspace(0,14,10000)
	x1=np.linspace(0,5,10000)#AC
	y1=11000*x1
	x2=np.linspace(0,4,10000)#EV
	y2=8500*x2
	x3=np.linspace(0,12,10000)#PV
	#for t in random parts.
	#t = [x+random.randrange(-1,1)/100 for x in x3.tolist()]
	#t = np.array(t)
	y3=10000*x3
	BAC=120000
	plt.figure()
	plt.plot(x1,y1,label=u"actual cost(AC)",color='r',linewidth=2,linestyle=':')
	plt.plot(x2,y2,label=u"earned value(EV)",color='g',linewidth=2,linestyle='--')
	plt.plot(x3,y3,label=u"planned value(PV)",color='black',linewidth=2,linestyle='-')
	plt.scatter(12,BAC,color='black',linewidth=1,label=u'budget at completion(BAC)')
	plt.scatter(13.8,150000,color='r',linewidth=1,label=u'estimate at completion(EAC)')
	plt.xlabel('months')
	plt.ylabel('dollars')
	plt.legend()
	plt.show()
if __name__=="__main__":
	k()
#CV=EV-AC=-5000
#SV=EV/PV=-3000
#CPI=EV/AC=0.8
#SPI=EV/PV=0.8696
#EAC=BAC/CPI=150000
#T=13.8
#PV=23000
#EV=20000
#AC=25000
#BAC=120000