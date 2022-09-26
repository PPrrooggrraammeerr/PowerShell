
### Mouse DISABLE.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
	$Registry_Path = 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mouclass'
		if (Get-ItemPropertyValue -Path $Registry_Path -Name Start | Select-String '3' -ErrorAction SilentlyContinue) {Set-ItemProperty -Path $Registry_Path -Name Start -Value '4' -ErrorAction SilentlyContinue} else {Set-ItemProperty -Path $Registry_Path -Name Start -Value '4' -ErrorAction SilentlyContinue}
			Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
				$Write_Host = Write-Host;
					Write-Output $Write_Host
						Write-Host Start changed to 4 -ForegroundColor Cyan -ErrorAction SilentlyContinue
							Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
								Clear-Host -ErrorAction SilentlyContinue
									Exit

### Finished ###
