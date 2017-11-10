#!/bin/sh
#
# Script for backing up a set of directories to a remote host.
# Based on someone's blog, but I can't remember where.
#
# Every time the script is run a new directory will be created on the remote host and the source files will be copied here.
# Each file copied will first be compared with the corresponding file in the last backup.
# If the file is unchanged (defined by timestamp, size & attributes) the file will not be copied, and instead a hard link will
# be created to the previously copied file, on the remote host.
#
# Assumes ssh keys have been exchanged.
#
# Anton Lindström (anton at antonanton.com) 2017-11-10
#

# Local directories to back up
SRC="/home/anton/Documents /home/anton/Program /home/anton/Mail"

# Remote path to place backups
DEST="/home/anton/Backups"

# Remote path to latest backup
CURRENT="$DEST/current"

# Remote path to backup in progress
INCOMPLETE="$DEST/incomplete"

# Remote path to timestamp file
TIMESTAMP="$CURRENT/_timestamp"

# Remote host
HOST="backuphost"

date=$(date "+%Y-%m-%d_%H:%M:%S")

rsync -axzP --link-dest="$CURRENT" $SRC "$HOST:$INCOMPLETE"
ssh $HOST "X=\$(cat $TIMESTAMP) && rm $TIMESTAMP && mv $CURRENT $DEST/\$X && mv $INCOMPLETE $CURRENT && echo $date > $TIMESTAMP"

# TIP: If the timestamps have been messed up and you need to back up, use --checksum, otherwise everything will get re-copied
