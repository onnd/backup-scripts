# backup-scripts
Backup scripts that I use

I use **backup-rsync.sh** to back up directories on my laptop to my server

I use **backup-rclone** to back up my server to google drive. The script assumes that you have a rclone remote configured. It should work for other types of remotes besides google drive but that is untested. I suggest you set up a *secret* remote which locally encrypts your files before they get uploaded to the cloud. Check the rclone documentation.
