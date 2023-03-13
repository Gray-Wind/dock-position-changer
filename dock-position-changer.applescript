-- reference:
-- change dock position:
-- https://apple.stackexchange.com/questions/356171/is-there-any-way-to-change-the-mac-docks-position-with-a-keyboard-shortcut
-- count displays:
-- https://apple.stackexchange.com/questions/333556/how-do-i-trigger-a-script-when-a-second-monitor-is-attached

property displayCount : missing value
property tempDisplayCount : missing value

repeat
	countDisplays()
	if displayCount is equal to 1 and isDockInBottom() is equal to true then
		moveDockToLeft()
	end if
	if displayCount is greater than 1 and isDockInBottom() is equal to false then
		moveDockToBottom()
	end if
	delay 5 -- How Often To Check How Many Connected Monitors.. In Seconds
end repeat

on moveDockToBottom()
	tell application "System Events" to tell dock preferences
		set screen edge to bottom
	end tell
end moveDockToBottom

on moveDockToLeft()
	tell application "System Events" to tell dock preferences
		set screen edge to left
	end tell
end moveDockToLeft

on countDisplays()
	tell application "Image Events"
		set theDisplays to count of displays
	end tell
	set displayCount to theDisplays
end countDisplays

on isDockInBottom()
	tell application "System Events" to tell dock preferences
		return screen edge is bottom
	end tell
end isDockInBottom
