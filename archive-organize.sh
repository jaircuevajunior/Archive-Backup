#!/bin/bash
SCRIPT="archive-script.sh"
if [[ -z "$1" || -z "$2" || -z "$3" ]]
then
        echo "Usage - $SCRIPT origin destiny max_versions"
        echo
        echo "Example: $SCRIPT /backups/daily /backups/weekly 4"
        exit 1
fi
ORIGIN="$1"
DESTINY="$2"
MAX_VERSIONS="$3"

NEW_FILE="$ORIGIN/$(ls $ORIGIN -lt|tail -n1|sed -r 's/\ +/ /g'|cut -d' ' -f9)"
OLD_FILE="$DESTINY/$(ls $DESTINY -lt|tail -n1|sed -r 's/\ +/ /g'|cut -d' ' -f9)"
TOTAL_VERSIONS="$(ls $DESTINY -l|tail -n+2|wc -l)"

function log {
        echo `date +'%Y-%m-%d %H:%M:%S'` $1
}

if [[ "$TOTAL_VERSIONS" -ge "$MAX_VERSIONS" ]]
then
        log "RM $OLD_FILE"
        rm $OLD_FILE
fi

if [ "$NEW_FILE" != '' ]
then
        log "CP '$NEW_FILE' '$DESTINY'"
        cp "$NEW_FILE" "$DESTINY"
fi
