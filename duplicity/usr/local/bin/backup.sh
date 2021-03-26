#!/bin/sh

if [ -z $BACKUP_HOST ]; then
  MKDIR="mkdir -p"
else
  MKDIR="ssh duplicity@$BACKUP_HOST mkdir -p "
fi

# loop on directories
echo -n "----  $* backup of $SOURCE_HOST ---- "; date
for i in $BACKDIRS
do
  echo Starting backup of directory /$i
  # create directory, then backup, then erase old backups
  $MKDIR $BACKUP_RPATH/${SOURCE_HOST}/$i && \
	  duplicity $* --encrypt-key $ENCRKEY --sign-key $SIGNKEY $i  rsync://$BACKUP_HOST:/${BACKUP_RPATH}/${SOURCE_HOST}/$i && \
	  duplicity --encrypt-key $ENCRKEY --sign-key $SIGNKEY $DUPOPTS_CLEANUP  rsync://$BACKUP_HOST:/${BACKUP_RPATH}/${SOURCE_HOST}/$i


  #$DUPEXEC --verify $RPATH/$i /$i
done
#  if local, fix permissions
# if [ -z $HOST ]; then chown -R $NAME.$NAME $LPATH; fi

echo -n "---- Finished backup on $HOSTNAME ---- "; date
