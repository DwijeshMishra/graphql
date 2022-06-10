FILENAME="java-repos.txt"

while read -r repo
do
    git clone https://github.com/DwijeshMishra/$repo
    cd $repo
    git checkout -b feature
    cd ..
    cp project-specific.yaml $repo/  && cp .repo-config  $repo/
    cd $repo
    git add . 
    git config --global user.name "DwijeshMishra"
    git config --global user.email "dwijeshm3@gmail.com"
    git commit --amend --reset-author
    git commit --amend --author='DwijeshMishra <dwijeshm3@gmail.com>'
    git commit -am"update workflow"
    git push https://github.com/DwijeshMishra/$repo
done < java-repos.txt
