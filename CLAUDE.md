# CLAUDE.md

## Project Overview

macOS dotfiles managed with **nix-darwin**, **home-manager**, and **nix-homebrew** on Apple Silicon (aarch64-darwin).

## Structure

- `flake.nix` — Main flake: system packages, macOS defaults, Homebrew (brews/casks/masApps), nix-darwin config
- `home.nix` — Home-manager: user programs (zsh, git, vim, yazi), dotfile symlinks via `mkOutOfStoreSymlink`
- `zshrc` — Zsh config loaded by home-manager's `initContent`; contains aliases, env vars, tool inits (fnm, rbenv, sdkman)
- `karabiner.json` — Karabiner Elements config, symlinked to `~/.config/karabiner/` via home-manager
- `flake.lock` — Locked flake inputs (do not edit manually)

## Applying Changes

```sh
darwin-rebuild switch --flake ~/.dotfiles
```

## Conventions

- System-level packages go in `flake.nix` under `environment.systemPackages`
- GUI apps and CLI tools not in nixpkgs go in `homebrew.casks` / `homebrew.brews`
- Mac App Store apps go in `homebrew.masApps` (name = App Store ID)
- User-level programs (with dotfile config) go in `home.nix` using `programs.<name>`
- Dotfiles stored in this repo are symlinked via `mkOutOfStoreSymlink` (not copied), so edits to source files take effect immediately
- Format nix files with `nixpkgs-fmt`
- The machine configuration is named `mbp` (`darwinConfigurations.mbp`)
