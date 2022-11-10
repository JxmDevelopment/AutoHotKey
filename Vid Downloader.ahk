NumpadDiv::
{
Send, {F12}
Sleep, 500
Send, {Tab}
SendInput, audio, video
Send, {Enter}
Sleep, 200
CoordMode, Pixel, Window
ImageSearch, FoundX, FoundY, 0, 0, 2560, 1080, C:\AutoHotkey\Scripts\IMG\link.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY%, M
If ErrorLevel
Return
Sleep, 4000
Click, R, 1214, 519 ; Lado Direito Do Mouse No Video
CoordMode, Pixel, Window ; Salvar
ImageSearch, FoundX, FoundY, 0, 0, 2560, 1080, C:\AutoHotkey\Scripts\IMG\save.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY% L
If ErrorLevel
Return
Sleep, 3000
Send, {Enter}
Send, {Enter}
Sleep, 1000
Send, ^w
Sleep, 500
Send, {F12}
}
Return

NumpadMult::
{
Send, {F12}
Sleep, 500
Send, {Tab}
SendInput, video source
Send, {Enter}
Sleep, 200
CoordMode, Pixel, Window
ImageSearch, FoundX, FoundY, 0, 0, 2560, 1080, C:\AutoHotkey\Scripts\IMG\link.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY%, M
If ErrorLevel
Return
Sleep, 3000
Click, R, 1214, 519 ; Lado Direito Do Mouse No Video
CoordMode, Pixel, Window ; Salvar
ImageSearch, FoundX, FoundY, 0, 0, 2560, 1080, C:\AutoHotkey\Scripts\IMG\save.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY% L
If ErrorLevel
Return
Sleep, 2000
Send, {Enter}
Send, {Enter}
Sleep, 500
Send, ^w
Sleep, 500
Send, {F12}
}
Return

; ->> VIDEO YOUTUBE <<-

NumpadSub::
{
Send, ^+e ; Ctrl+Shift+E
Sleep, 500
Send, {F5}
Sleep, 1000
Click, 379, 903 ; Click - Network
Sleep, 1500
Send, {WheelUp 2}
Sleep, 1500
Click, 375, 882, 2 ; Click - Nova Aba
Sleep, 1000
Click, Down, 1497, 66
MouseMove, 2471, 62 ; Chega até o final do link
Sleep, 500
Click, 1517, 64
Sleep, 700
MouseClickDrag, L, 1435, 64, 2559, 98 ; Apagar Range
Sleep, 500
Send, {Backspace}
Sleep, 500
Send, {Enter}
Sleep, 500
Click, R, 1214, 519 ; Salvar - Video
CoordMode, Pixel, Window ; Salvar
ImageSearch, FoundX, FoundY, 0, 0, 2560, 1080, C:\AutoHotkey\Scripts\IMG\save.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY% L
If ErrorLevel
Return
Sleep, 250
s := (s := "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z") "," s "," s
Sort, s, Random D,
i := SubStr(StrReplace(s, ","), 1, 4)
Sleep, 250
Send, % i
Sleep, 500
Send, {Enter}
Send, {Enter}
Sleep, 500
Send, ^w
Sleep, 500
Send, {F12}
}
Return

; ->> AUDIO YOUTUBE <<-

NumpadAdd::
{
Send, ^+e ; Ctrl+Shift+E
Sleep, 500
Send, {F5}
Sleep, 1000
Click, 379, 903 ; Click - Network
Sleep, 1500
Send, {WheelUp 2}
Sleep, 1500
Click, 375, 913, 2 ; 2x L Mouse ; Click - Nova Aba
Sleep, 1000
MouseClickDrag, L, 1652, 62, 2559, 98 ; Chega até o final do link
Sleep, 500
Click, 1652, 62
Sleep, 700
MouseClickDrag, L, 1435, 64, 2559, 98 ; Apagar - Range
Sleep, 500
Send, {Backspace}
Sleep, 500
Send, {Enter}
Sleep, 500
Click, R, 1214, 519 ; Salvar - Video
CoordMode, Pixel, Window ; Salvar
ImageSearch, FoundX, FoundY, 0, 0, 2560, 1080, C:\AutoHotkey\Scripts\IMG\save.png
If ErrorLevel = 0
Click, %FoundX%, %FoundY% L
If ErrorLevel
Return
Sleep, 250
s := (s := "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z") "," s "," s
Sort, s, Random D,
i := SubStr(StrReplace(s, ","), 1, 4)
Sleep, 250
Send, % i
Sleep, 500
Send, {Enter}
Send, {Enter}
Sleep, 500
Send, ^w
Sleep, 500
Send, {F12}
}
Return

NumpadDot::

Text := "Numpad / = Baixa Video [Opção 1]`nNumpad * = Baixa Video [Opção 2]`nNumpad - = Baixa Video Do Youtube`nNumpad + = Baixa Audio Do Youtube"

Result := MsgBoxEx(Text, "Atalhos:", "", [290, "imageres.dll"], "", "", 0, 0, "s10 bold c0x000000", "Comic Sans MS")

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
Return