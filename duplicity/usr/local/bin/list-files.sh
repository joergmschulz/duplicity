#!/bin/sh


for i in $BACKDIRS
do
    duplicity -v9 list-current-files --encrypt-key $ENCRKEY --sign-key $SIGNKEY rsync://$BACKUP_HOST:/${BACKUP_RPATH}/${SOURCE_HOST}/$i

done
