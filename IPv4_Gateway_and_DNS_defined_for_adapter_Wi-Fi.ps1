
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
$DNS_preferential = Read-Host "DNS preferential"
$DNS_alternative = Read-Host "DNS alternative"

New-NetIPAddress -IPAddress $IPv4 -InterfaceAlias "Wi-Fi" -DefaultGateway $Gateway -AddressFamily IPv4 -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias "Wi-Fi" -ResetServerAddresses
Set-DnsClientServerAddress -InterfaceAlias "Wi-Fi" -ServerAddresses @($DNS_preferential, $DNS_alternative)

} else {

Set-NetIPInterface -InterfaceAlias "Wi-Fi" -DHCP enabled
Set-DnsClientServerAddress -InterfaceAlias "Wi-Fi" -ResetServerAddresses
Remove-NetRoute -InterfaceAlias "Wi-Fi"
Restart-NetAdapter -InterfaceAlias "Wi-Fi"

}
