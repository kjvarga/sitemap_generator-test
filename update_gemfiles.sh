#!/usr/bin/env bash
source ./env.sh
set -o verbose

for branch in $BRANCHES_ALL_RUBIES
do
  eval "git co ${branch}"
  echo 'Bundling...'
  RBXOPT="-Xrbc.db" rvm ree exec bundle
	eval "git add Gemfile.lock"
	eval "git ci -m 'Updated Gemfile'"
done
for branch in $BRANCHES_193
do
  eval "git co ${branch}"
  echo 'Bundling...'
  RBXOPT="-Xrbc.db" rvm 1.9.3 exec bundle
	eval "git add Gemfile.lock"
	eval "git ci -m 'Updated Gemfile'"
done
eval "git co master"
