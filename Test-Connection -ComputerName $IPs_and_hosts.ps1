
### Test-Connection -ComputerName $IPs_and_hosts ###

$File_Path = "$env:USERPROFILE\Desktop\IPs and hosts.txt"
if (-not (Test-Path -Path $File_Path -PathType Container)) {
New-Item -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt" -ItemType File -Force -ErrorAction SilentlyContinue
} else {Remove-Item -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt" -Force -ErrorAction SilentlyContinue
}
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

$Out_File += "ftp.sunet.se`n8.8.8.8`n8.8.4.4`nwww.cloudflare.com`n192.168.0.0`n192.168.0.1`n1.1.1.1`n1.0.0.1`nwww.google.com`nwww.facebook.com`n10.0.0.1"
Write-Output $Out_File | Out-File "$env:USERPROFILE\Desktop\IPs and hosts.txt"
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

$IPs_and_hosts = Get-Content -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt"
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Foreach ($IP_and_host in $IPs_and_hosts) {
if (Test-Connection -ComputerName $IP_and_host -Count 1 -ErrorAction SilentlyContinue) {
Write-Host "$IP_and_host is up" -ForegroundColor Green
} else {
Write-Host "$IP_and_host is down" -ForegroundColor Red
}
}

Clear-Content -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt"
Start-Sleep -Seconds 10 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Remove-Item -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Exit
