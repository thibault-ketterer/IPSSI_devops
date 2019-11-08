# 2019-11-08
sujet final

# procedure de rendu
vous devez rendre une url de git

* pour cela aller sur mon ip soit 192.168.22.13/
* choisissez votre nom
* mettez votre url de git et faies "send"
* ma machine verifie que l'url de github existe et l'enregistre

* une fois cela fait vous pourrez _push_ votre code vers votre github (il sera ramassé automatiquement)

* tous les exercices sont a rendre dans un répertoire à la racine de votre github

* le répertoire attendu à la racine de votre github est "exam2"

* un clone sera fait par ma machine en fin de journée a 16h30, si vous voulez 20/20 il faudra que tout soit parfait a ce moment là
* un autre clone sera fait lundi 11 novembre a minuit, vous pouvez faire les modifications que vous souhaitez entre les deux afin d'augmenter votre note si besoin

* copier vos fichiers de windows -> vers WSL
```
cp /mnt/c/Users/<monom>/... ~/ipssi_2019/exam2/...
```
* copier vos fichier de WSL -> vers windows
```
cp ~/ipssi_2019/exam2/ex13/Dockerfile /mnt/c/Users/monom/docker_ex13/.
```
* dans le shell docker
```
mkdir docker_ex13
cd docker_ex13
```
on doit voir le fichier Dockerfile

# rappel
* un script doit contenir un shebang
* un script doit avoir des droits d'execution
* un script qui fonctionne doit renvoyer 0 comme exit code et autre chose s'il plante
* un script ne doit pas faire de `read` en posant des questions sauf si indiqué dans le sujet (ou les exemples)

# ex01
Creer un script `exam2/ex01/ls.sh`

qui execute un ls avec l'argument passé en ligne de commande
* le script doit afficher la sortie standard vers un fichier /tmp/ls.log
* le script doit afficher la sortie d'erreur vers un fichier /tmp/ls_err.log
* le script doit afficher si le ls a fonctionné (c'est-a-dire l'exit code)
* la redirection doit être cumulative, c'est-a-dire que le fichier /tmp/ls.log n'est pas supprimé à chaque lancement

exemples
```
$ ls.sh /etc/passwd
ls ok
$ cat /tmp/ls.log
-rw-r--r-- 1 root root 2728 Nov  5 09:45 /etc/passwd
$ cat /tmp/ls_err.log

$ ls.sh /etc/passwdsdfds
ls FAIL

$ cat /tmp/ls.log
-rw-r--r-- 1 root root 2728 Nov  5 09:45 /etc/passwd
$ cat /tmp/ls_err.log
ls: cannot access '/etc/passwdsdfds': No such file or directory
```

# ex02
Faites un script `exam2/ex02/ids.sh` pour extraire la colone des `ids` dans /etc/passwd

utilisez
* cut
* cat

exemple (le resultat dépend aussi du contenu de /etc/passwd)

```
./ids.sh | sort -n | tail -4
1000
64055
65534
```

# ex03
Faites un module python dans `exam2/ex03/calcul.py` qui contient 2 fonctions

* une fonction division qui divise les 2 arguments de la fonction
* une fonction multiplication qui multiplie les 2 arguments de la fonction
* la fonction division devra vérifier que le diviseur n'est pas zéro et afficher le message 
  "sorry cannot divide by zero" dans ce cas et retourner 0

exemple de test
```
~/exam2/ex03 $ python3
>>> from calcul import division
>>> division(8, 2)
4.0
>>> division(8, 0)
sorry cannot divide by zero
0

```

ATTENTION si vous modifiez votre code vous devez réimporter le module à chaque fois
```
~/exam2/ex03 $ python3
>>> from calcul import division
>>> division(8, 2)
8
>>> from calcul import division
>>> division(8, 2)
4.0
```

le plus simple est de faire un scipt de test comme suit

test.py
```
#!/usr/bin/python
from calcul import division
print(division(8, 2))
```

et le lancer
```
$ python3 test.py
4.0
```
pour vérifier

Pour vous aider, vous pouvez utiliser ce script test_calcul.py que vous mettrez dans `exam2/ex03`
```
#kit@bladrom ~/exam2/ex03 _$ python test_calcul.py
4.0
sorry cannot divide by zero
0
0
40
```


# ex04
Faites un module python dans `exam2/ex04/logs.py` qui contient 1 fonction `logthis`

la fonction `logthis` devra écrire un fichier python.log contenant le message donné en argument précédée de la date
* le log doit être cumulatif
* utilisez open
* utilisez `write` pour écrire
* utilisez `datetime`
* utilisez `strftime` pour formater la date comme voulu dans l'exemple
* utilisez google pour le reste

exemple
```
~/exam2/ex03 $ python3
>>> from logs import logthis
>>> logthis("test")
>>> logthis("bonjour")
~/exam2/ex04 $ cat python.log
cat python.log
2019-11-08 02:39:14 test
2019-11-08 02:39:19 salut

```

# ex05
Faites un script python `exam02/ex05/read_comp.py` qui lit un fichier docker-compose.yml dans le répertoire courant

et affiche la liste des images dockers utilisées par ce docker-compose chacune sur une ligne, sans espaces ni saut de ligne superflus (on accepte que la ligne contienne des "/" et la version du tag docker)
* utiliser open
* indice regarder la doc de la fonction string `strip()`
* regarder les scripts de parsing de logs apache
* faite par étapes

# ex06
Faites un script python `exam2/ex06/count_lines.py` qui compte le nombre de ligne dans un fichier donné en argument

exemple
```
$ printf "1\n2\nbb\n" > file.txt
$ ./count_lines.py file.txt
3
```

# ex07
Faites un script `exam2/ex07/test_internet.sh`

qui teste si www.google.com fonctionne

si c'est le cas le script écrit dans un log `internet.log` la date comme dans l'exemple
* NB pour pouvoir l'écrire sur une ligne vous devez utilser `$(commande)` et une affectation de variable
* par exemple `temp=$(uptime)`

exemple (où on active le wifi entre la 2e et le 3e lancement.
```
$ ./test_internet.sh
$ ./test_internet.sh
$ ./test_internet.sh
$ cat internet.log
2019-11-08:08:27:47 internet FAIL
2019-11-08:08:27:57 internet FAIL
2019-11-08:08:28:30 internet ok

```

# ex08
Faites un script `exam2/ex08/commit.sh`

qui enchaine les commandes git suivantes
* affichage du statut
* ajout de tous les fichiers du répertoire courant pour être commité
* commit de ces fichiers avec la description donné en argument du script
* push des modifications

exemple
```
kit@bladrom ~/exam2/ex08 _$ ./commit.sh "add exercics 02 to 06"
On branch master
Untracked files:
  (use "git add <file>..." to include in what will be committed)

	../ex02/
	../ex03/
	../ex04/
	../ex05/
	../ex06/
	./

nothing added to commit but untracked files present (use "git add" to track)
[master e63bfa1] add exercics 02 to 06
 1 file changed, 6 insertions(+)
 create mode 100755 ex08/commit.sh

[master 682b163] add exercics 02 to 08
 7 files changed, 56 insertions(+)
 create mode 100644 ex02/ids.sh
 create mode 100644 ex03/calcul.py
 create mode 100644 ex04/logs.py
 create mode 100644 ex04/python.log
 create mode 100644 ex05/docker-compose.yml
 create mode 100644 ex05/read_comp.py
 create mode 100644 ex06/count_lines.py
Enumerating objects: 15, done.
Counting objects: 100% (15/15), done.
Delta compression using up to 8 threads
Compressing objects: 100% (10/10), done.
Writing objects: 100% (14/14), 1.42 KiB | 727.00 KiB/s, done.
Total 14 (delta 0), reused 0 (delta 0)
To /tmp/somegit
   e63bfa1..682b163  master -> master

```

# ex09
Creer un fichier README.md à la racine de `exam2` qui contiendra la description de ce que l'on trouve dans le répertoire exam2.

il doit contenir un titre et une liste et du code
exemple:
## description
voici mes fichiers d'examen du 2019-11-08
* ex01 du script shell
* ex02 idem
* ex11 je n'ai pas réussi
exemple de code
```
ls -l
```

Le dossier `exam2/ex09` sera donc vide ou inexistant.

# ex10
lire un fichier json

faire un script `exam02/ex10/read_json.py`
qui lit ce fichier json
[students.json]
et l'affiche comme suit
```
read_json.py
{'students': ['Amoyal_simon', 'Bombardieri_billy', 'Bouchakour_younes', 'elie_TOURE', 'Guillaume_Andronic', 'Jollet_Alexander', 'kelig_kelig', 'Lacheheb_thomas', 'Lau_Vincent', 'lenny_louis2', 'LE_VAN_julien', 'LOULI_aniss', 'mehdi_mebarki', 'Sardarian_djemal', 'steve_steve', 'vincent_leclerc']}
```


* aide `import json`
* google

# ex11
Ici vous faites du Docker, donc sous windows vous devrez tester dans votre shell docker, mais bien penser a mettre vos exercices sous git dans le Linux

creer un fichier `exam02/ex11/Dockerfile` qui contiendra ce Dockerfile auquel vous aurez ajouté une création de répertoire "/ipssi"
* [Dockerfile] 
* aller dans la doc de docker ou sur google pour trouver comment on crée un répertoire dans un Dockerfile 
	* vous pouvez vérifier en faisant un build
	`docker build -t ipssi/ex11:1 .`
	* un docker run /bin/sh
	`docker run -i -t ipssi/ex11:1 /bin/sh`
	* verifier que le répertoire est présent avec ls


# ex12
creer `exam2/ex12/docker-compose.yml`

en vous basant sur un docker-compose.yml de votre choix

construisez un docker-compose.yml avec un wordpress version `5-php7.1-alpine` et la version 5.7 de mysql

Le wordpress doit fonctionner sur le port 7777

Si problème d'internet faites juste le fichier intelligement sans tester, et la vérification ne testera pas votre docker-compose

# ex13
## md5
vous allez découvrir ce qu'est un md5.

il s'agit d'une somme de hashage, les plus connues sont sha1 sha256, sha512 et md5. cf https://en.wikipedia.org/wiki/MD5

On peut faire une somme de hashage d'un texte, d'un password, ou même d'un fichier, ce qui est souvent le cas sur internet comme ici par exemple sur un site de téléchargment d'iso de Linux.

Cela sert à valider qu'un fichier est le même.

La règle, 2 fichiers ou 2 textes identiques ont la même somme de hashage md5.

faite un script `exam2/ex13/calcmd5.sh` qui afiche le md5 d'un paramètre donné en argument
exemple
```
$ ./calcmd5.sh toto
11a3e229084349bc25d97e29393ced1d
```
* man md5sum
* attention a n'afficher que le md5 et pas de tiret

# ex14
Docker suite, DANS UN SHELL DOCKER

reprenez votre Dockerfile de l'exercice 11 et faire un script `exam2/ex14/lance_docker.sh`

ajouter un volume dans le Dockerfile de facon à ce que le répertoire `/out` à l'intérieur du docker pointe sur le répertoire extérieur suivant `/tmp` dans votre machine

* voir cet article https://rominirani.com/docker-tutorial-series-part-7-data-volumes-93073a1b5b72
* ou chercher sur internet `docker mount volume` sur google
* il y a juste une option a rajouter au `docker run` pour que cela fonctionne

exemple DANS UN SHELL DOCKER

```
mkdir out
$ ./lance_docker.sh
/ # echo toto > out/sort_de_docker.txt
/ # exit
$ cat /tmp/sort_de_docker.txt
toto
```

# ex15
avec ce que vous avez appris sur le hashage

faire un module python `login` qui  comporte une fonction `compare_pass`, qui valide que vous avez entré le bon password "ipssi"

Si le password donné en argument à la fonction est bien ipssi, la fonction retourne `True`, sinon elle retourne `False`

Vous pouvez utiliser le fichier `test_login.py` pour tester votre module comme suit

* chercher `calcul md5 python3` sur google (module hashlib)

```
kit@bladrom ~/exam2/ex15 _$ python test_login.py ipssitata
md5 "ipssi":  82771f9740d5e024ab823c12a9b51289
md5   pass :  b0c328aca0e86272bd9d1fe7e92be7e3
login failed
#kit@bladrom ~/exam2/ex15 _$ python test_login.py ipssi
md5 "ipssi":  82771f9740d5e024ab823c12a9b51289
md5   pass :  82771f9740d5e024ab823c12a9b51289
login ok
```

Si vous avez tout fini, Bravo.
