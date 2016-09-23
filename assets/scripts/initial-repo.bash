#!/bin/bash

script_dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# initialize git repository
git init
git add .
git commit -m "Initial commit"

for file in $script_dir/initial-repo/*; do
  cmd "./$file"
done
