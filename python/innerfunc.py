#def hello():
#
#    def farewell():
#        print("Farewell\n")
#
#    return farewell
#
#func = hello()
#
#func()
#def make_multiplier_of(n):
#    def multiplier(x):
#        return x * n
#    return multiplier
#
## Multiplier of 3
#times3 = make_multiplier_of(3)
#
## Multiplier of 5
#times5 = make_multiplier_of(5)
#
#print(times5)

def hello():
    x = 0
    def addn():
        x = x + 1
        return x;
    return addn;

addn = hello()

print(addn())

def better_outer():
    count = [0]
    def inner():
        count[0] += 1
        return count[0]
    return inner

print(better_outer()())
