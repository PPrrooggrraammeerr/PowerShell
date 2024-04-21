
### Create multiple USERS.ps1 ###

$create_users_file = "$env:USERPROFILE\users.txt"
if (-not (Test-Path -Path $create_users_file)) {
New-Item -Path $create_users_file -ItemType File -ErrorAction SilentlyContinue
} else {
Remove-Item -Path $create_users_file -Force -ErrorAction SilentlyContinue
New-Item -Path $create_users_file -ItemType File -ErrorAction SilentlyContinue
}
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

$output_users_file = "User1`nUser2`nUser3`nUser4`nUser5"
Write-Output $output_users_file | Out-File -FilePath $create_users_file
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

$users_of_file = Get-Content -Path $create_users_file
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Foreach ($user_of_file in $users_of_file) {

    $check_users_of_file = Get-LocalUser -Name $user_of_file -ErrorAction SilentlyContinue
    if ($check_users_of_file.Enabled -eq 'True') {Remove-LocalUser -Name $user_of_file

} else {

    $password_for_user = $user_of_file
    $secure_password_for_user = $password_for_user | ConvertTo-SecureString -AsPlainText -Force
    if (New-LocalUser -Name $user_of_file -Password $secure_password_for_user -ErrorAction SilentlyContinue) {
    Add-LocalGroupMember -Group Usuários -Member $user_of_file | Write-Host $user_of_file 'created successfully' | Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue}

}
}

Clear-Content -Path $create_users_file
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue

Remove-Item -Path $create_users_file -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1 -ErrorAction SilentlyContinue
Clear-Host -ErrorAction SilentlyContinue