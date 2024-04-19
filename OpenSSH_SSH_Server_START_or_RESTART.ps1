
### OpenSSH_SSH_Server_START_or_RESTART.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
$ssh_start_or_restart = Get-Service -Name sshd; 
if (
    $ssh_start_or_restart.Status -eq 'Running') {
        Restart-Service -Name sshd -Verbose -ErrorAction SilentlyContinue} 
            elseif (
                $ssh_start_or_restart.Status -eq 'Stopped') {
                    Start-Service -Name sshd -Verbose -ErrorAction SilentlyContinue
                }

### -noprofile -executionpolicy bypass -file D:\OpenSSH_SSH_Server_START_or_RESTART.ps1 ###
