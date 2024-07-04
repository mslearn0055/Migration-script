#!/bin/bash 

sourceRepo="$1"
targetRepo="$2"

# Fixing the syntax for extracting the source repo name
source_repo_name=$(basename "$sourceRepo" .git)

# Fixing the condition and syntax errors in the if statement
git clone --mirror "$sourceRepo" wandisco_$source_repo_name

if [ $? -ne 0 ]; then 
  echo "source repo not found"
  exit 1
else 
  cd wandisco_$source_repo_name
  git remote add origin "$targetRepo"
  git push origin --all
  git push origin --tags 
  cd ..
  rm -rf wandisco_$source_repo_name
fi
