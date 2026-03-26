# dotfiles

My macOS development environment: Fish shell, Tmux, Ghostty, Starship prompt, and more.

## Install

```bash
git clone https://github.com/franccesco/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
./install.sh
```

This creates symlinks from your home directory into the repo. Existing files are backed up as `.bak`.

## What's included

| Directory | Config |
|-----------|--------|
| `fish/` | Fish shell (rbenv, bun, direnv, starship) |
| `tmux/` | Tmux with minimal Ghost theme |
| `starship/` | Starship prompt (default, gruvbox dark/light palettes) |
| `ghostty/` | Ghostty terminal keybinds |
| `git/` | Git config with GPG signing |
| `gh/` | GitHub CLI |
| `scripts/` | Custom tmux status bar scripts (docker, now playing) |
