# Josh's script to install/config a fresh build

# Choco logs in c:\programdata\chocolatey\logs\chocolatey.log


#Installs Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install 7zip
choco install 7zip.install -y

# Install VLC
choco install vlc -y

# Install Putty
choco install putty -y

# Install Filezilla
Choco install Filezilla -y

# Install teamviewer
choco install teamviewer -y 

# Install RSAT Remote Server Admin Tools
choco install rsat -y

# Install Sysinternals
choco install sysinternals -y

# Install Windows Assessment and Deployment Kit
choco install windows-adk-all -y

# Install VMWare vShpere Client
choco install vmwarevsphereclient -y

# Install Wireshark
choco install wireshark -y

# Install nmap
choco install nmap -y

# Install TFTPD
choco install tftpd32 -y

# Install googlechrome
choco install googlechrome -y

#  Install firefox
choco install firefox -y

# Install Brave
choco install brave -y

# Install Java
choco install javaruntime -y

# Install Flash
choco install flashplayerplugin -y

# Install Adobe Reader
choco install adobereader -y

# Install Notepad ++
choco install notepadplusplus -y

# Install VS Code
choco install vscode -y

# Install Git
choco install git.install -y

# Install Chocolatey GUI
choco install chocolateygui -y

# Install Treesize (free)
choco install treesizefree -y

# Install Greenshot
choco install greenshot -y

# Install Rufus
choco install rufus -y

# Install Imgburn
choco install imgburn -y

# Dameware?
# Paul's Inventory Tool?
# Set-ExecutionPolicy RemoteSigned?

# Kace
#copy installer from network share
copy-item -Path \\dcit\SOFTWARE\KACE\ampagent-10.0.113-x86.kace-mgmt.co.douglas.or.us.msi -Destination C:\temp\

# Install Kace Silently
msiexec.exe /I C:\temp\ampagent-10.0.113-x86.kace-mgmt.co.douglas.or.us.msi /q

# Install RSAT off the software share
#Invoke-Command -Computername $software -ScriptBlock {
#    Start-process "\\dcit\SOFTWARE\Microsoft\Windows\Windows10\RSAT\WindowsTH-RSAT_WS_1803-x64.msu" /quiet /norestart
#    }

# Install RSAT off the Internet
$Install = Get-WindowsCapability -Online | Where-Object {$_.Name -like "Rsat*" -AND $_.State -eq "NotPresent"}

$Install | ForEach-Object {
$RSATName = $_.Name
Add-WindowsCapability -Online -Name $RsatName
}