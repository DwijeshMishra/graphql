FILENAME="java-repos.txt"

while read -r repo
do
    git clone https://github.com/DwijeshMishra/$repo
    cd $repo
    git checkout -b feature
    cd ..
    cp project-specific.yaml $repo/  && cp .repo-config  $repo/
    cd $repo
    git config --global user.name "dwijeshMishra"
    git config --global user.email "dwijeshm3@gamil.com"
    git add . 
    git commit -am"update workflow"
    git push --set-upstream origin feature
done < java-repos.txt
