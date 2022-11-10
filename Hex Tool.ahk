; ---> GUI <---

Gui, Cor:New
Gui, Cor:+AlwaysOnTop +Resize
Gui, Cor:Show, w200 h200 x0 y0, Pixel HEX
SetTimer, gui_cor, 0

; ---> MOSTRAR COR <---

gui_cor:
MouseGetPos, xcor, ycor
PixelGetColor, corexibida, %xcor%, %ycor%, RGB
Gui, Cor:Color, %corexibida%
return

; ---> COPIAR <---

Alt::
MouseGetPos, x, y
PixelGetColor, cor, %x%, %y%
Clipboard := cor
ToolTip, COR COPIADA!
Sleep, 500
ToolTip
return

CorGuiClose:
ExitApp