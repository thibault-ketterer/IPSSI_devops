#!/bin/bash
# le shebang est /bin/bash (pour executer un script bash)

set -e
# . /home/kit/gits/HMX/firewall/jobs/firewall/error_handling.inc.sh

echo "affichage des arguments"
echo "[$1]"
echo "[$2]"
echo "[$3]"

echo "test du site [$1]"

# site="www.google.com"
# site=$1
# -z est dans man test
if [ -z $1 ];then
	echo "donnez un nom de site"
	exit 1
else
	# set +e
	# curl -s -I $1 >/dev/null
	# echo $?
	# if [ $? == 0 ];then
	if curl -s -I $1 >/dev/null ;then
		echo "test ok"
	else
		echo "test FAIL"
		exit 2
	fi
	# set -e
	# curl -I $site
fi

exit 0


# vim
# passer en mode insertion: i
# <ECHAP> :q! quitter sans sauver
# <ECHAP> :wq quitter en sauvant

# couleur :syn on
# $ echo 'syn on' > ~/.vimrc

# mettre le script en executable chmod +x arg.sh
# unrepertoire DOIT avoir des droits d'execution
# changer les droits pour les autres chmod o-x (par exemple supprimer les droits d'execution)

# ./arg.sh > /dev/null && echo "test ok" || echo "test FAIL"
# if ./arg.sh > /dev/null;then echo "test ok"; else echo "test FAIL";fi 


