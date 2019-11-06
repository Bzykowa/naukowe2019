#Karolina Bąk
#Lista 2 zadanie 2 wizualizacja
import pylab
import numpy

x = numpy.linspace(-20,50,10000) # 10000 linearly spaced numbers
y = (numpy.e**x)*numpy.log(1 + numpy.e**(-x)) # function to visualize

pylab.plot(x,y)
pylab.show()
