#!/bin/bash

git checkout master
git checkout -b work-2
cat > work2.txt <<EOS
Work 2 content
EOS
git add .
git commit -m "Add work 2 content"
