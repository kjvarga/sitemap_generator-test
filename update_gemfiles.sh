set -o verbose
for branch in 'plugin' 'rails2' 'rails3' 'standalone'
do
  eval "git co ${branch}"
  echo 'Bundling...'
  RBXOPT="-Xrbc.db" rvm ree exec bundle
	eval "git add Gemfile.lock"
	eval "git ci -m 'Updated Gemfile'"
done
eval "git co master"
