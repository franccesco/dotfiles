#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -L "$dst" ]; then
        rm "$dst"
    elif [ -e "$dst" ]; then
        echo "  backup: $dst -> ${dst}.bak"
        mv "$dst" "${dst}.bak"
    fi
    ln -s "$src" "$dst"
    echo "  linked: $dst -> $src"
}

echo "Installing dotfiles from $DOTFILES"
echo

# Git
link "$DOTFILES/git/.gitconfig"        "$HOME/.gitconfig"
link "$DOTFILES/git/.gitignore_global" "$HOME/.gitignore_global"

# Fish
link "$DOTFILES/fish/config.fish" "$HOME/.config/fish/config.fish"

# Tmux
link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Starship
link "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"

# Ghostty
link "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"

# GitHub CLI
link "$DOTFILES/gh/config.yml" "$HOME/.config/gh/config.yml"

# Sublime Text
SUBLIME_USER="$HOME/Library/Application Support/Sublime Text/Packages/User"
link "$DOTFILES/sublime-text/Preferences.sublime-settings"              "$SUBLIME_USER/Preferences.sublime-settings"
link "$DOTFILES/sublime-text/Package Control.sublime-settings"          "$SUBLIME_USER/Package Control.sublime-settings"
link "$DOTFILES/sublime-text/ayu-dark.sublime-color-scheme"             "$SUBLIME_USER/ayu-dark.sublime-color-scheme"
link "$DOTFILES/sublime-text/ayu-dark.sublime-color-scheme.backup"      "$SUBLIME_USER/ayu-dark.sublime-color-scheme.backup"
link "$DOTFILES/sublime-text/ayu-mirage.sublime-color-scheme"           "$SUBLIME_USER/ayu-mirage.sublime-color-scheme"

# Custom scripts
mkdir -p "$HOME/.local/bin"
for script in "$DOTFILES/scripts/"*.sh; do
    name="$(basename "$script")"
    link "$script" "$HOME/.local/bin/$name"
done

echo
echo "Done! All dotfiles linked."
