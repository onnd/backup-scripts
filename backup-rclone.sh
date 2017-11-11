#!/bin/bash

#
# Backup script using rclone
# Anton Lindström (anton@antonanton.com) 2017-09-21
#
# This script syncs LOCAL_CURRENT_DIR to REMOTE:REMOTE_CURRENT_DIR
# This operation makes the contents of REMOTE:REMOTE_CURRENT_DIR identical to LOCAL_CURRENT_DIR
# Before any file is changed or removed from REMOTE:REMOTE_CURRENT_DIR it will be copied to REMOTE:REMOTE_BACKUP_DIR
# REMOTE:REMOTE_BACKUP_DIR gets created if it does not already exist
#
# This backup script is meant to be scheduled to run daily.
#


YESTERDAY=$(date -d yesterday "+%Y-%m-%d")
LOCAL_CURRENT_DIR="/home/anton/Backups/current"
REMOTE="secret"
REMOTE_CURRENT_DIR="backups/current"
REMOTE_BACKUP_DIR="backups/$YESTERDAY"

/usr/bin/rclone -v sync $LOCAL_CURRENT_DIR $REMOTE:$REMOTE_CURRENT_DIR --backup-dir $REMOTE:$REMOTE_BACKUP_DIR
