FILENAME="java-repos.txt"

while read -r repo
do
    git clone https://DwijeshMishra:$GITHUB_TOKEN@github.com/DwijeshMishra/$repo.git
    cd $repo
    git remote set-url origin https://DwijeshMishra:$GITHUB_TOKEN@github.com/DwijeshMishra/$repo.git
    git checkout -b feature
    cd ..
    cp project-specific.yaml $repo/  && cp .repo-config  $repo/
    cd $repo
    git add . 
    git config --global user.name "DwijeshMishra"
    git config --global user.email "dwijeshm3@gmail.com"
    git commit -am"update workflow"
    git push -u origin feature
    cat .git/config
done < java-repos.txt 

