#!/bin/bash

git checkout master
git checkout -b work-4-base
cat > work4.txt <<EOS
Work 4 content
EOS
git add .
git commit -m "Add work 4 content"
cat > work4-base.txt <<EOS
Sub resource
EOS
git add .
git commit -m "Add sub resource"
git checkout HEAD^
git checkout -b work-4
cat >> work4.txt <<EOS
Complete
EOS
git commit -am "Complete work 4 content"
