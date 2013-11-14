#!/usr/bin/env bash

source ./env.sh
set -o verbose
for branch in $BRANCHES
do
  eval "git co ${branch}"
  echo 'Pushing...'
	eval "git push"
done
eval "git co master"
