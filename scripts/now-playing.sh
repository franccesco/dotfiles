#!/bin/bash
osascript -e '
if application "Music" is running then
    tell application "Music"
        if player state is playing then
            set icon to "▶ "
        else if player state is paused then
            set icon to "⏸ "
        else
            return ""
        end if
        set trackName to name of current track
        set artistName to artist of current track
        return icon & artistName & " - " & trackName
    end tell
end if
' 2>/dev/null
