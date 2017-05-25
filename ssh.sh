#!/bin/bash

KEYS_DIR=/workspace/github-keys

SSH_HOST="$1"
SSH_CMD="$2"

REPO_PATH=$(echo "$SSH_CMD" | sed "s/^[^ ]* '\([^']*\)'.*$/\1/")

SHORT_REPO=$(echo "$REPO_PATH" | sed 's/\.git$//; s:/:_:g')
KEY_FILE="$KEYS_DIR/$SHORT_REPO"

if [ "$SSH_HOST" = "git@github.com" -a -f "$KEY_FILE" ]
then
	SSH_OPTS="-o IdentityFile=$KEY_FILE"
fi

exec ssh $SSH_OPTS "$@"
