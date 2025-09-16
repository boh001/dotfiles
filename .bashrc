fastfetch 

export PS1="[\t] \u@\h:\w\n\$ "

export EDITOR=nvim

# use bash-completion, if available
if [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

# cli.sh
CLI="$HOME/.dotfiles/cli.sh"
if [[ -f "$CLI" ]]; then
  source "$CLI"
fi

# fnm
eval "$(fnm env --use-on-cd --shell bash)"

# bob neovim path
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
