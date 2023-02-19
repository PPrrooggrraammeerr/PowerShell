
### Test-Connection -ComputerName $Test_Connection.ps1 ###

while (1) { 

    while (2) {

        Clear-Host -ErrorAction SilentlyContinue
        $Test_Connection = Read-Host Type IP or Host or e/E to exit
        Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
        Clear-Host -ErrorAction SilentlyContinue 
        if (($Test_Connection -eq 'e') -and ($Test_Connection -eq 'E')) {Exit}
        Test-Connection -ComputerName $Test_Connection -ErrorAction SilentlyContinue
        $Write_Host = Write-Host;
        Write-Output $Write_Host
        if (Test-Connection -ComputerName $Test_Connection -ErrorAction SilentlyContinue) {Write-Host $Test_Connection is up -ForegroundColor Green} else {Write-Host $Test_Connection is down -ForegroundColor Red} 
        Start-Sleep -Seconds 10 -ErrorAction SilentlyContinue
        Clear-Host -ErrorAction SilentlyContinue
            break

              }

}

### Finished ###
