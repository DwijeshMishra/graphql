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
    git commit --amend --reset-author
    git commit -am"update workflow"
    git push --set-upstream origin feature
done < java-repos.txt
