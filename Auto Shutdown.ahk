#Persistent

gui, add, text, xm vintro            , Digite o tempo em minutos:
gui, add, edit, x+3 yp-3 w80 vtempo,
gui, add, button, xm w96 vSize2 gconfirmar, Ok
gui, show,, Auto Shutdown ; Titulo
Return

; -------------------------------------
Guiclose:
Exitapp

Delete::ExitApp

Confirmar:
Gui, Submit, NoHide

if tempo is number
{
msgbox,,, O computador será desligado em: %tempo% minutos`nPara cancelar use a tecla 'DELETE', 3
Gui, Cancel
Sleep, tempo * 60000
Shutdown, 12
}
else
{
msgbox, Somente números são aceitos !
}
Return