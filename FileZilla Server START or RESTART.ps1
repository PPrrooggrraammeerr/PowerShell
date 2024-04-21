
### FileZilla Server START or RESTART.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
$ftp_start_or_restart = Get-Service -Name filezilla-server
if (
    $ftp_start_or_restart.Status -eq 'Running') {
        Restart-Service -Name filezilla-server -Verbose -ErrorAction SilentlyContinue} 
            elseif (
                $ftp_start_or_restart.Status -eq 'Stopped') {
                    Start-Service -Name filezilla-server -Verbose -ErrorAction SilentlyContinue
                }

### -noprofile -executionpolicy bypass -file D:\FileZilla Server START or RESTART.ps1 ###
