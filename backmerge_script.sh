#!/bin/bash
GITHUB_DOMAIN='https://github.com'
GITHUB_ORG='ZagaUS'
TARGET_CODEBASE=$1

# clone given code base
function cloneCodebase() {
  local codebase=$1
  local github_url="${GITHUB_DOMAIN}/${GITHUB_ORG}/${codebase}"
  rm -rf $codebase
  git clone $github_url
}


function isMergableBranch() {
  local branch=$1
  local outcome=1
  if [[ "$branch" == feature* ]]; then
    outcome=0
  fi
  return $outcome
}

# function performMerge() {
  
# }

function findRemoteBranches() {

  git branch -r | while read -r branch; do
    branch=$(echo "$branch" | sed 's/^[[:space:]]*origin\///')
    echo "Processing branch: $branch"
    if isMergableBranch "$branch"; then
      echo "$branch is mergable"
      performMerge
    fi
  done
}
 
# filter branches
#  - what should filter criteria be?
function filterBranches() {
echo "provide impl"
}

function backmerge() {
  # iterate over filtered branches:
#  - checkout branch
#  - merge main into checked out branch
#  - push branch to remote
echo "provide impl"
}

cloneCodebase $TARGET_CODEBASE
pushd $TARGET_CODEBASE
findRemoteBranches
filterBranches
backmerge