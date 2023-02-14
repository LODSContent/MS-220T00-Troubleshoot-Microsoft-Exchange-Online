install-packageprovider NuGet -Force
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module -Name ExchangeOnlineManagement -Force
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
Import-Module ExchangeOnlineManagement -Force
connect-exchangeonline

New-TransportRule -name "Rule 1" -RecipientAddressType resolved -RejectMessageEnhancedStatusCode 5.7.1 -RecipientAddressContainsWords "contoso.com" -Mode enforce -Confirm:$false
New-TransportRule -name "Rule 2" -RecipientAddressType resolved -RejectMessageEnhancedStatusCode 5.7.1 -RecipientAddressContainsWords "Outlook.com" -Mode enforce -Confirm:$false
Enable-TransportRule "rule 1" -Confirm:$false
Enable-TransportRule "rule 2" -Confirm:$false