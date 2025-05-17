
### Install_Chocolatey_and_Ngrok_for_Execution_One_Server_the_Transfers_File.ps1 ###

Function Check-RunAsAdministrator () {
	
    $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
	
    if($CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {

        Write-Host "Script is running with Administrator privileges!" -ForegroundColor Green
        Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
        Clear-Host -ErrorAction SilentlyContinue
		
    } else {
		
	$ElevatedProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";

	$ElevatedProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
	$ElevatedProcess.Verb = "RunAs"
	
	[System.Diagnostics.Process]::Start($ElevatedProcess)
	
	Exit
		
    }
	
}

Check-RunAsAdministrator

if (Test-Path -Path "C:\ProgramData\chocolatey") {

    if (Test-Path -Path "C:\ProgramData\chocolatey\bin\choco.exe") {
		
	Write-Host "Chocolatey is already installed!" -ForegroundColor Green
        Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
        Clear-Host -ErrorAction SilentlyContinue
		
	choco.exe install ngrok --force;

        $Path_Server = "$env:USERPROFILE\Ngrok_Server_Transfers_File";

        if (-not (Test-Path -Path $Path_Server)) {
            New-Item -Path $Path_Server -ItemType Directory
        } else {

            ngrok config add-authtoken your_authtoken
            ngrok http file:///$Path_Server;
	    Exit

        }

        ngrok config add-authtoken your_authtoken
        ngrok http file:///$Path_Server;
	Exit

	}

} else {

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    
    Start-Sleep -Seconds 2.5 -ErrorAction SilentlyContinue
    
    choco.exe install ngrok --force;

    $Path_Server = "$env:USERPROFILE\Ngrok_Server_Transfers_File";

    if (-not (Test-Path -Path $Path_Server)) {
        New-Item -Path $Path_Server -ItemType Directory
    } else {
        ngrok config add-authtoken your_authtoken
        ngrok http file:///$Path_Server;
	Exit
    }

    ngrok config add-authtoken your_authtoken
    ngrok http file:///$Path_Server;
    Exit

}

### -noprofile -executionpolicy bypass -file D:\Install_Chocolatey_and_Ngrok_for_Execution_One_Server_the_Transfers_File.ps1 ###
