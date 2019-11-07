#!/bin/bash


function compare2
{
	# echo $expected $rendu
	if [ "$expected" == "$rendu" ];then
		echo "OK"
	else
		echo "FAIL execpt[$expected] GOT [$rendu]"
	fi
}


function compare
{
	rendu=$(echo "" | bash $dir_rendu/$script_name)
	# echo $expected $rendu
	if [ "$expected" == "$rendu" ];then
		echo "OK"
	else
		echo "FAIL execpt[$expected] GOT [$rendu]"
	fi
}

function test_ex
{
	dir_rendu="$1/rendu/$2"
	case $2 in
		"ex01")
			script_name="heure1.sh"
			expected=$(date)
			compare
			;;
		"ex02")
			script_name="heure2.sh"
			expected=$(date +%s)
			compare
			;;
		"ex03")
			script_name="cd.sh"
			expected=""
			rendu=""

			;;
		"ex04")
			script_name="verification.sh"
			cd /tmp
			touch efface_moi
			# echo ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name
			bash ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name >/dev/null
			if [ ! -f /tmp/efface_moi ];then
				echo "OK"
			else
				echo "FAIL"
			fi
			rm -f /tmp/efface_moi
			cd -  >/dev/null
			;;
		"ex05")
			script_name="test_curl.sh"
			rendu=$(bash ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name localhost)
			expected="OK"
			compare2
			;;
		"ex06")
			script_name="historique.sh"
			grep history ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name && grep tail ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name && echo OK || echo FAIL
			;;
		"ex07")
			script_name="add.sh"
			expected="54"
			rendu=$(echo "" | bash ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name 50 4)
			compare2
			;;
		"ex08")
			script_name="sum200.sh"
			expected="19900"
			rendu=$(for i in {0..199};do echo $i;done | bash ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name)
			compare2
			;;
		"ex09")
			script_name="mean200.sh"
			expected="99"
			if [ ! -f ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name ];then
				echo "FAIL NOT FOUND ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name]"
			else
				rendu=$(for i in {0..199};do echo $i;done | bash ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name)
				compare2
			fi
			;;
		"ex10")
			script_name="mean_sum200.sh"
			expected="99
19900"
			if [ ! -f ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name ];then
				echo "FAIL NOT FOUND ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name]"
			else
				rendu=$(for i in {0..199};do echo $i;done | bash ~/l/python/flask/file_upload/uploads/$dir_rendu/$script_name)
				compare2
			fi
			;;
	esac
}

function uncompress
{
	# --------- decompress
	mkdir -p $student
	cd $student
	tar xf ../$comp
	cd ->/dev/null
}

# tout decompresser dans un rep par nom
for comp in *.tar.gz;do
	# echo $comp
	# echo $comp | cut -d'.' -f1
	student=$(echo $comp | cut -d'.' -f1)
	# echo "uncompress [$student]"
	uncompress
done

#exit 0
# ----------------------

ex="ex$1"
if [ -z $1 ];then
	ex="ex01"
fi

#name='thibault_k_kit_2019-11-05.tar.gz'

# check
# echo "checks"
# for dd in *2019-11-05;do 
# 	echo $dd
# 	dir_rendu="$dd/rendu/$ex"
# 	echo "test [$dir_rendu]"
# 	if [ ! -d "$dir_rendu" ];then
# 		echo "no $ex for $dd"
# 	else
# 		echo "ok $ex FOUND for [$dd]"
# 	fi
# 
# done

for dd in *2019-11-05;do 
	echo -n  "$dd "
	dir_rendu="$dd/rendu/$ex"
	# echo "test [$dir_rendu]"
	if [ -d "$dir_rendu" ];then
		test_ex $dd $ex
	else
		echo "NOT FOUND DIR $dir_rendu"
	fi

done
