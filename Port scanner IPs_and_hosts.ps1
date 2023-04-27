
### Port scanner IPs_and_hosts ###

$File_Path = "$env:USERPROFILE\Desktop\IPs and hosts.txt"
if (-not (Test-Path -Path $File_Path -PathType Container)) {
New-Item -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt" -ItemType File -Force -ErrorAction SilentlyContinue
} else {Remove-Item -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt" -Force -ErrorAction SilentlyContinue
}
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

$Out_File_IPs_and_hosts += "ftp.sunet.se`n8.8.8.8`n8.8.4.4`nwww.cloudflare.com`n192.168.0.0`n192.168.0.1`n1.1.1.1`n1.0.0.1`nwww.google.com`nwww.facebook.com`n10.0.0.1"
Write-Output $Out_File_IPs_and_hosts | Out-File "$env:USERPROFILE\Desktop\IPs and hosts.txt"
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

$Out_File_Communication_ports += "21`n22`n23`n25`n53`n80`n123`n179`n443`n500`n3389"
Write-Output $Out_File_Communication_ports | Out-File "$env:USERPROFILE\Desktop\Communication ports.txt"
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

$IPs_and_hosts = Get-Content -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt"
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

$Communication_ports = Get-Content -Path "$env:USERPROFILE\Desktop\Communication ports.txt"
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Foreach ($IP_and_host in $IPs_and_hosts) {

	Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
	Clear-Host -ErrorAction SilentlyContinue

Foreach ($Communication_port in $Communication_ports) {

try {
    $status_and_result = (New-Object System.Net.Sockets.TcpClient).ConnectAsync($IP_and_host, $Communication_port).Wait(500)
    Write-Output "IP or host: $IP_and_host   Port: $Communication_port   Status: $status_and_result"
}

catch {
    Write-Output "IP or host: $IP_and_host   Port: $Communication_port   Status: not connected"
}
}
}

Clear-Content -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt"
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Clear-Content -Path "$env:USERPROFILE\Desktop\Communication ports.txt"
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Remove-Item -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Remove-Item -Path "$env:USERPROFILE\Desktop\IPs and hosts.txt" -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Exit
