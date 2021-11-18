#Persistent
; This is for all other windows ; source : https://www.autohotkey.com/boards/viewtopic.php?t=82639
SetActiveWindowTracking(Track:=True, Delay:=0, ToTop:=False) {
      ; SPI_SETACTIVEWINDOWTRACKING = 0x1001
      ; SPI_SETACTIVEWNDTRKZORDER   = 0x100D
      ; SPI_SETACTIVEWNDTRKTIMEOUT  = 0x2003
      Static SPI := "SystemParametersInfo"
      
      DllCall(SPI, "UInt", 0x1001, "UInt", 0, "Ptr", Track, "UInt", False)
      DllCall(SPI, "UInt", 0x100D, "UInt", 0, "Ptr", ToTop, "UInt", False)
      DllCall(SPI, "UInt", 0x2003, "UInt", 0, "Ptr", Delay, "UInt", False)
}
SetActiveWindowTracking(True)


;blender specific part starts here

SetTimer, WatchCursor, 200
return

WatchCursor:

    MouseGetPos, , , WindowID 			; get window hwnd under mouse cursor
    WinGet, ahk_exe, ProcessName, ahk_id %WindowID% ; from window ID get the corresponding exe

    if (ahk_exe == "blender.exe"){
        If GetKeyState("alt")				; a hack to prevent windows taskswitcher from disapperaing , its kotkey is alt+tabso as long as alt is held down this script will return	
		    return		
        If GetKeyState("LButton", "P")      ; same fix for dragging a window over a blender window and it disappearing
            return
        active_hwnd := WinExist("A")        ; get hwnd of active window
        ToolTip %active_hwnd%
        if(active_hwnd != WindowID){        ; if its already activated by windows dont do anything , if not activate window 
            WinActivate, ahk_id %WindowID%  
        }
    }
 ;ToolTip, processname %old_ahk_exe%  ahk_id %old_ahk_id%
return