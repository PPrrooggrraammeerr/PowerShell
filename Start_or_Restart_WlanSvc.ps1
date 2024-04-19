
### Start_or_Restart_WlanSvc.ps1 ###

Clear-Host -ErrorAction SilentlyContinue
$start_or_restart_wlansvc = Get-Service -Name WlanSvc; 
if (
    $start_or_restart_wlansvc.Status -eq 'Running') {
        Restart-Service -Name WlanSvc -Verbose -ErrorAction SilentlyContinue} 
            elseif (
                $start_or_restart_wlansvc.Status -eq 'Stopped') {
                    Start-Service -Name WlanSvc -Verbose -ErrorAction SilentlyContinue
                }

### -noprofile -executionpolicy bypass -file D:\Start_or_Restart_WlanSvc.ps1 ###