
### IPv4, Gateway and DNS defined for adapter Wi-Fi ###

$wifiInfo = Get-NetIPAddress | Where-Object { $_.InterfaceAlias -eq 'Wi-Fi' }

$dhcpConfig = $wifiInfo | Where-Object {

$_.PrefixOrigin -eq 'Dhcp' -and
$_.SuffixOrigin -eq 'Dhcp' -and
$_.PrefixLength -eq 24

}

if ($dhcpConfig) {

$IPv4 = Read-Host "IPv4"
$Gateway = Read-Host "Gateway"
$DNS = Read-Host "DNS"

DNSArray = $DNS -split ','

New-NetIPAddress -IPAddress $IPv4 -InterfaceAlias "Wi-Fi" -DefaultGateway $Gateway -AddressFamily IPv4 -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias "Wi-Fi" -ServerAddresses $DNSArray

} else {

Set-NetIPInterface -InterfaceAlias "Wi-Fi" -DHCP enabled
Set-DnsClientServerAddress -InterfaceAlias "Wi-Fi" -ResetServerAddress
Remove-NetRoute -InterfaceAlias "Wi-Fi"
Restart-NetAdapter -InterfaceAlias "Wi-Fi"

}
