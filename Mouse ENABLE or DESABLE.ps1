
# Mouse ENABLE or DISABLE.ps1 #

Clear-Host -ErrorAction SilentlyContinue

$Registry_Path = 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass'

Write-Host `n
Write-Host " ====================== " -ForegroundColor Cyan
Write-Host "*                      *" -ForegroundColor Cyan
Write-Host "*  1 - Mouse ENABLE    *" -ForegroundColor Cyan
Write-Host "*                      *" -ForegroundColor Cyan
Write-Host "*  2 - Mouse DISABLE   *" -ForegroundColor Cyan
Write-Host "*                      *" -ForegroundColor Cyan
Write-Host " ====================== " -ForegroundColor Cyan
Write-Host `n

$choice = Read-Host Type the option

if ($choice -eq '1') {
    $currentValue = Get-ItemPropertyValue -Path $Registry_Path -Name Start -ErrorAction SilentlyContinue
    if ($currentValue -ne '3') {
        Set-ItemProperty -Path $Registry_Path -Name Start -Value '3' -ErrorAction SilentlyContinue
    } else {
        Exit
    }
} elseif ($choice -eq '2') {
    $currentValue = Get-ItemPropertyValue -Path $Registry_Path -Name Start -ErrorAction SilentlyContinue
    if ($currentValue -ne '4') {
        Set-ItemProperty -Path $Registry_Path -Name Start -Value '4' -ErrorAction SilentlyContinue
    } else {
        Exit
    }
} else {
    Exit
}

Start-Sleep -Seconds 2.5
Clear-Host
