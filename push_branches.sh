set -o verbose
for branch in 'plugin' 'rails2' 'rails3' 'standalone'
do
  eval "git co ${branch}"
  echo 'Pushing...'
	eval "git push"
done
eval "git co master"
