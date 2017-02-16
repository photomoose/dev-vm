$policy = Get-ExecutionPolicy

if($policy -ne "Unrestricted") {
    Write-Error "Set policy to Unrestricted first"
    Exit 1
}

#Reclaim Windows 10
#iwr https://gist.githubusercontent.com/alirobe/7f3b34ad89a159e6daa1/raw/c1b4eed9df6d3084e88c69d465ce8d0355145bce/reclaimWindows10.ps1 | iex

Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-WebServerRole' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-WebServer' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-CommonHttpFeatures' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-HttpErrors' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-HttpRedirect' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ApplicationDevelopment' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-NetFxExtensibility' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-NetFxExtensibility45' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-HealthAndDiagnostics' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-HttpLogging' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-LoggingLibraries' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-RequestMonitor' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-HttpTracing' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-Security' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-URLAuthorization' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-RequestFiltering' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-IPSecurity' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-Performance' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-HttpCompressionDynamic' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-WebServerManagementTools' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ManagementScriptingTools' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-IIS6ManagementCompatibility' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-Metabase' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-HostableWebCore' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-CertProvider' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-WindowsAuthentication' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-DigestAuthentication' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ClientCertificateMappingAuthentication' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-IISCertificateMappingAuthentication' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ODBCLogging' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-StaticContent' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-DefaultDocument' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-DirectoryBrowsing' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-WebSockets' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ApplicationInit' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ASPNET' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ASPNET45' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ASP' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-CGI' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ISAPIExtensions' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ISAPIFilter' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ServerSideIncludes' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-CustomLogging' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-BasicAuthentication' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-HttpCompressionStatic' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ManagementConsole' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-ManagementService' -All
Enable-WindowsOptionalFeature -Online -FeatureName 'IIS-WMICompatibility' -All


iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
choco feature enable -n=allowGlobalConfirmation
choco install disableuac -y
choco install googlechrome -y
choco install conemu -y
choco install 7zip -y
choco install poshgit -y
choco install sysinternals -y
choco install sublimetext3 -y
choco install beyondcompare -y
choco install webstorm -y
choco install awscli -y
choco install putty -y
choco install nuget.commandline -y
choco install gitextensions -y
choco install git -y
choco install nvm -y
choco install visualstudiocode -y
choco install p4merge -y
choco install fiddler4 -y
choco install webpi -y
choco install winscp -y

nvm install latest

# Create AppModelUnlock if it doesn't exist, required for enabling Developer Mode
$RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
if (-not(Test-Path -Path $RegistryKeyPath)) {
    New-Item -Path $RegistryKeyPath -ItemType Directory -Force
}

# Enable Developer Mode
New-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1

# Enable Bash for Windows
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux

# Show file extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0

# Disable SmartScreen Filter
Write-Host "Disabling SmartScreen Filter..."
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -Type String -Value "Off"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AppHost" -Name "EnableWebContentEvaluation" -Type DWord -Value 0

# Disable Start Menu suggestions
Write-Host "Disabling Start Menu suggestions..."
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0

# Disable Advertising ID
Write-Host "Disabling Advertising ID..."
If (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Type DWord -Value 0

# Uninstall bloatware
Get-AppxPackage "king.com.CandyCrushSodaSaga" | Remove-AppxPackage
Get-AppxPackage "Microsoft.XboxApp" | Remove-AppxPackage
Get-AppxPackage "Microsoft.MinecraftUWP" | Remove-AppxPackage
Get-AppxPackage "flaregamesGmbH.RoyalRevolt2" | Remove-AppxPackage
Get-AppxPackage "0D16BB98.Houzz" | Remove-AppxPackage
Get-AppxPackage "Facebook.Facebook" | Remove-AppxPackage
