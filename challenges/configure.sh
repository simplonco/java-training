#! /bin/sh -x
language='java'
# Get x-common repository
git clone "https://github.com/exercism/x-common/"
# Get x$language repository
git clone "https://github.com/exercism/x$language/"
cd "x$language"
ls exercises | xargs -I {} cp ../x-common/exercises/{}/description.md exercises/{}/README.md
ls exercises | xargs -I {} cp ../.travis.yml exercises/{}/
ls exercises | xargs -I {} cp ../.gitignore exercises/{}/
ls exercises | xargs -I {} curl -i -H 'Authorization: token ****************************************' -d '{"name":"java-{}"}' https://api.github.com/orgs/simplonco/repos
ls exercises | xargs -n 1 ../setup_exercise.sh
cd ..
