; Swift Speak — NSIS customization
;
; On install, silently remove any prior install of the same product before
; placing the new version. We check two appIds:
;   com.getnoodling.swifttype   — Swift Type 1.x (product rename in 2.0)
;   com.getnoodling.swiftspeak  — Swift Speak 2.x (same-product upgrades)
; Without this, installing over an existing copy leaves two Add/Remove
; Programs entries for what is effectively the same product.

!macro customInit
  ; Remove Swift Type 1.x (per-user)
  ReadRegStr $R0 HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\com.getnoodling.swifttype" "UninstallString"
  ${If} $R0 != ""
    DetailPrint "Removing previous Swift Type install..."
    ExecWait '$R0 /S _?=$INSTDIR'
  ${EndIf}

  ; Remove Swift Type 1.x (per-machine)
  ReadRegStr $R1 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\com.getnoodling.swifttype" "UninstallString"
  ${If} $R1 != ""
    DetailPrint "Removing previous Swift Type install (per-machine)..."
    ExecWait '$R1 /S _?=$INSTDIR'
  ${EndIf}

  ; Remove Swift Speak 2.x (per-user)
  ReadRegStr $R2 HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\com.getnoodling.swiftspeak" "UninstallString"
  ${If} $R2 != ""
    DetailPrint "Removing previous Swift Speak install..."
    ExecWait '$R2 /S _?=$INSTDIR'
  ${EndIf}

  ; Remove Swift Speak 2.x (per-machine)
  ReadRegStr $R3 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\com.getnoodling.swiftspeak" "UninstallString"
  ${If} $R3 != ""
    DetailPrint "Removing previous Swift Speak install (per-machine)..."
    ExecWait '$R3 /S _?=$INSTDIR'
  ${EndIf}
!macroend
