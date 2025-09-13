#!/bin/bash

DOTFILES="$HOME/.dotfiles"

create_symlink_with_backup() {
    local source="$1"
    local target="${2%/}"
    
    # Check if target exists
    if [[ -e "$target" ]] || [[ -L "$target" ]]; then
        echo "Target exists, creating backup: $target -> $target.backup"
        mv "$target" "$target.backup"
    fi
    
    # Create symlink
    ln -s "$source" "$target"
    echo "Symlink created: $target -> $source"
}

link_to_home() {
    create_symlink_with_backup "$DOTFILES/$1" "$HOME/$1"
}

link_to_config() {
    if [[ ! -d "$HOME/.config" ]]; then
        mkdir -p "$HOME/.config"
    fi

    create_symlink_with_backup "$DOTFILES/$1" "$HOME/.config/$1"
}
