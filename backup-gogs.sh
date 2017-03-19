#!/bin/sh
# Backup Gogs (https://gogs.io/) to another directory.

# When running in cron, USER nor USERNAME are set by default (https://github.com/gogits/gogs/blob/master/modules/user/user.go).
export USER="$(whoami)"

temp_dir="/tmp/gogsdump/"
backup_dir="/mnt/backup-gogs/"

mkdir $temp_dir

cd $temp_dir
/home/git/gogs/gogs dump -t $temp_dir

rsync $temp_dir*.zip $backup_dir --remove-source-files
