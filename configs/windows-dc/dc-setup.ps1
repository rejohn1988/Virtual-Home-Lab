# Windows Server 2019 Domain Controller Setup for ESXi Lab
# Author: rejohn1988

param(
    [string]$IPAddress = "192.168.40.10",
    [string]$Gateway = "192.168.40.1",
    [string]$DomainName = "homelab.local"
)

Write-Host "Setting up Domain Controller for ESXi Lab..." -ForegroundColor Green

# Check if running as Administrator
if (-NOT ([Security.Principal.WindowsPrincipal] 
[Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 
"Administrator")) {
    Write-Error "This script must be run as Administrator!"
    exit 1
}

# Rename Computer
Rename-Computer -NewName "LAB-DC01" -Force

# Configure Network
$adapter = Get-NetAdapter | Where-Object {$_.Status -eq "Up"}
New-NetIPAddress -InterfaceAlias $adapter.Name -IPAddress $IPAddress -PrefixLength 24 -DefaultGateway $Gateway
Set-DnsClientServerAddress -InterfaceAlias $adapter.Name -ServerAddresses "127.0.0.1", "8.8.8.8"

# Install AD DS
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Create Forest
$safeModePassword = ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force
Install-ADDSForest `
    -DomainName $DomainName `
    -DomainNetbiosName "HOMELAB" `
    -SafeModeAdministratorPassword $safeModePassword `
    -InstallDns `
    -Force

Write-Host "Domain Controller setup complete. Reboot required." -ForegroundColor Yellow
