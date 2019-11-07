
# affecter une varible
var="toto"

# utilser
echo $var
# fonctionne aussi (mieux)
echo "$var"
# ne fonctionne pas, afficher $var et pas "toto"
echo '$var'

# faire une boucle
for i in {1..100};do
	echo $i
done

for i in {a..z};do
	echo $i
done

# mettre un fichier dans une varrable
cat /etc/passwd | while read line;do
	echo $line
	echo $line | cut -d: -f1
done

# tester un fichier
if [ -f fichier ];then
	echo "file \"fichier\" exists " 
fi

# couper sur un charactere : afficher la colonne 2
cut -d: -f2
# avec awk
awk -F: '{print $2}'

# colonne negative avec awk
awk -F: '{print $(NF-2)}'

# faire un filtre
grep nobo /etc/passwd
cat /etc/passwd | grep nobody

# utilser des expression regulieres (regexp) avances avec grep

cat /etc/passwd | grep -P "n...(dy|DY)" 
# mettez la regexp dans debuggex pour la comprendre

# regepx pour des chiffres, 2 de suite
cat /etc/passwd | grep -P "[0-9][0-9]" 

# ranger (alphabetique)
sort
# les chiffres
sort -n

# la fin
tail -1
tail -10

# le debut
head -1
head -10


cat ~/a.log |rev | awk '{print $2}' | sort -n | tail -1

# uniq + comptage et rangement par chiffre en numerique
cat ~/a.log | awk '{print $7}' | sort | uniq -c  | sort -n



# afficher les processus
# Linux
ps aux
ps axf
# tous les OS
ps -elf
ps -edf

# en temps réel
top
htop

# memoire 
free

# espace disque
df -h
df -k

# redirection
# sortie STDOUT dans /tmp/ls.log
# sortie STDERR dans /tmp/ls_err.log
ls / 2> /tmp/ls_err2.log |tee /tmp/ls.log

# tout dans le meme fichier
ls / /tmp/ls_err2.log > /tmp/ls.log 2>&1

# la variable pour vérifier la sortie d'un programme
echo $?

# la variable qui indique les endroits ou le shell va chercher nos programmes a executer
echo $PATH
# la changer
export PATH="$PATH:~/mybin"

