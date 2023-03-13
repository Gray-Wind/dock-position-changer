-- reference:
-- change dock position:
-- https://apple.stackexchange.com/questions/356171/is-there-any-way-to-change-the-mac-docks-position-with-a-keyboard-shortcut
-- count displays:
-- https://apple.stackexchange.com/questions/333556/how-do-i-trigger-a-script-when-a-second-monitor-is-attached

property displayCount : missing value
property tempDisplayCount : missing value

countDisplays()

repeat
	repeat until displayCount is greater than 1
		countDisplays()
	end repeat
	displayConnected()
	countDisplays()
	copy displayCount to tempDisplayCount
	repeat until tempDisplayCount is not equal to displayCount
		countDisplays()
	end repeat
	copy displayCount to tempDisplayCount
	if tempDisplayCount is greater than displayCount then
		displayConnected()
	else if tempDisplayCount is equal to displayCount then
		displayDisconnected()
	end if
end repeat

on displayConnected()
	tell application "System Events" to tell dock preferences
		set screen edge to bottom
	end tell
end displayConnected

on displayDisconnected()
	tell application "System Events" to tell dock preferences
		set screen edge to left
	end tell
end displayDisconnected

on countDisplays()
	tell application "Image Events"
		set theDisplays to count of displays
	end tell
	set displayCount to theDisplays
	delay 5 -- How Often To Check How Many Connected Monitors.. In Seconds
end countDisplays
