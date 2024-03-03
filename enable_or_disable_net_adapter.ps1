
### ENABLE OR DISABLE NET ADAPTER.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
$enable_or_disable_net_adapter = Get-NetAdapter -Name Ethernet; 
if (
    $enable_or_disable_net_adapter.Status -eq 'Up') {
        Stop-Process -Name cmd -Force -Verbose -ErrorAction SilentlyContinue} elseif (
            $enable_or_disable_net_adapter.Status -eq 'Disabled') {
                Enable-NetAdapter -Name Ethernet -Verbose -ErrorAction SilentlyContinue
            }
