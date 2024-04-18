
### ENABLE_or_DISABLE_Net_Adapter.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
$enable_or_disable_net_adapter = Get-NetAdapter -Name Ethernet; 
if (
    $enable_or_disable_net_adapter.Status -eq 'Up') {
        Restart-NetAdapter -Name Ethernet -Verbose -ErrorAction SilentlyContinue} 
            elseif (
                $enable_or_disable_net_adapter.Status -eq 'Disabled') {
                    Enable-NetAdapter -Name Ethernet -Verbose -ErrorAction SilentlyContinue
                }

### -noprofile -executionpolicy bypass -file D:\ENABLE_or_DISABLE_Net_Adapter.ps1 ###
