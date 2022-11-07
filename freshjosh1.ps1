# Josh's script to install/config a fresh build

# Choco logs in c:\programdata\chocolatey\logs\chocolatey.log


#Installs Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install 7zip
choco install 7zip.install -y

# Install VLC
choco install vlc -y

# Install Putty
choco install putty -y

# Install Filezilla
Choco install Filezilla -y

# Install teamviewer
#choco install teamviewer -y 

# Install RSAT Remote Server Admin Tools
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online

# Install Sysinternals
choco install sysinternals -y

# Install Windows Assessment and Deployment Kit
choco install windows-adk-all -y

# Install VMWare vShpere Player
choco install vmware-workstation-player -y

# Install Wireshark
choco install wireshark -y

# Install nmap
choco install nmap -y

# Install TFTPD
choco install tftpd32 -y

# Install Virustotal Desktop Plugin
choco install virustotaluploader -y

# Install googlechrome
choco install googlechrome -y

#  Install firefox
choco install firefox -y

# Install Brave
choco install brave -y

# Install Java
#choco install javaruntime -y

# Install Flash
#choco install flashplayerplugin -y

# Install Adobe Reader
#choco install adobereader -y

# Install Notepad ++
choco install notepadplusplus -y

# Install VS Code
#choco install vscode -y

# Install WinSCP
choco install winscp -y

# Install Git
choco install git.install -y

# Install Github Desktop
#choco install github-desktop -y

# Install Chocolatey GUI
choco install chocolateygui -y

# Install Treesize (free)
choco install treesizefree -y

# Install Rufus
choco install rufus -y

# Install Imgburn
#choco install imgburn -y

# Install Windows System Control Center
choco install windowssystemcontrolcenter -y 

# Install Windows Admin Center - need Winget/Win 11
winget install -e --id Microsoft.WindowsAdminCenter


# Dameware?

# Set PS Execution Policy
Set-ExecutionPolicy RemoteSigned

# Kace

# Install RSAT off the Internet
$Install = Get-WindowsCapability -Online | Where-Object {$_.Name -like "Rsat*" -AND $_.State -eq "NotPresent"}

$Install | ForEach-Object {
$RSATName = $_.Name
Add-WindowsCapability -Online -Name $RsatName
}