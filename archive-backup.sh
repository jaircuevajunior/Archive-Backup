#/bin/bash

today=`date +'%Y-%m-%d'`
origin=$1
destiny="$2/$today.tar.gz"

tar -czvf $destiny $origin

daysago=`date --date="-$3 days" +"%Y-%m-%d"`
oldfile="$2/$daysago.tar.gz"

rm $oldfile
