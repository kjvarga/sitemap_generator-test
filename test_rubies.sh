#!/usr/bin/env bash

# NOTE: Ruby 2.3.* needs RubyGems < 2.0 http://stackoverflow.com/questions/15349869/undefined-method-source-index-for-gemmodule-nomethoderror
# So in effect we have to lock RubyGems at 1.8.25 for all Ruby versions: gem update --system 1.8.25

# Update bundles in each environment
set -o verbose
for branch in 'plugin' 'rails2' 'rails3' 'standalone'
do
  eval "git co ${branch}"
  echo 'Bundling...'
  RBXOPT="-Xrbc.db" rvm ree,1.9.2,1.9.3 exec bundle
done
for branch in 'rails4'
do
  eval "git co ${branch}"
  echo 'Bundling...'
  RBXOPT="-Xrbc.db" rvm 1.9.3 exec bundle
done
echo -e 'Finished bundling.\n\n\n\n\n\n\nRunning Specs...'

# Run the specs across different rubies.
for branch in 'plugin' 'rails2' 'rails3' 'standalone'
do
  eval "git co ${branch}"
  echo 'Running specs...'
  RBXOPT="-Xrbc.db" rvm ree,1.9.2,1.9.3 exec bundle exec rake spec
done
for branch in 'rails4'
do
  eval "git co ${branch}"
  echo 'Running specs...'
  RBXOPT="-Xrbc.db" rvm 1.9.3 exec bundle exec rake spec
done
echo 'Switching to master'
git co master
echo 'Done.'
