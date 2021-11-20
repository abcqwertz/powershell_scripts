$TIMESTAMP=(Get-Date).AddDays(-13)
$BACKUP_PATH="Path\to\backup\folder\*"
$LOG_FIlE="Path\to\logfile.log"
$FILES=Get-ChildItem -Path $BACKUP_PATH -Include "*.vbk", "*.vib" | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $TIMESTAMP}
foreach ($FILE in $FILES) {
    $FILE_SIZE=(($FILE).Length)/1GB
    Out-File -Encoding utf8 -InputObject "Deleted $FILE at $(Get-Date), size: $FILE_SIZE GB" -Append -FilePath $LOG_FIlE
    Remove-Item -Force $FILE
}
exit 0