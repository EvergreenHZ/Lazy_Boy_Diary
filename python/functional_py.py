#def outer_func(n):
#    def inner_func():
#        return n * 10
#
#    return 10 * inner_func()
#
#print(outer_func(10))

#print((lambda x, y:x + y)(1, 9))

fact = lambda n :  1 if n == 1 else  n * fact(n - 1)

print(fact(10))
