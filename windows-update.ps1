Start-Process powershell -Verb runas

Write-Host "execute windows update"

Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force

# Install-Module -Name PSWindowsUpdate

Get-WindowsUpdate
Install-WindowsUpdate -AcceptAll
