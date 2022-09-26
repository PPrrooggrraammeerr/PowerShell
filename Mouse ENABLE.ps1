param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}

### Mouse ENABLE.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
	$Registry_Path = 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass'
		if (Get-ItemPropertyValue -Path $Registry_Path -Name Start | Select-String '4' -ErrorAction SilentlyContinue) {Set-ItemProperty -Path $Registry_Path -Name Start -Value '3' -ErrorAction SilentlyContinue} else {Set-ItemProperty -Path $Registry_Path -Name Start -Value '3' -ErrorAction SilentlyContinue}
			Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
				$Write_Host = Write-Host;
					Write-Output $Write_Host
						Write-Host Start changed to 3 -ForegroundColor Cyan -ErrorAction SilentlyContinue
							Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
								Clear-Host -ErrorAction SilentlyContinue
									Exit

### Finished ###