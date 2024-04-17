$services = @("wuauserv", "CryptSvc", "BITS")
$btfolder = 'C:\$WINDOWS.~BT'
$downloadfolder = "C:\Windows\SoftwareDistribution\Download"
foreach ($service in $services)
{
    Stop-Service -Name $service
    Set-Service -Name $service -StartupType Disabled
}

If (Test-Path $btfolder){
    Remove-Item -Recurse -Force $btfolder
}

If (Test-Path $downloadfolder){
    Remove-Item -Recurse -Force $downloadfolder
}

foreach ($service in $services)
{
    Set-Service -Name $service -StartupType Automatic
    Start-Service -Name $service
}
