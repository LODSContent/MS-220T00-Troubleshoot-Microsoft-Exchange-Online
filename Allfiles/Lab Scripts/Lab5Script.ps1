install-packageprovider NuGet -Force
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module -Name ExchangeOnlineManagement -Force
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
Import-Module ExchangeOnlineManagement -Force
Connect-ExchangeOnline
Start-Sleep -Seconds 5
New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Office\16.0\Common\Identity' -Name 'EnableADAL' -PropertyType 'DWORD' -Value 0 -Force
Start-Sleep -Seconds 5
New-AuthenticationPolicy -name 'Remote User Policy'
Start-Sleep -Seconds 5
Set-User -Identity 'AllanD' -AuthenticationPolicy 'Remote User Policy' -Confirm:$false
Start-Sleep -Seconds 5
Set-OrganizationConfig -DefaultAuthenticationPolicy "Remote User Policy" -Confirm:$False