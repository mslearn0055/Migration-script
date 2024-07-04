#migration script

#!/bin/bash 

sourceRepo="$1"
targetRepo="$2"

source_repo_name=$(basename "$sourceRepo .git)

git clone --mirror "sourceRepo" wandisco_$source_repo_name

if { $? -ne 0 }: then 
echo "source repo not found"
exit 1
else 
cd wandisco_$source_repo_name
git remote add origin "$targetRepo"
git push neworigin --all
git push neworigin --tags 
cd ..
rm -rf wandisco_$source_repo_name
fi
