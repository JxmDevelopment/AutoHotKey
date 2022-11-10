#Persistent

SetTimer Desligar

Desligar:
{
If (A_TimeIdle > 3600000)
MsgBox, 3, O computador está inativo por 1 hora, O Computador irá desligar em 1 minuto - Continuar utilizando?, 60
IfMsgBox Yes
Reload
else IfMsgBox No
Shutdown, 9
else ifMsgBox Cancel
Exitapp
else ifMsgBox Timeout
Shutdown, 9
}
Return