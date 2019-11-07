#!/bin/bash

acc=0
cat a.log | awk '{print $(NF-2)}' | sed -e 's/^0\.//' | fgrep -v '.' |grep -v ^0 | while read n;do
acc=$((acc+n))
echo $acc
done


# affectation variable
variable=truc

# qui ne FONTIONNE PAS affectation variable
variable =truc

# utilisation de variable
$variable
${variable}

#attention au noms, c'est mieux avec des {}
$variable_truc
${variable}_truc

echo "${variable}_truc"

# NON dangereux
cd /toto
rm *

# OUI
cd /toto && rm *

# encore mieux
rm /toto/*

# EXIT CODE, vérification
verifier la variable
$? == 0

# dire au script de s'arreter à la première erreur
set -eEu


