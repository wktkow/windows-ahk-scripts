#Requires AutoHotkey v2.0

#SingleInstance Force

; Hotkeys won't work while an elevated (Admin) window is focused unless this script
; is also running elevated (Windows UIPI / integrity levels).
if !A_IsAdmin
{
    try
    {
        if A_IsCompiled
            Run '*RunAs "' A_ScriptFullPath '"'
        else
            Run '*RunAs "' A_AhkPath '" "' A_ScriptFullPath '"'
    }
    catch
    {
        MsgBox "Run this script as Administrator if you want hotkeys to work inside Admin windows."
    }
    ExitApp
}

; --- Win+Q => Alt+F4 (close window) ---
#q::Send "!{F4}"

; --- Disable Start menu on bare Win press, but keep Win as modifier ---
~LWin::Send "{Blind}{vkE8}"
~RWin::Send "{Blind}{vkE8}"

; --- Left pure Alt => Start menu (Ctrl+Esc), without breaking Alt+Tab ---
~*LAlt up::
{
    ; Only if Alt was pressed and released without any other key
    if (A_PriorKey = "LAlt")
        Send "^{Esc}"
}

; --- Win+F => open File Explorer ---
#f::
{
    RunAndActivateNewWindow("explorer.exe", "ahk_class CabinetWClass")
}

; --- Win+B => open Google Chrome ---
#b::
{
    RunAndActivateNewWindow("chrome.exe", "ahk_exe chrome.exe") ; if needed, replace with full path to chrome.exe
}

; --- Win+Ctrl+Right => snap window to right (Win+Right) ---
^#Right::Send "#{Right}"

; --- Win+Ctrl+Left => snap window to left (Win+Left) ---
^#Left::Send "#{Left}"

; --- Win+M => maximize active window (normal maximize, not fullscreen) ---
#m::
{
    WinMaximize "A"
}

; --- Win+N => minimize active window ---
#n::
{
    WinMinimize "A"
}

; --- Win+T => open Windows Terminal (tabbed wt.exe) ---
#t::Run "wt.exe"        ; if this fails, point it to the full path of wt.exe

; --- Swap CapsLock and Esc ---
$CapsLock::Esc
$Esc::CapsLock

RunAndActivateNewWindow(runTarget, winCriteria, timeoutMs := 2000)
{
    before := WinGetList(winCriteria)
    beforeSeen := Map()
    for hwnd in before
        beforeSeen[hwnd] := true

    Run runTarget

    deadline := A_TickCount + timeoutMs
    lastList := before
    while (A_TickCount < deadline)
    {
        lastList := WinGetList(winCriteria)
        for hwnd in lastList
        {
            if !beforeSeen.Has(hwnd)
            {
                WinActivate "ahk_id " hwnd
                WinWaitActive("ahk_id " hwnd, , 1)
                return hwnd
            }
        }
        Sleep 50
    }

    if (lastList.Length)
    {
        WinActivate "ahk_id " lastList[1]
        WinWaitActive("ahk_id " lastList[1], , 1)
        return lastList[1]
    }

    return 0
}
