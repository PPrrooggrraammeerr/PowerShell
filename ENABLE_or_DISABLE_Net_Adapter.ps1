
### ENABLE_or_RESTART_Net_Adapter.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
$enable_or_restart_net_adapter = Get-NetAdapter -Name Ethernet; 
if (
    $enable_or_restart_net_adapter.Status -eq 'Up') {
        Restart-NetAdapter -Name Ethernet -Verbose -ErrorAction SilentlyContinue} 
            elseif (
                $enable_or_restart_net_adapter.Status -eq 'Disabled') {
                    Enable-NetAdapter -Name Ethernet -Verbose -ErrorAction SilentlyContinue
                }

### -noprofile -executionpolicy bypass -file D:\ENABLE_or_RESTART_Net_Adapter.ps1 ###
