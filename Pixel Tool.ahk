;MButton: Ativa o script e navega entre as suas opções ( Pixel Tool / Hex Tool )
;Alt: Copia a cor selecionada. [ Estando no modo Hex Tool ]
;RButton: Seleciona a área na qual você deseja copiar as coordenadas. [ Estando no modo Pixel Tool ]
;End: Fecha o programa.

CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

global tool := 0

MButton::

tool++

if (tool > 2)
{
	tool := 0
}
if (tool = 0)
{
	ToolTip
	SetTimer, area, Off
}
if (tool = 1)
{
	Gui, Area:Destroy
	Gui, Cor:New
	Gui, Cor:+AlwaysOnTop +Resize
	Gui, Cor:Show, w200 h200 x0 y0, SPY
	SetTimer, gui_cor, 0
}
if (tool = 2)
{
	Gui, Cor:Destroy
	SetTimer, gui_cor, Off
	SetTimer, area, 0
	Gui, Area:New
	Gui, Area:-Caption Border +AlwaysOnTop
	Gui, Area:Color, 0xD0FFFF
	Gui, Area:+LastFound
	WinSet, Transparent, 50
}
return

#if (tool = 1)

Alt::
MouseGetPos, x, y
PixelGetColor, cor, %x%, %y%
Clipboard := cor
ToolTip, COR COPIADA!
Sleep, 500
ToolTip
return

gui_cor:
MouseGetPos, xgui, ygui
PixelGetColor, cor2, %xgui%, %ygui%, RGB
Gui, Cor:Color, %cor2%
return

Up::
MouseGetPos, x, y
MouseMove, % x, % y - 1
return

Down::
MouseGetPos, x, y
MouseMove, % x, % y + 1
return

Left::
MouseGetPos, x, y
MouseMove, % x - 1, % y
return

Right::
MouseGetPos, x, y
MouseMove, % x + 1, % y
return

#if (tool = 2)

RButton::
SetTimer, area, Off
MouseGetPos, x1, y1
while GetKeyState("RButton", "P")
{
	ToolTip, %x1%`, %y1%`, %x2%`, %y2%
	MouseGetPos, x2, y2
	x3 := x2 - x1
	y3 := y2 - y1
	Gui, Area:Show, x%x1% y%y1% w%x3% h%y3%
}
ToolTip
Gui, Area:Cancel
Clipboard = %x1%, %y1%, %x2%, %y2%
ToolTip, ÁREA COPIADA!
Sleep, 1000
ToolTip
SetTimer, area, 0
return

area:
if (tool = 0)
{
	SetTimer, area, Off
}
else
{
	ToolTip, Selecione uma área
}
return

#if

CorGuiClose:
ExitApp

End::
ExitApp