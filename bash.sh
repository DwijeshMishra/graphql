FILENAME="java-repos.txt"

while read -r repo
do
    git clone https://github.com/DwijeshMishra/$repo
    cd $repo
    git checkout -b feature/${GITHUB_SHA}
    cd ..
    cp project-specific.yaml $repo/  && cp .repo-config  $repo/
    cd $repo
    git 
    git add . 
    git commit -am"update workflow"
    git push
done < java-repos.txt
