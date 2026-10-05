status --is-interactive; and rbenv init - fish | source
set -gx GPG_TTY (tty)

# Created by `pipx` on 2024-03-09 04:10:00
set PATH $PATH /Users/fran/.local/bin
direnv hook fish | source


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Rust (rustup)
source "$HOME/.cargo/env.fish"

# Yolo mode
alias yolo='claude --dangerously-skip-permissions'

# Starship
starship init fish | source

/Users/fran/.local/bin/mise activate fish | source # added by https://mise.run/fish

# >>> grok installer >>>
fish_add_path $HOME/.grok/bin
# <<< grok installer <<<

# opencode
fish_add_path /Users/fran/.opencode/bin

# >>> railway initialize >>>
source "$HOME/.railway/env.fish"
# <<< railway initialize <<<
