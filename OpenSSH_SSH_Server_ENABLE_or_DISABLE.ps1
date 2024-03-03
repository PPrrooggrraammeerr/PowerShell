
### OpenSSH_SSH_Server_ENABLE_or_DISABLE.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
$ssh_enable_or_disable = Get-Service -Name sshd; 
if (
    $ssh_enable_or_disable.Status -eq 'Running') {
        Stop-Process -Name cmd -Force -Verbose -ErrorAction SilentlyContinue} 
            elseif (
                $ssh_enable_or_disable.Status -eq 'Stopped') {
                    Start-Service -Name sshd -Verbose -ErrorAction SilentlyContinue
                }

### -noprofile -executionpolicy bypass -file D:\OpenSSH_SSH_Server_ENABLE_or_DISABLE.ps1 ###