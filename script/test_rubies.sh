#!/usr/bin/env bash

# Run the specs across different rubies.
# 1.9.3 fiails with undefined method `run_all' for []:Array from RSpec.
# The latest rspec-rails depends on active_support v3.
set -o verbose
RBXOPT="-Xrbc.db" rvm ree,1.9.2 exec bundle
RBXOPT="-Xrbc.db" rvm ree,1.9.2 exec bundle exec rake spec
