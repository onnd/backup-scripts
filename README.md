# backup-scripts
These are backup scripts that I use.

I use **backup-rsync.sh** to back up directories on my laptop to my server.

I use **backup-rclone.sh** to back up my server to google drive. The script assumes that you have rclone installed and an rclone remote configured. It should work for other types of remotes besides google drive but that is untested. I suggest you set up an *encrypted* type remote which locally and transparently encrypts and decrypts your files as they are copied to and from the cloud. Check the rclone documentation.
