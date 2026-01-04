# Software

Quick setup notes for a new Windows install.

Notes:
- Run in elevated terminal (Run as Administrator).
- Commands are grouped by purpose.

## 1) Install Chocolatey

[Install Chocolatey first (then use it for the package installs below).](https://chocolatey.org/install)

## 2) Install apps (Chocolatey)

Run in ```PowerShell``` (or `cmd`):

```powershell
choco install wget sublimetext3 openvpn signal k-litecodecpackfull spotify nodejs 7zip python3 vcredist140 curl
```

## 3) Install WSL (Ubuntu 24.04)

Run in ```PowerShell```:

```powershell
 wsl --install -d Ubuntu-24.04
```

## 4) Install VS Code Remote - WSL extension

Run in ```PowerShell```:

```powershell
code --install-extension ms-vscode-remote.remote-wsl
```

## 5) Fix Windows Terminal WSL "empty window" bug

Edits Windows Terminal settings to set `compatibility.allowHeadless = false`.

Run in ```PowerShell```:

```powershell
$path="$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"; $json=Get-Content -Path $path -Raw | ConvertFrom-Json; if(-not $json.compatibility){$json | Add-Member -MemberType NoteProperty -Name compatibility -Value ([pscustomobject]@{allowHeadless=$false})} else {$json.compatibility.allowHeadless=$false}; $json | ConvertTo-Json -Depth 100 | Set-Content -Encoding utf8 -Path $path
```
