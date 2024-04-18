
### FileZilla Server ENABLE or DISABLE.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
$ftp_enable_or_disable = Get-Service -Name filezilla-server;
if (
    $ftp_enable_or_disable.Status -eq 'Running') {
        Restart-Service -Name filezilla-server -Verbose -ErrorAction SilentlyContinue} 
            elseif (
                $ftp_enable_or_disable.Status -eq 'Stopped') {
                    Start-Service -Name filezilla-server -Verbose -ErrorAction SilentlyContinue
                }

### -noprofile -executionpolicy bypass -file D:\FileZilla Server ENABLE or DISABLE.ps1 ###
