# Powershell scripts I wrote

## delete_old_veeam_backup_files.ps1

This simple script deletes Veeam Agent backup files. I use this for private backups to delete old files because the Veeam Agent deletes backup files after the current backup finishes. This results in failed backups due to a full backup disk in my case.\
The xml file in this repo is a Windows task scheduler xml which triggers this script on event-id 110 (Veeam Backup has started). If you use the task file, make sure to edit some stuff beforehand, like Author, Command and Arguments. Otherwise the task looks ugly and may fail.\
The script generates a log file like this:

```log
Deleted path\to\backup_file.vbk  at 06/26/2021 22:00:01, size: 453.356491088867 GB
```

Works fine with Powershell 7.2.0 and Windows 10 21H1
