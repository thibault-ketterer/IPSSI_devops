#!/usr/bin/python3

from datetime import datetime

import sys
print(sys.argv)

from sys import argv
print(argv)

d = datetime.now()
print(d)
print(d.day)
print(d.minute)
print(d.month)

print("type de day", type(d.day))

# if d.day % 2 == 0:
if d.day % 2:
    print("le jour est impair")
else:
    print("le jour est pair")

# pas le droit de concatener un int sur une string
# print("je numero du jour est " + d.day)
print("je numero du jour est ", d.day, " fin")
print("je numero du jour est " + str(d.day) + " fin")
print("je numero du jour est {} fin".format(d.day))
print("je numero du jour est {} fin {} ".format(d.day, "test"))
print("je numero du jour est {jour} fin {jour} ".format(jour=d.day))
var1 = "salut"
print("je numero du jour est {jour} fin {deux} ".format(jour=d.day, deux=var1))
