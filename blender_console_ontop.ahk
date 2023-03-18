;----------------------general startup options for scripts--------------------------------
#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

;-----------------------the script starts here -------------------------------------------
; this dll call fires a message whenever a window is opened or restored.
; No need for looping through windows every 0,5 seconds or crap like that. 
; use it whenever you wanna do something to a newly opened window
DllCall( "RegisterShellHookWindow", UInt,A_ScriptHwnd )
MsgNum := DllCall( "RegisterWindowMessage", Str,"SHELLHOOK" )
OnMessage( MsgNum, "ShellMessage" )
Return 

ShellMessage(wParam, lParam) {
    WinGet, new_PID, PID, ahk_id %lParam%           ; get PID of the new window
    WinGet, new_exe, ProcessName, ahk_id %lParam%   ; get Processname of the PID
    WinGetClass, new_Class, ahk_id %lParam%         ;get the class of the new window
    ;ToolTip %new_Class% %new_PID% %new_exe%
    if (new_exe == "blender.exe" && new_Class == "ConsoleWindowClass"){
        WinSet, AlwaysOnTop, On, ahk_id %lParam%    ; Set the window to always be on top
    }
}

