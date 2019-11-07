#!/bin/bash

# script de telechargement de manga et copie locale
# defauts: 
# * il va potentiellement tout retelechager a chaque fois, il fautdrait ajouter if [ -d "$chapter" ]
# avant le cd
# * il ne gere pas les erreurs, chapitre introuvable, page qui ne fonctionne pas
# * il essaie toutes les images en bruteforce de 1 a 16 meme si elles n'existent pas (ou qu'il y en a plus)
# -> ne pas mettre de set -e pour le laisser permissif, il telechargera "au mieux"
# il faut doncle lancer et cela va tourner pendant quelques heures j'imagine sin on augment la boucle de 500 a 1280 par exemple
# NB: il n'y a pas les premiers chaptires 1 .. 100 sur hni scantrad

for chapter in {1260..1280};do
	echo $chapter
	mkdir -p $chapter
	# bad practice, normalement on ne fait pas un cd dans un script
	cd $chapter
	# on rentre dans le repertoire "chapter"

		# for avec printf
		# for i in {1..9};do 
		# 	wget "http://hni-scantrad.com/eng/lel/content/Hajime%20no%20Ippo/Chapter%20${chapter}/00$i.png"
		# done
		# for i in {10..13};do 
		# 	wget "http://hni-scantrad.com/eng/lel/content/Hajime%20no%20Ippo/Chapter%20${chapter}/0$i.png"
		# done
		for i in {1..16};do 
		    # printf "%03d" 1 -> 001
			i=$(printf "%03d" $i)
			wget -c "http://hni-scantrad.com/eng/lel/content/Hajime%20no%20Ippo/Chapter%20${chapter}/$i.png"
		done
	# on retourne dans le repertoire du script
	cd -

done


