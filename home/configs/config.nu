$env.PATH = [
    $"($env.HOME)/.nix-profile/bin"
    $"/etc/profiles/per-user/($env.USER)/bin"
    "/run/current-system/sw/bin"
    "/nix/var/nix/profiles/default/bin"
    "/usr/local/bin"
    "/usr/bin"
    "/usr/sbin"
    "/bin"
    "/sbin"
]

$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')

$env.config = {
  show_banner: false,
}
