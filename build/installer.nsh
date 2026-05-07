; Swift Speak — NSIS customization
;
; On install, detect any prior "Swift Type" 1.x install (appId
; com.getnoodling.swifttype) and silently uninstall it before placing
; Swift Speak 2.0. Without this, the user would have two tray apps and two
; Start Menu entries for what is effectively the same product.

!macro customInit
  ReadRegStr $R0 HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\com.getnoodling.swifttype" "UninstallString"
  ${If} $R0 != ""
    DetailPrint "Removing previous Swift Type install..."
    ExecWait '$R0 /S _?=$INSTDIR'
  ${EndIf}

  ReadRegStr $R1 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\com.getnoodling.swifttype" "UninstallString"
  ${If} $R1 != ""
    DetailPrint "Removing previous Swift Type install (per-machine)..."
    ExecWait '$R1 /S _?=$INSTDIR'
  ${EndIf}
!macroend
