      export EDITOR="vim"

      # keybindings
      bindkey '^F' autosuggest-accept

      # aliases
      v=vim
      y=yazi
      z=zoxide
      f=fzf
      ff=fastfetch

      # fnm
      eval "$(fnm env --use-on-cd --shell zsh)"

      # rbenv
      eval "$(rbenv init - zsh)"
      export PATH="$HOME/.rbenv/bin:$PATH"

      # sdkman
      export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
      [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"