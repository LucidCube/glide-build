#!/bin/bash

KEYS_DIR=/workspace/github-keys

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
                git config --global url."git@github.com:$REPO".insteadOf "https://github.com/$REPO"
            fi
        fi
    done

    cd - >/dev/null
fi

#echo
#echo "Generated git config:"
#cat ~/.gitconfig
#echo

exec glide.bash "$@"
