# Archive-Backup

All it does is to "tar" with gzip compression a given file (or folder) to a given destination using the date as final file name (g: 2015-02-05.tar.gz).

It can also delete a file which has the name of a date in a given number of days in past.

# Usage:

````
#./archive-backup.sh ORIGIN_FILE_OR_FOLDER DESTINY_DIR_WITHOUT_TRAILING_SLASH DAYS_FOR_KEEP_BACKUP
#example:
./archive-backup.sh /disk1/mysql.tvabcd.com.br/today/ /disk1/mysql.tvabcd.com.br 7
````
Lets say you've done the above example at 2015-02-05.
It's gonna take the folder `/disk1/mysql.tvabcd.com.br/today/`, compress with gzip in a tarball file on `/disk1/mysql.tvabcd.com.br/2015-02-05.tar.gz`, and it's gonna try to delete an 7 days old backup `/disk1/mysql.tvabcd.com.br/2015-01-29.tar.gz`.
