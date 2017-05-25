#!/bin/bash

KEYS_DIR=/workspace/github-keys

GITCONFIG=~/.gitconfig

cd $KEYS_DIR
for KEY in *
do
    REPO="$(echo "$KEY" | sed 's:_:/:g')"

    if [ "$REPO" != "" ]
    then
        cat >>$GITCONFIG <<EOF

[url "git@github.com:$REPO"]
    insteadOf = https://github.com/$REPO
EOF
    fi
done

exec glide.bash "$@"
