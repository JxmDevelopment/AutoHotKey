if not A_IsAdmin
Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"

#SingleInstance Force
DetectHiddenWindows, On
#MaxThreadsPerHotkey 2
CoordMode, ToolTip, Screen

Home::Reload
End::ExitApp

Insert::
Ttip := !Ttip
While Ttip
{
Tooltip, End                ->                  [ x ]`n`nWINDOWS :`n`nALT + 1 = Desempenho`nALT + 2 = Controle de Conta`nALT + 3 = Windows Defender`nALT + 4 = Firewall`nALT + 5 = Compart. de Rede`nALT + 6 = Xbox Game Bar`nALT + 7 = Aplicativos Padrão`nALT + 8 = Barra de Tarefas`n`nATIVADORES:`n`nWin + 1 = Windows  [CMD]`nWin + 2 = Office 16 [CMD]`n`nCTRL + 1 = Desinstalar Imp.`nCTRL + 2 = Des. Avan. Imp.`nCTRL + 3 = Limp Comp. Imp.`nCTRL + 4 = RcpAuthn + Fix`nCTRL + 5 = ADM System 32`n`nCOMANDOS :`n`n/disp = Dispositivos`n/sis = Sistema`n/p = Painel de Controle`n/reno = Renomear PC`n/temp - Pasta Temp`nSSD = dfrgui`n`nv.1.1.37.1 - By JxM, 0, 0
}
Tooltip
Return

; --> Comandos <--

:*:/disp::+6
:*:/p::+7
:*:/reno::+8
:*:/temp::+9

; --> Desempenho <--

!1::
{
Send, #s
WinWaitActive, ahk_exe SearchApp.exe
Sleep, 1000
Clipboard := "Ajustar a aparência"
Send, ^v
Sleep, 500
Send, {Enter}
Sleep, 500
WinWaitActive, ahk_exe SystemPropertiesPerformance.exe
Sleep, 1000
Send, {Down 3}
Sleep, 500
Send, {Tab}
Sleep, 500
Send, {End}
Sleep, 250
Send, {Space}
Sleep, 250
Send, {Up}
Sleep, 250
Send, {Space}
Sleep, 250
Send, {Up 6}
Sleep, 250
Send, {Space}
Sleep, 250
Send, {Tab 3}
Sleep, 250
Send,{Enter}
Sleep, 1000
Send,{Enter}
Sleep, 2000
; -> Desempenho - Energia <-
Run, %comspec%,, Hide, VarPID
Sleep, 500
ControlSend,, powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c{Enter}, ahk_pid %VarPID%
Sleep, 1000
WinClose, ahk_exe cmd.exe
Sleep, 500
; -> Desligar / Suspender <-
Send, #x
Sleep, 1000
Send, õ{Enter}
WinWaitActive, ahk_exe ApplicationFrameHost.exe
Sleep, 1000
Send, {End}
Sleep, 250
Send, {Tab}
Sleep, 250
Send, {End}
Sleep, 500
WinClose, ahk_exe ApplicationFrameHost.exe
; -> Opções de indexação <-
Send, #s
WinWaitActive, ahk_exe SearchApp.exe
Sleep, 1000
Clipboard := "Opções de indexação"
Send, ^v
Sleep, 500
Send, {Enter}
Sleep, 500
WinWaitActive, ahk_class #32770
Sleep, 1000
Send, {Tab 2}
Sleep, 250
Send,{Enter}
}
Return

; --> Controle De Permissão <--

!2::
{
Send, #s
WinWaitActive, ahk_exe SearchApp.exe
Sleep, 1000
Clipboard := "UAC"
Send, ^v
Sleep, 500
Send, {Enter}
Sleep, 500
WinWaitActive, ahk_exe DllHost.exe
Sleep, 1500
Send, {Tab}
Sleep, 500
Send, {End}
Sleep, 500
Send, {Tab}
Sleep, 500
Send, {Space}
}
Return

; --> Windows Defender <--

!3::
{
Send, #s
WinWaitActive, ahk_exe SearchApp.exe
Sleep, 1000
Clipboard := "proteção contra"
Send, ^v
Sleep, 500
Send, {Enter}
Sleep, 500
WinWaitActive, ahk_exe ApplicationFrameHost.exe
Sleep, 1500
Send, {Tab 4}
Sleep, 500 
Send, {Space}
Sleep, 1000
Send, {Space}
Sleep, 500
Send, {Tab}
Sleep, 500
Send, {Space}
Sleep, 500
Send, {Tab}
Sleep, 500
Send, {Space}
Sleep, 500
Send, {Tab 2}
Sleep, 500
Send, {Space}
Sleep, 2500

;--> Notificação Windows Defender <--

Send, {Tab 4}
Sleep, 2500
Send, {Space}
Sleep, 1500
Send, {Space}
Sleep, 500
Send, {Tab 2}
Sleep, 500
Send, {Space}
Sleep, 500
Send, {Tab}
Sleep, 500
Send, {Space}
}
Return

;--> Firewall <--

!4::
{
Run, %comspec%,, Hide, VarPID
Sleep, 1000
ControlSend,, netsh advfirewall set allprofiles state off{Enter}, ahk_pid %VarPID%
Sleep, 2500
WinClose, ahk_exe cmd.exe
MsgBox,, Aviso !, Firewall Desativado !
}
Return

; --> Compartilhamento <--

!5::
{
Run, *RunAs cmd.exe
WinWaitActive, ahk_exe cmd.exe
Sleep, 1000
SendInput, netsh advfirewall firewall set rule group="Descoberta de Rede" new enable=yes{Enter}
Sleep, 1000
SendInput, netsh advfirewall firewall set rule group="Compartilhamento de Arquivo e Impressora" new enable=yes{Enter}
Sleep, 2500
WinClose, ahk_exe cmd.exe
Sleep, 1000
Run, shell:::{8E908FC9-BECC-40f6-915B-F4CA0E70D03D}\Advanced
WinWaitActive, ahk_class CabinetWClass
Sleep, 1000
Send, {Up}
Sleep, 250
Send, {Space}
Sleep, 500
Send, {Down}
Sleep, 250
Send, {Up}
Sleep, 250
Send, {Tab 3}
Sleep, 250
Send, {Down}
}
Return

;--> Xbox Game Bar <--

!6::
{
Send, #s
WinWaitActive, ahk_exe SearchApp.exe
Sleep, 1000
Clipboard := "Ativar a"
Send, ^v
Sleep, 500
Send, {Enter}
Sleep, 500
WinWaitActive, ahk_exe ApplicationFrameHost.exe
Sleep, 1000
Send, {Tab 2}
Sleep, 500
Send, {Space}
Sleep, 500
Send, {Tab}
Sleep, 500
Send, {Space}
Sleep, 500
Send, !{F4}
Sleep, 1000
Send, #s ; Desativa 2° Opção
WinWaitActive, ahk_exe SearchApp.exe
Sleep, 1000
Send, ^v
Sleep, 500
Send, {Enter}
Sleep, 500
WinWaitActive, ahk_exe ApplicationFrameHost.exe
Sleep, 1000
Send, {Tab}
Sleep, 500
Send, {Down 2}
Sleep, 500
Send,{Enter}
Sleep, 500
Send, {Tab}
Sleep, 500
Send, {Space}
}
Return

; --> Aplicativos Padrão <--

!7::
{
Run, shell:::{2559a1f7-21d7-11d4-bdaf-00c04f60b9f0}
WinWaitActive, ahk_class ApplicationFrameWindow
Sleep, 1000
Send, {PgDn}
}
Return

;--> Configurações da Barra de Tarefas <--

!8::
{
Run, shell:::{0DF44EAA-FF21-4412-828E-260A8728E7F1}
WinWaitActive, ahk_exe ApplicationFrameHost.exe
Sleep, 1000
Send, {Tab 2}
Send, {PgDn}
}
Return


;--> Ativador Windows - CMD <--

#1::
{
Run, %comspec%,, Hide, VarPID
Sleep, 500
Text := "Escolha a Versão Desejada:"
Result := MsgBoxEx(Text, "TRM Activate - By JxM", "Professional|Professional N|Enterprise|Enterprise N", [8, "imageres.dll"], "", "MinimizeBox", 0, 0, "s18 italic c0x000000", "", "0xFFFFFF")
If (Result == "Professional")
{
ControlSend,, slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX{Enter}, ahk_pid %VarPID%
}
If (Result == "Professional N")
{
ControlSend,, slmgr /ipk MH37W-N47XK-V7XM9-C7227-GCQG9{Enter}, ahk_pid %VarPID%
}
Else If (Result == "Enterprise")
{
ControlSend,, slmgr /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43{Enter}, ahk_pid %VarPID%
}
Else If (Result == "Enterprise N")
{
ControlSend,, slmgr /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4{Enter}, ahk_pid %VarPID%
}
Else If (Result == "Cancel")
{
WinClose, ahk_exe cmd.exe
Return
}
MsgBoxEx(Text, Title := "", Buttons := "", Icon := "", ByRef CheckText := "", Styles := "", Owner := "", Timeout := "", FontOptions := "", FontName := "", BGColor := "", Callback := "") {
    Static hWnd, y2, p, px, pw, c, cw, cy, ch, f, o, gL, hBtn, lb, DHW, ww, Off, k, v, RetVal
    Static Sound := {2: "*48", 4: "*16", 5: "*64"}

    Gui New, hWndhWnd LabelMsgBoxEx -0xA0000
    Gui % (Owner) ? "+Owner" . Owner : ""
    Gui Font
    Gui Font, % (FontOptions) ? FontOptions : "s9", % (FontName) ? FontName : "Segoe UI"
    Gui Color, % (BGColor) ? BGColor : "White"
    Gui Margin, 10, 12

    If (IsObject(Icon)) {
        Gui Add, Picture, % "x20 y24 w32 h32 Icon" . Icon[1], % (Icon[2] != "") ? Icon[2] : "shell32.dll"
    } Else If (Icon + 0) {
        Gui Add, Picture, x20 y24 Icon%Icon% w32 h32, user32.dll
        SoundPlay % Sound[Icon]
    }

    Gui Add, Link, % "x" . (Icon ? 65 : 20) . " y" . (InStr(Text, "`n") ? 24 : 32) . " vc", %Text%
    GuicontrolGet c, Pos
    GuiControl Move, c, % "w" . (cw + 30)
    y2 := (cy + ch < 52) ? 90 : cy + ch + 34

    Gui Add, Text, vf -Background ; Footer

    Gui Font
    Gui Font, s9, Segoe UI
    px := 42
    If (CheckText != "") {
        CheckText := StrReplace(CheckText, "*",, ErrorLevel)
        Gui Add, CheckBox, vCheckText x12 y%y2% h26 -Wrap -Background AltSubmit Checked%ErrorLevel%, %CheckText%
        GuicontrolGet p, Pos, CheckText
        px := px + pw + 10
    }

    o := {}
    Loop Parse, Buttons, |, *
    {
        gL := (Callback != "" && InStr(A_LoopField, "...")) ? Callback : "MsgBoxExBUTTON"
        Gui Add, Button, hWndhBtn g%gL% x%px% w90 y%y2% h26 -Wrap, %A_Loopfield%
        lb := hBtn
        o[hBtn] := px
        px += 98
    }
    GuiControl +Default, % (RegExMatch(Buttons, "([^\*\|]*)\*", Match)) ? Match1 : StrSplit(Buttons, "|")[1]

    Gui Show, Autosize Center Hide, %Title%
    DHW := A_DetectHiddenWindows
    DetectHiddenWindows On
    WinGetPos,,, ww,, ahk_id %hWnd%
    GuiControlGet p, Pos, %lb% ; Last button
    Off := ww - (((px + pw + 14) * A_ScreenDPI) // 96)
    For k, v in o {
        GuiControl Move, %k%, % "x" . (v + Off)
    }
    Guicontrol MoveDraw, f, % "x-1 y" . (y2 - 10) . " w" . ww . " h" . 48

    Gui Show
    Gui +SysMenu %Styles%
    DetectHiddenWindows %DHW%

    If (Timeout) {
        SetTimer MsgBoxExTIMEOUT, % Round(Timeout) * 1000
    }

    If (Owner) {
        WinSet Disable,, ahk_id %Owner%
    }

    GuiControl Focus, f
    Gui Font
    WinWaitClose ahk_id %hWnd%
    Return RetVal

    MsgBoxExESCAPE:
    MsgBoxExCLOSE:
    MsgBoxExTIMEOUT:
    MsgBoxExBUTTON:
        SetTimer MsgBoxExTIMEOUT, Delete

        If (A_ThisLabel == "MsgBoxExBUTTON") {
            RetVal := StrReplace(A_GuiControl, "&")
        } Else {
            RetVal := (A_ThisLabel == "MsgBoxExTIMEOUT") ? "Timeout" : "Cancel"
        }

        If (Owner) {
            WinSet Enable,, ahk_id %Owner%
        }

        Gui Submit
        Gui %hWnd%: Destroy
    Return
}
WinWaitActive, ahk_exe WScript.exe
Send,{Enter}
Sleep, 1000
ControlSend,, slmgr /skms kms8.msguides.com{Enter}, ahk_pid %VarPID%
WinWaitActive, ahk_exe WScript.exe
Send,{Enter}
Sleep, 1000
ControlSend,, slmgr /ato{Enter}, ahk_pid %VarPID%
Sleep, 10000
WinClose, ahk_exe cmd.exe
}
Return

;--> Ativador Office - CMD <--

#2::
{
Run, %comspec%,, Hide, VarPID
Sleep, 500
Clipboard := "cd /d %ProgramFiles(x86)%\Microsoft Office\Office16"
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 1000
Clipboard := "for /f %x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:..\root\Licenses16\%x"
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 5000
Clipboard := "cscript ospp.vbs /sethst:e8.us.to"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /unpkey:BTDRB >nul"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /unpkey:KHGM9 >nul"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /unpkey:CPQVG >nul"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 1000
Clipboard := "cscript ospp.vbs /sethst:e8.us.to"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /setprt:1688"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 500
Clipboard := "cscript ospp.vbs /act"
Sleep, 500
ControlSend,, ^v{Enter}, ahk_pid %VarPID%
Sleep, 8000
WinClose, ahk_exe cmd.exe
MsgBox,,JxM, Concluido !
}
Return

;--> Desinstalar Impressora <--

^1::
{
Run *RunAs cmd.exe
WinWaitActive, ahk_exe cmd.exe
Sleep, 1000
SendInput, wmic printer get name{Enter}
Sleep, 1000
SendInput, printui.exe /dl /n ""
}
Return

;--> Desinstalar Impressora [ Avançada ] <--

^2::
{
Run *RunAs cmd.exe
WinWaitActive, ahk_exe cmd.exe
Sleep, 1000
; -> REGISTROS <-
SendInput, REG DELETE "HKCU\Printers\ConvertUserDevModesCount" /va /f{Enter}
Sleep, 1000
; -> DRIVERS <-
SendInput, REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Drivers\Version-3" /va /f{Enter}
Sleep, 1000
; -> VERIFICAR NOME DA IMPRESSORA <-
SendInput, wmic printer get name{Enter}
Sleep, 1000
; -> REMOVER IMPRESSORA <-
SendInput, printui.exe /dl /n ""
}
Return

;--> Desinstalar Todas Impressoras [ Completa ] <--

^3::
{
Run *RunAs cmd.exe
WinWaitActive, ahk_exe cmd.exe
Sleep, 1000
; -> DRIVERS <-
SendInput, REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Print\Environments\Windows x64\Drivers\Version-3" /f{Enter}
Sleep, 1000
; -> REGISTROS <-
SendInput, REG DELETE "HKCU\Printers\ConvertUserDevModesCount" /f{Enter}
Sleep, 1000
SendInput, REG DELETE "HKCU\Printers\Settings" /f{Enter}
Sleep, 1000
SendInput, REG DELETE "HKLM\SYSTEM\ControlSet001\Control\Print\Environments\Windows x64\Drivers\Version-3" /f{Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\.DEFAULT\Printers\ConvertUserDevModesCount" /f{Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\.DEFAULT\Printers\DevModePerUser" /f{Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\S-1-5-19\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Devices" /f{Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\S-1-5-19\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PrinterPorts" /f{Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Devices" /f{Enter}
Sleep, 1000
SendInput, REG DELETE "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PrinterPorts" /f{Enter}
Sleep, 1000
; -> VERIFICAR NOME DA IMPRESSORA <-
SendInput, wmic printer get name{Enter}
Sleep, 1000
; -> REMOVER IMPRESSORA <-
SendInput, printui.exe /dl /n ""
}
Return

;--> Adicionar RcpAuthn + Fix - Regedit <--

^4::
{
Run *RunAs cmd.exe
WinWaitActive, ahk_exe cmd.exe
Sleep, 1000
SendInput, REG ADD HKLM\SYSTEM\CurrentControlSet\Policies\Microsoft\FeatureManagement\Overrides /v 713073804 /t REG_DWORD /d 0{Enter}
Sleep, 500
SendInput, REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Print /v RcpAuthnLevelPrivacyEnabled /t REG_DWORD /d 0{Enter}
Sleep, 1500
WinClose, ahk_exe cmd.exe
}
Return

;--> ADM System 32 <--

^5::
{
Run, C:\Windows\System32\spool
WinWaitActive, ahk_exe Explorer.EXE
Sleep, 1000
Send, {Down}
Sleep, 500
Send, {AppsKey} ; Clique RButton - Abre o Menu de Contexto
Sleep, 500
Send {Up}
Sleep, 500
Send,{Enter}
Sleep, 500
WinWaitActive, ahk_class #32770
Sleep, 1000
Send {Tab 5}
Sleep, 500
Send, {Right 2}
Sleep, 500
Send, {Tab 1}
;Send, {Tab 10} - ALGUNS SÃO 10
Sleep, 500
WinWaitActive, ahk_class #32770
Sleep, 1000
Send,{Enter}
Sleep, 500
Send, {Tab}
Sleep, 500
Send,{Enter}
Sleep, 500
Send, {Space}
Sleep, 500
Send, {Tab}
Sleep, 500
Send,{Enter}	
Sleep, 500
Send, {Tab 4}
Sleep, 500
Send,{Enter}
Sleep, 500
Send, RE
Sleep, 500
Send,{Enter}
Sleep, 500
Send, {Tab 3}
Sleep, 500
Send,{Enter}
Sleep, 500
Send, {Tab 4}
Sleep, 500
Send, {Space}
Sleep, 500
Send,{Enter}
}
Return

;--> Dispositivos - /disp <--

+6::
{
Run, shell:::{A8A91A66-3A7D-4424-8D24-04E180695C7A}
}
Return

;--> Painel de Controle - /p <--

+7::
{
Run, shell:::{26EE0668-A00A-44D7-9371-BEB064C98683}
}
Return

;--> Sistema - /reno <--

+8::
{
Send, #r
WinWaitActive, ahk_class #32770
Sleep, 500
Clipboard := "sysdm.cpl"
Send, ^v{Enter}
WinWaitActive, ahk_exe SystemPropertiesComputerName.exe
Sleep, 1000
Send, {Tab 2}
Sleep, 500
Send,{Enter}
}
Return

; --> TEMP - /temp

+9::
{
Run, %A_Temp%
}
Return