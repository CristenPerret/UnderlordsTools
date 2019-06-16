#SingleInstance force ; Replace an existing script
#NoEnv ; Don't check empty variables to see if they are environment variables
SetDefaultMouseSpeed, 0 ; Move mouse instantly
; Changes the tray icon's tooltip (displayed when mouse hovers over it)
Menu, tray, Tip, Underlords Tools
; Show Tooltip in the tray that the script is active (Quiet)
TrayTip, Underlords Tools, running...,,16
; Makes subsequent hotkeys only function if specified window is active
#IfWinActive Dota Underlords ahk_class SDL_app

; Leaves current match.
$+Escape up:: ; Shift + Escape
LeaveMatch()
Sleep, 420
Requeue()
Return

; Starts Queuing, when at the main menu.
$+K:: ; Shift + K
ReQueue()
return

;Reloads Script - Useful for testing changes quickly
$F5:: ; F5
Reload
return

; Improved Send to Bench ability, by clicking the unit first.
$w:: ; w
BoardtoBench()
Return

; Improved Selling a piece, by clicking the unit first.
$+V:: ; Shift + v
SellBoard()
Return

; Improved Inventory preview, by moving the cursor to the item area
$+I:: ; Shift + I
AssignItems()
Return

; Should allow most users to be able to use my screen regions with little issue
GetAbsolutePixels(RatioX, RatioY) {
	WinGetPos,,, Width, Height
	AbsoluteX := Round(Width * RatioX)
	AbsoluteY := Round(Height * RatioY)
	return [AbsoluteX, AbsoluteY]
}

LeaveMatch() {
BlockInput, on

MMBtn :=GetAbsolutePixels(0.5,0.7) ; First button to leave Match
QConfirm :=GetAbsolutePixels(0.45,0.56) ; Confirm Leaving match button
MMLeave :=GetAbsolutePixels(0.1,0.9) ; MainMenu Leave Match button
;Send, {Esc} ;Remove first Semicolon if you dont have this bound to Escape
Sleep, 120
MouseMove, MMBtn[1], MMBtn[2]
Click,
Sleep, 120
MouseMove, QConfirm[1], QConfirm[2]
Click,
Sleep,120
MouseMove, MMLeave[1], MMLeave[2]
Click,
Sleep, 120
MouseMove,QConfirm[1], QConfirm[2]
Click,
Sleep, 120
BlockInput, off
}

ReQueue() {
MMPlay :=GetAbsolutePixels(0.1,0.9) ; Main Menu Play Button
MMMulti :=GetAbsolutePixels(0.35,0.55) ;MainMenu Multiplayer Button
BlockInput, on
MouseMove, MMPlay[1], MMPlay[2]+20
Click,
Sleep, 120
MouseMove, MMMulti[1], MMMulti[2]
Click,
BlockInput, off
}

BoardtoBench() {
Click, 
Send, {w}
}

SellBoard() {
Click,
Send, {e]
}

AssignItems() {
Gear :=GetAbsolutePixels(0.92,0.55)

Send, {i}
MouseMove, Gear[1], Gear[2]
}