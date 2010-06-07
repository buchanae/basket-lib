Dependencies for `basket <http://github.com/abuchanan/basket>`.

It goes something like this::

    pip install --no-install --build=vendor/packages --src=vendor/src -I -r requirements/dev.txt
    cd vendor/packages
    find packages src -type d -depth 1 >| basket.pth
    perl -pi -e 's:httplib2:httplib2/python2:' basket.pth

    git init
    for f in src/*\
        pushd $f >/dev/null && REPO=$(git config remote.origin.url) && popd > /dev/null && git submodule add $REPO $f
    git add .
