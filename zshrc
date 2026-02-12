export EDITOR="vim"
export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1

# keybindings
bindkey '^F' autosuggest-accept

# aliases
alias v=vim
alias y=yazi
alias z=zoxide
alias f=fzf
alias ff=fastfetch
alias c=claude --dangerously-skip-permissions
alias claude-sync='cp -rL ~/.claude/CLAUDE.md ~/.claude/settings.json ~/.claude/skills ~/.dotfiles/claude/'

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

# rbenv
eval "$(rbenv init - zsh)"
export PATH="$HOME/.rbenv/bin:$PATH"

# sdkman
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools