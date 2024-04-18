
# Administrator mode ENABLE or DISABLE.ps1 #

Clear-Host -ErrorAction SilentlyContinue

$Registry_Path = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'

Write-Host `n
Write-Host " =================================== " -ForegroundColor Cyan
Write-Host "*                                   *" -ForegroundColor Cyan
Write-Host "*  1 - Administrator mode ENABLE    *" -ForegroundColor Cyan
Write-Host "*                                   *" -ForegroundColor Cyan
Write-Host "*  2 - Administrator mode DISABLE   *" -ForegroundColor Cyan
Write-Host "*                                   *" -ForegroundColor Cyan
Write-Host " =================================== " -ForegroundColor Cyan
Write-Host `n

$choice = Read-Host Type the option

if ($choice -eq '1') {
    $currentValue = Get-ItemPropertyValue -Path $Registry_Path -Name EnableLUA -ErrorAction SilentlyContinue
    if ($currentValue -ne '1') {
        Set-ItemProperty -Path $Registry_Path -Name EnableLUA -Value '1' -ErrorAction SilentlyContinue
    } else {
        Exit
    }
} elseif ($choice -eq '2') {
    $currentValue = Get-ItemPropertyValue -Path $Registry_Path -Name EnableLUA -ErrorAction SilentlyContinue
    if ($currentValue -ne '0') {
        Set-ItemProperty -Path $Registry_Path -Name EnableLUA -Value '0' -ErrorAction SilentlyContinue
    } else {
        Exit
    }
} else {
    Exit
}

Start-Sleep -Seconds 2.5
Clear-Host
