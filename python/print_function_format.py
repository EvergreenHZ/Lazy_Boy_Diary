name = 'huaizhi'
score = '100'
print('Total score for %s is %s' %(name, score))
print("Total score for %(n)s is %(s)s" % {'n': name, 's': score})
print("Total score for {0} is {1}".format(name, score))
print("Total score for {n} is {s}".format(n=name, s=score))
print("Total score for", name, "is", score)
print("Total score for ", name, " is ", score, sep='')
from __future__ import print_function
print(f'Total score for {name} is {score}')

# loop step 2
for i in range(0, 10, 2):
    #do somethin here
