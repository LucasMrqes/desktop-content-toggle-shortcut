SetTitleMatchMode 2
#SingleInstance ignore
#NoTrayIcon

; Run script on windows startup
SplitPath, A_Scriptname, , , , OutNameNoExt
LinkFile=%A_StartupCommon%\%OutNameNoExt%.lnk
IfNotExist, %LinkFile%
  FileCreateShortcut, %A_ScriptFullPath%, %LinkFile%
SetWorkingDir, %A_ScriptDir%

; Shortcut CTRL+SHIFT+D
^+D::
	ControlGet, HWND, Hwnd,, SysListView321, ahk_class WorkerW
	; Toggle between icons & taskbar hidden & shown
	If DllCall("IsWindowVisible", UInt, HWND) {
		WinHide, ahk_id %HWND%
        WinHide ahk_class Shell_TrayWnd
    }
	Else {
		WinShow, ahk_id %HWND%
        WinShow ahk_class Shell_TrayWnd
    }