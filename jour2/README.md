

# un peu de doc
https://www.google.com/search?q=commandes+de+bases+linux&oq=commandes+de+&aqs=chrome.1.69i57j69i59j0l3j69i60.4859j0j7&sourceid=chrome&ie=UTF-8

* STDOUT / STDERR
https://www.howtogeek.com/435903/what-are-stdin-stdout-and-stderr-on-linux/


# sujet
## procedure de rendu
Vous devez creer une archive tar.gz des fichiers et l'uploader sur ce site

envoyer vos fichiers sur mon ip via cette page web http://<monip>

## arborescence
vos fichiers doivent être organisé comme suit
```
rendu/ex01
rendu/ex02
rendu/ex03
```

A priori vous allez utilser 
* `mkdir -p rendu/ex01`
* `mkdir -p rendu/ex02`
* ...

vous pouez vérifier l'arborescence en faisant `find`

## ex01 heure1.sh
faire un script `ex01/heure1.sh`
qui affiche l'heure
exemple
```
$ ./heure1.sh
Wed 30 Oct 2019 03:37:58 PM CET (si systeme en anglais)
mercredi 30 octobre 2019, 15:38:21 (UTC+0100) (si systeme en fr)
```

## ex02 heure2.sh
faire un script `ex02/heure2.sh`
qui affiche l'heure avec le nombre de secondes depuis le 01-01-1970
exemple
```
$ ./heure2.sh
1572446239
```

## ex03 cd.sh
faire un script `ex03/cd.sh`
qui 
* crée un répertoire,
* va dedans
* affiche le contenu (ls -la)
vous devez avoir
```
total 0
drwxr-xr-x 1 kit kit    0 Nov  5 12:23 .
drwxr-xr-x 1 kit kit 4700 Nov  5 12:23 ..
```

## ex04 verification.sh
faire un script `ex04/verification.sh`
qui regarde si un fichier "efface_moi" existe
si le fichier existe il l'efface, sinon il affiche "nothing to do"

 indice dans votre `~/.profile` (oui ici pour les utilisateurs de mac https://gist.github.com/edwinksl/dafc0594176df6058bb395e985833189)

indice `man test`

## ex05 test_curl.sh
faire un script `ex05/test_curl.sh`
qui test si un site fonctionne et affiche "OK" si c'est le cas "FAIL" si ce n'est pas le cas

exemple de sortie

```
$ ./ex05/test_curl.sh www.google.com
OK
$ echo $?
0

```


indice, utilisez curl

## ex06 historique.sh
faire un script `ex06/historique.sh`
qui affiche l'historique mais uniquement les 15 dernières lignes

le script sera testé en faisant

```
    . ./historique.sh
```

## ex07 add.sh
faire un script `ex07/add.sh`
faire un script qui prend en argument deux chiffres et affiche leur somme
exmple
```
$ ./add.sh 3 2
5
```
indice utilisez `$(())` pour les calculs

## ex08 sum200
faire un script `ex08/sum200.sh`
faire un script qui lit 200 chiffres  en entrée et affiche leur somme
exemple
```
$ for i in {0..200};do echo $i;done | ./sum200.sh
20100
```

indice utilisez 
```
a=1
b=2
$((a+b))
```
pour les calculs

## ex09 mean200
faire un script `ex09/mean200.sh`
* faire un script qui prend en argument 200 chiffres ou plus et affiche leur moyenne
exmple
```
for i in {0..200};do echo $i;done | ./mean200.sh
100
```

utilisez STDIN (cf article au début) et `while read`


## ex10 mean sum 200
faire un script `ex10/mean_sum200.sh`
* faire un script qui prend en argument 200 chiffres ou plus et affiche leur somme et leur moyenne
exmple
```
for i in {0..200};do echo $i;done | ./mean_sum200.sh
100
20100
```



# faire son rendu
vous devez avoir si vous avez tout fait dans votre répertoire ~/rendu

```
~/rendu _ ls -l
total 0
drwxr-xr-x 1 kit kit 0 Oct 11 11:25 ex01
drwxr-xr-x 1 kit kit 0 Oct 11 11:25 ex02
drwxr-xr-x 1 kit kit 0 Oct 11 11:25 ex03
drwxr-xr-x 1 kit kit 0 Oct 11 11:25 ex04
drwxr-xr-x 1 kit kit 0 Oct 11 11:25 ex05
```
vous faite donc votre rendu comme ceci en remplacant <monnom> et <date>
```
cd ~
tar zcvf <monnom>_<date>.tar.gz rendu
cp <monnom>_<date>.tar.gz /mnt/c/Users/monuserwindows/Desktop/.
```

pour un mac
```
cd ~
cp <monnom>_<date>.tar.gz ~/Desktop/.
```

exemple pour moi
```
cd ~
tar zcvf ketterer_2019-11-05.tar.gz rendu
rendu/
rendu/ex01/
rendu/ex01/heure1.sh
rendu/ex02/
rendu/ex02/heure2.sh
rendu/ex03/
rendu/ex03/cd.sh
rendu/ex04/
rendu/ex04/verification.sh
rendu/ex05/
rendu/ex05/test_curl.sh
rendu/ex06/
rendu/ex06/historique.sh
rendu/ex07/
rendu/ex07/add.sh
rendu/ex08/
rendu/ex08/sum200.sh
rendu/ex09/
rendu/ex09/mean200.sh
rendu/ex10/
rendu/ex10/mean_sum200.sh

cp ketterer_2019-11-05.tar.gz /mnt/c/Users/Desktop/.
```

vérifier le tar avant de l'envoyer
```
tar tf ketterer_2019-11-05.tar.gz
```

ensuite envoyer le ficier vers mon ip


Vous pouvez vérifier votre upload 7-zip sous windows qui sait ouvrir les .tar.gz
