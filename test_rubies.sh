#!/usr/bin/env bash

# Run the specs across different rubies.
set -o verbose
for branch in 'plugin' 'rails2' 'rails3' 'standalone'
do
  eval "git co ${branch}"
  echo 'Bundling...'
  RBXOPT="-Xrbc.db" rvm ree,1.9.2,1.9.3 exec bundle
done
echo -e 'Finished bundling.\n\n\n\n\n\n\nRunning Specs...'
for branch in 'plugin' 'rails2' 'rails3' 'standalone'
do
  eval "git co ${branch}"
  echo 'Running specs...'
  RBXOPT="-Xrbc.db" rvm ree,1.9.2,1.9.3 exec bundle exec rake spec
done
echo 'Switching to master'
git co master
echo 'Done.'
