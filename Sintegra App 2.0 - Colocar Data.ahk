#SingleInstance Force

if not A_IsAdmin
Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"

Text := "Oque Deseja Fazer ?"

Result := MsgBoxEx(Text, "Sintegra App - By JxM", "Sintegra|Relatórios", [307, "imageres.dll"], "", "", 0, 0, "s15 italic c0x000000", "", "0xFF8000")

If (Result == "Sintegra")
{
Send, ^9
}
Else If (Result == "Relatórios")
{
Send, ^0
}
Else
{
ExitApp
}
Return

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

^9::
{
WinActivate, ahk_exe GDOOR.exe
Sleep, 1000
CoordMode, Pixel, Window
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\fis.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
Loop
{
WinActivate, ahk_exe GFiscal.exe
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\sint.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 800
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\a.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\b.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\c.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\d.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\e.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\f.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\g.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\nor.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\h.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\i.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 400
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\j.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1000
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\k.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\sin\ok.png
}
Until, !ErrorLevel
WinClose, ahk_exe GFiscal.exe
Sleep, 500
WinClose, ahk_exe GFiscal.exe
}
Sleep, 500
MsgBox, 4, Continuação..., Deseja Gerar Os Relatórios ?!
IfMsgBox Yes
{
    Send ^0
}
else
{
    ExitApp
}
Return

^0::
{
WinActivate, ahk_exe GDOOR.exe
Sleep, 1000
InputBox, MES, OBS: 01 a 12, Insira o Mês:, , 180, 150
if ErrorLevel
{
    MsgBox,, AVISO:, Você Cancelou !
    ExitApp
    Return
}
Sleep, 500
InputBox, DIA, OBS: 01 a 31, Insira o Última Dia:, , 180, 150
if ErrorLevel
{
    MsgBox,, AVISO:, Você Cancelou !
    ExitApp
    Return
}
Sleep, 500
InputBox, NOME, v.1.1 - By: Jardel, Nome Da Pasta:, , 180, 150
if ErrorLevel
{
    MsgBox,, AVISO:, Você Cancelou !
    ExitApp
    Return
}
Else
Sleep, 250
IfNotExist, %A_Desktop%\Sintegra\2023
Sleep, 250
FileCreateDir, %A_Desktop%\Sintegra\2023
Sleep, 250
IfNotExist, %A_Desktop%\Sintegra\2023\%NOME%
Sleep, 250
FileCreateDir, %A_Desktop%\Sintegra\2023\%NOME%
Sleep, 250
CoordMode, Pixel, Window
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\rel.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Loop
{
WinActivate, ahk_exe Relatorios.exe
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500

; -> TOTAIS

ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\tot.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1000
Send, {Right}
Sleep, 500
Send, %MES% ; MES - INICIO
Sleep, 500
Send, {Tab 5}
Sleep, 500
Send, {Right}
Sleep, 500
Send, %MES% ; MES - FINAL
Sleep, 500
Send, {Left}
Sleep, 500
Send, %DIA% ; DIA - FINAL
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\grel.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 1000
IfWinExist, Informação
{
Send, {Enter}
}
Else
{
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\ok.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\1.png
}
Until, !ErrorLevel
Send, ^s
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\sv.png
}
Until, !ErrorLevel
Sleep, 1500
SendInput, Totais
Sleep, 500
Send, ^l
Sleep, 500
SendInput, Desktop\Sintegra\2023\%NOME%{Enter}
Sleep, 500
Send, {Enter 3}
Sleep, 1000
IfWinExist, Confirmar Salvar como
{
Send,{Left}{Enter}
}
Loop
{
IfWinExist, ahk_class TRavePreviewForm
Sleep, 250
Winclose, ahk_class TRavePreviewForm
}
Until, !ErrorLevel
Sleep, 500
}

; -> RESUMO

ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\res.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1000
Send, %MES% ; MES - INICIO
Sleep, 500
Send, {Tab 6}
Sleep, 500
Send, {Right}
Sleep, 500
Send, %MES% ; MES - FINAL
Sleep, 500
Send, {Left}
Sleep, 500
Send, %DIA% ; DIA - FINAL
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\grel.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 1000
IfWinExist, Informação
{
Send, {Enter}
}
Else
{
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\ok.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\2.png
}
Until, !ErrorLevel
Send, ^s
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\sv.png
}
Until, !ErrorLevel
Sleep, 500
SendInput, Resumo
Sleep, 500
Send, ^l
Sleep, 500
SendInput, Desktop\Sintegra\2023\%NOME%{Enter}
Sleep, 500
Send, {Enter 3}
Sleep, 1000
IfWinExist, Confirmar Salvar como
{
Send,{Left}{Enter}
}
Loop
{
IfWinExist, ahk_class TRavePreviewForm
Sleep, 250
Winclose, ahk_class TRavePreviewForm
}
Until, !ErrorLevel
Sleep, 500
}

; -> CFOP e Modelo

ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
Send, {Up}
Sleep, 500
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\cf.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 1000
Send, %MES% ; MES - INICIO
Sleep, 500
Send, {Tab 6}
Sleep, 500
Send, {Right}
Sleep, 500
Send, %MES% ; MES - FINAL
Sleep, 500
Send, {Left}
Sleep, 500
Send, %DIA% ; DIA - FINAL
Sleep, 500
Send, {Tab 2}{Down}
Sleep, 1000
Send, {Tab 2}{Space}
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\grel.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 1000
IfWinExist, Informação
{
Send, {Enter}
}
Else
{
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\ok.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\3.png
}
Until, !ErrorLevel
Send, ^s
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\sv.png
}
Until, !ErrorLevel
Sleep, 500
SendInput, CFOP e Modelo
Sleep, 500
Send, ^l
Sleep, 500
SendInput, Desktop\Sintegra\2023\%NOME%{Enter}
Sleep, 500
Send, {Enter 3}
Sleep, 1000
IfWinExist, Confirmar Salvar como
{
Send,{Left}{Enter}
}
Loop
{
IfWinExist, ahk_class TRavePreviewForm
Sleep, 250
Winclose, ahk_class TRavePreviewForm
}
Until, !ErrorLevel
Sleep, 500
}

; -> CANCELADOS <-

ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\vend.png
If ErrorLevel = 0
Click, %X%, %Y%, L
Sleep, 500
Send, {Enter}
Sleep, 1000
Send, %MES% ; MES - INICIO
Sleep, 500
Send, {Tab 7}
Sleep, 500
Send, {Right}
Sleep, 500
Send, %MES% ; MES - FINAL
Sleep, 500
Send, {Left}
Sleep, 500
Send, %DIA% ; DIA - FINAL
Sleep, 500
Send, {Tab 3}{Down}
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\grel.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 1000
IfWinExist, Informação
{
Send, {Enter}
}
Else
{
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\ok.png
}
Until, !ErrorLevel
Click, %X%, %Y%, L
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\4.png
}
Until, !ErrorLevel
Send, ^s
Sleep, 500
Loop
{
ImageSearch, X, Y, 0, 0, A_ScreenWidth, A_ScreenHeight, %A_ScriptDir%\rel\sv.png
}
Until, !ErrorLevel
Sleep, 500
SendInput, Cancelados
Sleep, 500
Send, ^l
Sleep, 500
SendInput, Desktop\Sintegra\2023\%NOME%{Enter}
Sleep, 500
Send, {Enter 3}
Sleep, 1000
IfWinExist, Confirmar Salvar como
{
Send,{Left}{Enter}
}
Loop
{
IfWinExist, ahk_class TRavePreviewForm
Sleep, 250
Winclose, ahk_class TRavePreviewForm
}
Until, !ErrorLevel
Sleep, 500
WinClose, ahk_exe Relatorios.exe
Sleep, 500
}
}
ExitApp
Return