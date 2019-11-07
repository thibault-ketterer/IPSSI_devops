#!/usr/bin/python3

# print("hello world")

# mettez bien des espaces et pas des[tab]
a = 1
if a == 0:
    print("toto")
else:
    print("a ne vaut pas 0")

print("fin")

# en C
# if (a == 0){
#     printf("toto\n");
# }

# un entier
toto = 1
# un float
fl = 1.5
# string
string = "chaine1"
string = 'chaine1'
string = """chaine1"""
string = '''chaine1'''

string = " il va dire \"coucou\" assf "
string = """ il va dire "coucou" assf """

# les commentaires
"""
les commentaires multilignes
sont avec des " " "
"""

# 2 ecritures equivalentes
stringadd = "aa" + "bb"
stringadd = "aa" "bb"
# print(stringadd)

string = """coucou
salut
hello"""

if a == 0:
    string = ("coucou\n"
              "salut\n"
              "hello")

# nomenclature  "google style guide" PEP8

alphabet = "abcdefghijklmnopqrstuvwxyz"

# if 'a' in alphabet:
#     print("j'ai trouvé a")

# tableau / list / array
alist = list()
alist = []
alist = ["a", "b"]

# une liste de strings
alist = ["0", "1", "2", "3", "4"]

# une liste de int
alist = [0, 1, 2, 3, 4]
print(alist)
for x in alist:
    print(x)


alist = range(15000)
print(alist)
for x in alist:
    print(x)

for char in alphabet:
    print(char, end="\n")
    # print(char)
    #
for st in alist:
    print(st)

print("le 3e elem")
print(alist[3])

alist = []
print(alist)
# ajoute un element a la fin
alist.append("hello")
print(alist)
alist.append("hello")
print(alist)
alist.append("hello")
print(alist)
# supprime le dernier element ajouté
alist.pop()
print(alist)
blist = ["salut", "salut"]
print(alist + blist)

adict = dict()
adict = {}
adict = {"fr": "salut",
         "en": "hello"}
print(adict)

print(adict["fr"])

lang = "fr"
# print(adict[lang])
#

trad = {"fr": "salut",
        "en": "hello"}
# print(trad[lang])

for key in trad:
    print(key)
    print(trad[key])

trad_fr = {"bjour": "salut",
           "aie": "j'ai mal"}

trad_en = {"bjour": "hello",
           "aie": "it hurts"}

# un dctionnaire dans un dictionnaire
trad = {"fr": trad_fr,
        "en": trad_en}

lang = "fr"
print(trad[lang]['aie'])
lang = "en"
print(trad[lang]['aie'])

alist = [trad_fr, trad_en]
print(alist)
alist = [trad_fr, trad_en, 1, "string"]
print(alist)

alist = ["0", "1", "2", "3", "4"]
# list comprehension
list_comp = [x for x in alist]
# juste copier la liste
list_comp = alist
print(list_comp)

list_comp = [x + "aa" for x in alist]
print(list_comp)

list_comp = []
for x in alist:
    list_comp.append(x + "aa")
print(list_comp)

# recupperer ma liste de langue a partir du dictionnaire
trad = {"fr": "salut",
        "en": "hello",
        "es": "ola"}
alist = [key for key in trad]
print("je gere les langues:", alist)


def add(a, b):
    ''' function calc an addition'''
    return(a + b)


print(add(1, 2))
print(add(10, 20))


# fonction avec argument par defaut
def add3(a, b, c=0):
    ''' function calc an addition'''
    return(a + b + c)


print(add3(1, 2))
print(add3(10, 20))
print(add3(10, 20, 30))
