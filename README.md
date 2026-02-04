# Dotfiles

Chezmoi-managed dotfiles for macOS development environment.

## Structure

Chezmoi uses a naming convention to map source files to their destinations:

- `dot_` prefix → `.` (e.g., `dot_zshrc` → `~/.zshrc`)
- `private_dot_` prefix → `.` with restricted permissions (600)
- Directory structure mirrors your home directory

The source files live in `~/dotfiles`, not the default `~/.local/share/chezmoi`.

## What's Managed

- **`.zshrc`** - Shell configuration with mise, fzf, atuin, zoxide, starship
- **`.config/git/config`** - Git configuration with delta diff viewer
- **`.config/starship.toml`** - Starship prompt theme
- **`.config/wezterm/`** - WezTerm terminal emulator configs
- **`.config/ghostty/config`** - Ghostty terminal emulator (XDG standard path)
- **`.aerospace.toml`** - AeroSpace tiling window manager

## Common Commands

```bash
# See what would change
chezmoi diff

# Apply changes to home directory
chezmoi apply

# Edit a managed file
chezmoi edit ~/.zshrc

# Add a new file to management
chezmoi add ~/.config/foo

# Go to source directory
chezmoi cd

# Pull and apply from remote (if using git)
chezmoi update
```

## Tool Stack

- **Homebrew** - Package manager for CLI tools
- **mise** - Runtime version manager (node, go, bun, elixir, python)
- **Chezmoi** - Dotfile management

## Fresh Install

One command to set up a new machine:

```bash
curl -fsSL https://raw.githubusercontent.com/l0ck3/dotfiles/main/setup.sh | bash
```

This installs Homebrew, chezmoi, applies dotfiles, and installs all Homebrew packages.

After setup, optionally apply macOS preferences:

```bash
bash ~/macos-defaults.sh
```

## Related Files

These files are part of the setup but not managed by chezmoi:

- `~/Brewfile` - Homebrew package list
- `~/macos-defaults.sh` - macOS system preferences script
