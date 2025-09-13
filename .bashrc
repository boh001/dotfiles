PS1="[\t] \u@\h:\w\n\$ "

export EDITOR=nvim

# cli.sh
if [[ -f ~/.dotfiles/cli.sh ]]; then
    source ~/.dotfiles/cli.sh
fi

# fnm
eval "$(fnm env --use-on-cd --shell bash)"

# bob neovim path
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
