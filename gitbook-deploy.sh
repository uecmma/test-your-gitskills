#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]; then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parge --short HEAD)

cd _book

git init
git config user.name "uecmma"
git config user.email "developer@mma.club.uec.ac.jp"

git remote add upstream "https://$GH_TOKEN@github.com/uecmma/test-your-gitskills.git"
git fetch upstream && git reset upstream/gh-pages

# echo "www.mma.club.uec.ac.jp" > CNAME

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages
