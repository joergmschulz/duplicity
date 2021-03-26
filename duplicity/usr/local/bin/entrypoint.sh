#!/bin/sh
set -e


source /run/secrets/duplicity
# prepare duplicity environment

cp -r /run/secrets/gnupg ~/
export GNUPGHOME=~/gnupg

mkdir ~/.ssh
cp /run/secrets/duplicity-ssh-key ~/.ssh/
chmod 600 ~/.ssh/duplicity-ssh-key

printf "host $BACKUP_HOST \n\
  port $BACKUP_PORT \n\
  StrictHostKeyChecking  no \n\
  IdentityFile ~/.ssh/duplicity-ssh-key
" > ~/.ssh/config

exec "$@"
