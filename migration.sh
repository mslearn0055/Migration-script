#!/bin/bash

sourceRepo="$1"
targetRepo="$2"

# Extract the repository name without the .git suffix
source_repo_name=$(basename "$sourceRepo" .git)

# Clone the source repository as a mirror
git clone --mirror "$sourceRepo" wandisco_$source_repo_name

# Check if the clone operation was successful
if [ $? -ne 0 ]; then 
  echo "Source repository not found"
  exit 1
else 
  cd wandisco_$source_repo_name
  
  # Remove the existing origin remote if it exists
  git remote remove origin 2>/dev/null
  
  # Add the new origin remote with authentication
  git remote add origin "$targetRepo"
  
  # Push all references to the new remote
  git push --mirror origin
  
  # Navigate back and remove the temporary directory
  cd ..
  rm -rf wandisco_$source_repo_name
fi
