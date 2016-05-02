#!/bin/bash

SCRIPTS=/mnt/disk1/bkp_scripts/daily
LOGDIR=$SCRIPTS/logs
DESTINY=/mnt/disk1/bkp_files/rsync

function log {
	echo `date +'%Y-%m-%d %H:%M:%S'` $1
}

function enable {
	log 'Running: '$1
	source $1
	log 'End of: '$1
}

function rs {
	rsync --stats --log-file=$LOGDIR/$1.log -azRe 'ssh' --delete-excluded $2 $DESTINY/$1/ > /dev/null
}

echo
log '__Starting Routine__'
find $SCRIPTS -type f -name '*.sh'|sort|while read file
do enable "$file"
done
log '__End of Routine__'
echo
