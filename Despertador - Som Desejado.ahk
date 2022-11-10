#SingleInstance Force
#Persistent
#NoEnv
SetBatchLines, -1
SetWorkingDir, %A_Temp%

Gosub, TrayMenu

Menu, Tray, NoStandard
Menu, Tray, Add, Despertador, TrayClick
Menu, Tray, Add,
Menu, Tray, Standard
Menu, Tray, Default, Despertador
Menu, Tray, Click, 1

Gui, Font, s10 CDefault w400, Arial Bold
Gui, Add, Edit, x16 y29 w220 h23, %File_to_Run%
Gui, Font, s11 CBlue w700, Arial Bold
Gui, Add, GroupBox, x7 y6 w390 h58, Musica do despertador:
Gui, Font, s10 CDefault w400, Arial
Gui, Add, Button, x245 y28 w70 h25, Procurar...
Gui, Add, Button, x323 y28 w65 h25, Tocar
Gui, Font, s11 CBlue Bold, Arial Bold
Gui, Add, GroupBox, x7 y70 w287 h59, Data e Hora:
Gui, Font, s12 CDefault w400, Arial Bold
Gui, Add, DateTime, x16 y93 w125 h25
Gui, Add, DateTime, x150 y93 w133 h25, Time
Gui, Font, s13 CDefault Underline w400, Arial
Gui, Add, Button, x300 y80 w96 h46, Ativar
Gui, Font, s13 CGreen Norm Bold, Tahoma Bold
Gui, Add, Text, x303 y130, Ativado!
GuiControl, Hide, Ativado!
Gui, Font, s8 CDefault w400, Arial
Gui, Add, Button, x300 y152 w96 h20, Visualizar
GuiControl, Hide, Visualizar
Gui, Font, s11 CGreen w700, Arial Bold
FormatTime, Current_Time, , HH:mm:ss
Gui, Add, Text, vDate x60 y133, DATA: %A_DD%/%A_MM%/%A_YYYY%
Gui, Add, Text, vTime x60 y155, HORA: %Current_Time%
Gui, Show, h175 w404 Center, Despertador
SetTimer, Loop, 1000

Gui, +AlwaysOnTop
Return

GuiSize:
If A_EventInfo <> 1 ; Minimized
Return

Loop:
FormatTime, Current_Time, , HH:mm:ss
GuiControl, , Time, HORA: %Current_Time%
GuiControl, , Date, DATA: %A_DD%/%A_MM%/%A_YYYY%
If Alarm_Time = %Current_Time%
Goto, Alarm
Return

ButtonProcurar...:
Gui +OwnDialogs
FileSelectFile, File_to_Run, 3, , Select File, File (*)
ControlSetText, , %File_to_Run%, Despertador
Return

ButtonTocar:
ControlGetText, File_to_Run, , Despertador
If File_to_Run =
{
      Error = No file has been selected.
      Gosub, Error
      Return
}

Run, %File_to_Run%, , UseErrorLevel
If Errorlevel = Error
{
      Error = Unable to find file.
      Cst = On
      Gosub, Error
      Return
}
Return

ButtonVisualizar:
Gui +OwnDialogs
MsgBox, 8192, Despertador, Alarme setado para: %Alarm_Date% as %Alarm_Time%
Return

ButtonAtivar:
If File_to_Run =
{
      Error = Selecione uma musica.
      Gosub, Error
      Return
}

ControlGetText, Alarm_Date, SysDateTimePick321, Despertador
StringSplit, Alarm_MDY, Alarm_Date, /
StringLen, Alarm_M_Cnt, Alarm_MDY1
If Alarm_M_Cnt = 1
      Alarm_Month = 0%Alarm_MDY1%
Else
      Alarm_Month = %Alarm_MDY1%
StringLen, Alarm_D_Cnt, Alarm_MDY2
If Alarm_D_Cnt = 1
      Alarm_Day = 0%Alarm_MDY2%
Else
      Alarm_Day = %Alarm_MDY2%
Alarm_Year = %Alarm_MDY3%
Num_Current_Date = %A_DD%%A_MM%%A_YYYY%
Num_Alarm_Date = %Alarm_Day%%Alarm_Month%%Alarm_Year%

ControlGetText, Alarm_Time, SysDateTimePick322, Despertador
StringSplit, Alarm_HMS, Alarm_Time, %A_Space%:
Alarm_Hour = %Alarm_HMS1%
Alarm_Minute = %Alarm_HMS2%
Alarm_Second = %Alarm_HMS3%
StringLen, Alarm_Hour_Cnt, Alarm_Hour
If Alarm_Hour_Cnt = 1
      Alarm_Hour = 0%Alarm_Hour%

GuiControl, Show, Ativado!
GuiControl, Show, Visualizar
Menu, Tray, Enable, Visualizar
Menu, Tray, Enable, Run
Menu, Tray, Tip, Alarme setado para %Alarm_Date% as %Alarm_Time%
Return

TrayMenu:
Menu, Tray, MainWindow
Menu, Tray, NoStandard
Menu, Tray, DeleteAll
Menu, Tray, Add, Despertador, AlarmClock
Menu, Tray, Add,
Menu, Tray, Add, Visualizar, Visualizar
Menu, Tray, Add, Run, Run
Menu, Tray, Add, Volume, Volume
Menu, Tray, Add, Show, Show
Menu, Tray, Add, Hide, Hide
Menu, Tray, Add, Exit, GuiClose
Menu, Tray, Disable, Visualizar
Menu, Tray, Disable, Run
Menu, Tray, Disable, Show
Menu, Tray, Default, Despertador
Return

AlarmClock:
IfWinExist, Despertador
      WinActivate, Despertador
IfWinNotExist, Despertador
      Goto, Show
Return

Visualizar:
Gui +OwnDialogs
MsgBox, 8192, Despertador, Alarme setado para: %Alarm_Date% as %Alarm_Time%
Return

Run:
Run, %File_to_Run%
Return

Volume:
Run, sndvol32.exe
Return

Show:
Gui, Show, h175 w404 Center, Despertador
Menu, Tray, ToggleEnable, Hide
Menu, Tray, ToggleEnable, Show
Return

Hide:
Gui, Submit, Despertador
Menu, Tray, ToggleEnable, Hide
Menu, Tray, ToggleEnable, Show
Return

Error:
Gui +OwnDialogs
MsgBox, 8208, ERROR, %Error%
If Cst = On
ControlSetText, , , Despertador 
GuiControl, Hide, Ativado!
GuiControl, Hide, Visualizar
Menu, Tray, Disable, Visualizar
Menu, Tray, Disable, Run
Menu, Tray, Tip
Error =
Cst =
Return

Alarm:
Run, %File_to_Run%
Goto, GuiClose
Return

WriteFile(File,Data)
{
      Handle := DllCall("CreateFile","Str",File,"Uint",0x40000000,"Uint",0,"UInt",0,"UInt",4,"Uint",0,"UInt",0)
   Loop
      {
              If StrLen(Data) = 0
                    Break
              StringLeft, Hex, Data, 2
              StringTrimLeft, Data, Data, 2 
              Hex = 0x%Hex%
              DllCall("WriteFile","UInt",Handle,"UChar *",Hex,"UInt",1,"UInt *",UnusedVariable,"UInt",0)
       }
      DllCall("CloseHandle", "Uint", Handle)
         Return
}
Return

WriteFile_1(File_1,Blocks)
{
   Global
         Local Handle, Data_1, Hex
         Handle := DllCall("CreateFile","Str",File_1,"Uint",0x40000000,"Uint",0,"UInt",0,"UInt",4,"Uint",0,"UInt",0)
         Loop, Parse, Blocks, |
            {
                  Data_1 := %A_LoopField%
                  Loop,
                     {
                        If StrLen(Data_1) = 0
                             Break
                        StringLeft, Hex, Data_1, 2
                        StringTrimLeft, Data_1, Data_1, 2
                        Hex = 0x%Hex%
                        DllCall("WriteFile","UInt",Handle,"UChar *",Hex,"UInt",1,"UInt *",UnusedVariable,"UInt",0)
                     }
            }
      DllCall("CloseHandle", "Uint", Handle)
      Return
}
Return

GuiClose:
   Gui, cancel ; Hide the window
   Return

TrayClick:
   GuiControlGet, IsVisible, Visible
   if IsVisible
      Gui, Cancel
   else
      Gui, Show
   Return