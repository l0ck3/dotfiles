{pkgs, ...}: {
  # Windsurf configuration
  programs.windsurf = {
    enable = true;
    settings = {
      # Add your Windsurf-specific settings here
      # For example:
      # theme = "dark";
      # shortcuts = {};
    };
  };
}
