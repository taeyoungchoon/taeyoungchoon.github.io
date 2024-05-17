;; pre: turn kakao talk on, then open

;; debug
;; MsgBox, hello, world

;; vars
NumberOfImages = 3

;; init
CoordMode, Mouse, Screen

;; MsgBox, hello, world

;; click profile image
Click, 1530, 120, 0
Click, 1530, 120

;; view profile
Click, 1264, 453, 0 
Click, 1264, 453

;; https://www.autohotkey.com/boards/viewtopic.php?t=29712
;; Loop 3
Loop % NumberOfImages
;; Loop %NumberOfImages%
{
	;; save
	Click, 1020, 562, 0 
	Click, 1020, 562

	sleep 300

	;; save!
	Click, 1300, 639, 0 
	Click, 1300, 639

	sleep 300

	;; next
	Click, 1057, 330, 0 
	Click, 1057, 330

	Sleep 300
}

Escape::
ExitApp
Return