#!/bin/bash

test -f /workspace/github-key && chmod 0600 /workspace/github-key

exec glide.bash "$@"
