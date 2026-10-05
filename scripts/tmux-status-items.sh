#!/bin/bash
# Aggregates status items - each item ends with | except the last (time is in tmux.conf)

PANE_ID="$1"
items=""

# Claude status
claude=$("$HOME/.tmux/plugins/tmux-claude-status/scripts/read-status.sh" "$PANE_ID" 2>/dev/null)
if [ -n "$claude" ]; then
    items="#[fg=#7aa2f7]${claude} #[fg=#3b4261]│"
fi

# Now playing
music=$("$HOME/.local/bin/now-playing.sh" 2>/dev/null)
# Prefer Apple Music while it plays; otherwise show YouTube in Safari if any
if [[ "$music" != "▶"* ]]; then
    youtube=$("$HOME/.local/bin/youtube-now-playing.sh" 2>/dev/null)
    [ -n "$youtube" ] && music="$youtube"
fi
if [ -n "$music" ]; then
    [ -n "$items" ] && items="${items} "
    items="${items}#[fg=#bb9af7]${music} #[fg=#3b4261]│"
fi

# Docker status
docker=$("$HOME/.local/bin/docker-status.sh" 2>/dev/null)
if [ -n "$docker" ]; then
    [ -n "$items" ] && items="${items} "
    items="${items}${docker} #[fg=#3b4261]│"
fi

# Output items (each already has trailing │)
[ -n "$items" ] && echo "${items}"
