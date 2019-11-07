#!/usr/bin/python3


# fonction avec argument par defaut
def add3(a, b, c=0):
    ''' function calc an addition'''
    return(a + b + c)


print(add3(1, 2))
print(add3(10, 20))
print(add3(10, 20, 30))


somme = add3(20, 30)
print(somme)
