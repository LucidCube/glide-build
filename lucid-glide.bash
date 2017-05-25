#!/bin/bash

KEYS_DIR=/workspace/github-keys

GITCONFIG=~/.gitconfig

if [ -d $KEYS_DIR ]
then
    cd $KEYS_DIR
    for KEY in *
    do
        if [[ ! $KEY =~ \.pub$ ]]
        then
            REPO="$(echo "$KEY" | sed 's:_:/:g')"

            if [ "$REPO" != "" ]
            then
                cat >>$GITCONFIG <<EOF
[url "git@github.com:$REPO"]
    insteadOf = https://github.com/$REPO
EOF
            fi
        fi
    done

    cd - >/dev/null
fi

echo
echo "Generated git config:"
cat $GITCONFIG
echo

exec glide.bash "$@"
