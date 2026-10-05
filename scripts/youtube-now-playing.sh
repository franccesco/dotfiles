#!/bin/bash
# Prints the YouTube video playing in Safari, e.g. "▶ morning frog."
# Play/pause state needs Safari > Settings > Developer > "Allow JavaScript from Apple Events".
# Without it, the title is shown with a ♪ icon.
osascript -e '
if application "Safari" is running then
    tell application "Safari"
        set fallback to ""
        repeat with w in windows
            repeat with t in tabs of w
                set u to URL of t
                if u contains "youtube.com/watch" or u contains "music.youtube.com" then
                    set ttl to name of t
                    set state to ""
                    try
                        set state to do JavaScript "(function(){var v=document.querySelector(\"video\");return v?(v.paused?\"paused\":\"playing\"):\"\"})()" in t
                    end try
                    if state is "playing" then return "▶ " & ttl
                    if state is "paused" then
                        if fallback is "" then set fallback to "⏸ " & ttl
                    else if fallback is "" then
                        set fallback to "♪ " & ttl
                    end if
                end if
            end repeat
        end repeat
        return fallback
    end tell
end if
' 2>/dev/null | sed -E 's/\(([0-9]+)\) //; s/ - YouTube( Music)?$//' | cut -c1-60
