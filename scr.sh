#/bin/bash

find packages src -type d -depth 1 >| basket.pth
perl -pi -e 's:httplib2:httplib2/python2:' basket.pth

git init

for f in src/*
do
    pushd $f > /dev/null && REPO=$(git config remote.origin.url) && popd > /dev/null && git submodule add $REPO $f
done

git add .
