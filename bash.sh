FILENAME="java-repos.txt"

while read -r repo
do
    git clone https://github.com/DwijeshMishra/$repo
    cd $repo
    git checkout -b feature
    cd ..
    cp project-specific.yaml $repo/  && cp .repo-config  $repo/
    cd $repo
    git config --global user.name "github runner"
    git config --global user.email "github@gmail.com"
    git add . 
    git commit -am"update workflow"
    git push
done < java-repos.txt
