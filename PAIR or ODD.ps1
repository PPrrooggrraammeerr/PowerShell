
### PAIR or ODD.ps1 ###

while (1) { 

    while (2) {

        Clear-Host -ErrorAction SilentlyContinue
        
        $Type_the_number = Read-Host Type the number or e / E to exit
        Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
        Clear-Host -ErrorAction SilentlyContinue
        
        if (($Type_the_number -eq 'e') -and ($Type_the_number -eq 'E')) {Exit}
        $Write_Host = Write-Host;
        Write-Output $Write_Host
        
        if ($Type_the_number % 2 -eq 0) {Write-Host Number $Type_the_number is pair -ForegroundColor Green} else {Write-Host Number $Type_the_number is odd -ForegroundColor Red} 
        Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
        Clear-Host -ErrorAction SilentlyContinue

            break

              }

}
