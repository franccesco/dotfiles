#!/bin/bash
# Toggle playback: Apple Music if it's playing, else the YouTube tab in Safari, else Apple Music.
music_state=$(osascript -e 'if application "Music" is running then tell application "Music" to return player state as string' 2>/dev/null)

if [ "$music_state" != "playing" ]; then
    handled=$(osascript -e '
    if application "Safari" is running then
        tell application "Safari"
            set target to missing value
            repeat with w in windows
                repeat with t in tabs of w
                    set u to URL of t
                    if u contains "youtube.com/watch" or u contains "music.youtube.com" then
                        set isPlaying to do JavaScript "(function(){var v=document.querySelector(\"video\");return !!v && !v.paused})()" in t
                        if isPlaying is true then
                            do JavaScript "document.querySelector(\"video\").pause()" in t
                            return "yes"
                        end if
                        if target is missing value then set target to t
                    end if
                end repeat
            end repeat
            if target is not missing value then
                do JavaScript "document.querySelector(\"video\").play()" in target
                return "yes"
            end if
        end tell
    end if
    return "no"' 2>/dev/null)
    [ "$handled" = "yes" ] && exit 0
fi

osascript -e 'tell application "Music" to playpause'
