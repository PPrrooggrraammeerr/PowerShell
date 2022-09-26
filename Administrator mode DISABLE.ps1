
### Administrator mode DISABLE.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
	$Registry_Path = 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System'
		if (Get-ItemPropertyValue -Path $Registry_Path -Name EnableLUA | Select-String '1' -ErrorAction SilentlyContinue) {Set-ItemProperty -Path $Registry_Path -Name EnableLUA -Value '0' -ErrorAction SilentlyContinue} else {Set-ItemProperty -Path $Registry_Path -Name EnableLUA -Value '0' -ErrorAction SilentlyContinue}
			Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
				$Write_Host = Write-Host;
					Write-Output $Write_Host
						Write-Host EnableLUA changed to 0 -ForegroundColor Cyan -ErrorAction SilentlyContinue
							Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
								Clear-Host -ErrorAction SilentlyContinue
									Exit

### Finished ###
