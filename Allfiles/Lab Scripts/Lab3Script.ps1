install-packageprovider NuGet -Force
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module -Name ExchangeOnlineManagement -Force
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
Import-Module ExchangeOnlineManagement -Force
Connect-IPPSSession

Start-Sleep -Seconds 5
Add-RoleGroupMember "eDiscovery Manager" -Member "Nestor Wilke"
Start-Sleep -Seconds 5
$RoleGroupMemeber = Get-RoleGroupMember "eDiscovery Manager"
Start-Sleep -Seconds 5
Add-eDiscoveryCaseAdmin -user $RoleGroupMemeber.PrimarySmtpAddress