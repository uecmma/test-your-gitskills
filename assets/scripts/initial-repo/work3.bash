#!/bin/bash

git checkout master
git checkout -b work-3-sub-br
cat > work3.txt <<EOS
Work 3 content
EOS
git add .
git commit -m "Add work 3 content"
git tag work-3-sub
git rm work3.txt
git commit -m "Remove work 3 content"
