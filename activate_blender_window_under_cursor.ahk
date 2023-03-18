;----------------------general startup options for scripts--------------------------------
#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%

;-----------------------the script starts here -------------------------------------------
SetTimer, WatchCursor, 200
return

WatchCursor:

    If GetKeyState("alt")                               ; a fix to prevent windows taskswitcher from disapperaing , its kotkey is alt+tabso as long as alt is held down this script will return	
        return		
    If GetKeyState("LButton", "P")                      ; same fix for dragging a window over a blender window and it disappearing behind it
        return

    WinGet, active_exe, ProcessName, A                  ; get ProcessName from active window 
    
    if ( active_exe == "blender.exe"){                  ; if blender.exe , else do nothing        
        
        WinGet, active_pid, PID, A                      ; get ProcessID from active window

        MouseGetPos, , , WindowID 			            ; get window hwnd under mouse cursor
        WinGet, underMouse_pid, PID, ahk_id %WindowID%  ; get ProcessID from window under mouse cursor

        ;ToolTip %active_exe%     %PID2%                ; ToolTip for quick debugging

        if ( active_pid==underMouse_pid){               ; if processID is the same, else do nothing
            WinActivate, ahk_id %WindowID%              ; activate window under cursor
        }
    }