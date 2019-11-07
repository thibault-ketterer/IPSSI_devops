# génère une clef rsa dans ~/.ssh/id_rsa
ssh-keygen
# [enter] [enter] [enter] [enter]

# on travaille dans le répertoire ~/gits
mkdir ~/gits
cd ~/gits

# clone du git
git clone git@github.com:thibault-ketterer/test.git
cd test

cat .git/config
git status
ls -l .git

git status
git diff
git commit README.md

# la config git est ici
# pour votre nom et votre email
cat  ~/.gitconfig

# edition du fichier
nano README.md
# commit du fichier
git commit README.md
git log

# envoi vers github
git push
git status

# ajouter un fichier
git add test.sh

git status
git commit -m 'ajout de test.sh'

# le log avant envoi, on voit que mon local est en avance
git log
git push

# le log apres envoi, on voit que mon local est au meme niveau que github (origin/master)
git log

git blame test.sh

# les conflits
# 2 shell
git clone git@github.com:thibault-ketterer/test.git test2
cd ~/gits/test2
echo "aaa" >> README.md
git commit README.md -m 'conflit dans README aaa'
git push

cd ~/gits/test
echo "bbb" >> README.md
# erreur ici, on a oublié de faire un git pull avant de faire le commit
git commit README.md -m 'conflit dans README bbb'

# ne fonctionne pas
git push

git pull
# indique le conflit

# on resout le conflit
vim README.md

# on ajoute le fichier + commit, on envoie
git add README.md
git commit -m 'fix conflict README.md'
git push


# les branches
git branch

# en 2 lignes
# cree la branche
git branch feature-test1

# va dans la branche
git checkout feature-test1

# en une seule ligne
# les deux en une ligne
git checkout -b feature-test1

echo "bbb" > test2
git add test2
git commit -m 'ajout de test2'


git push
# refuse et dit "je ne sais pas où est la branche [feature-test1] sur github"
git push --set-upstream origin feature-test1

# le prochain git push va fonctionner

# faire une pull request
# aller la faire sur github
# bouton "pull request"

# en local l'operation se fait avec
git checkout master
git merge feature-test1


