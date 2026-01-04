# Tweaks

Some quick Windows tweaks/commands.

Notes:
- Many of these require an elevated terminal (Run as Administrator).
- Registry changes can reduce security and/or cause instability. - Obviously.
- If you don't know what the fuck you are reading then maybe don't use it or at least ask chatgpt idfk.

## 1) Disable speculation mitigations (registry)

Run in `cmd`:

```cmd
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" ^
  /v FeatureSettingsOverride /t REG_DWORD /d 3 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" ^
  /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
```

## 2) Check whether mitigations are off

Run in ```PowerShell```:

```powershell
Install-Module SpeculationControl -Scope CurrentUser
Import-Module SpeculationControl
Get-SpeculationControlSettings
```

## 3) Disable search box suggestions

Machine-wide (all users), run in `cmd`:

```cmd
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" ^
  /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
```

## 4) Ultimate Performance + no sleep/hibernate

Run in ```PowerShell```:

```powershell
$ErrorActionPreference = 'SilentlyContinue'

$ultimateLine = (powercfg /l | Select-String -SimpleMatch 'Ultimate Performance' | Select-Object -First 1).Line
if (-not $ultimateLine) {
  $ultimateLine = (powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 | Select-Object -First 1)
}

$guid = [regex]::Match($ultimateLine, '[0-9a-fA-F-]{36}').Value
if ($guid) { powercfg /setactive $guid } else { powercfg /setactive SCHEME_MIN }

powercfg /hibernate off
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 0
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0
powercfg -change -hibernate-timeout-ac 0
powercfg -change -hibernate-timeout-dc 0
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg /setactive SCHEME_CURRENT
```

## 5) Win32 priority separation + disable power throttling (registry)

Run in `cmd`:

```cmd
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" ^
  /v Win32PrioritySeparation /t REG_DWORD /d 38 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" ^
  /v PowerThrottlingOff /t REG_DWORD /d 1 /f
```

## 6) Power settings 

Run in PowerShell:

```powershell
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
```
