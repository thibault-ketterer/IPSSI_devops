#!/usr/bin/python3

from calcul import addition
a = 1
b = 3
print(addition(a, b))
# les 2 fonctionnent
print(addition(1, 3))
# PEP8 ok
if addition(1, 3) == 4:
    print("20/20")
else:
    print("0/20")

# PEP8 FAIL
if addition(1, 3) == 4:
    print("20")


from calcul import soustraction
print(soustraction(4, 1))

# pas vraiment une bonne pratique
from calcul import *

import calcul
calcul.soustraction(5, 7)
calcul.addition(5, 7)
