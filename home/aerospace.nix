{...}: {
  # Source aerospace config from the home-manager store
  home.file.".aerospace.toml" = {
    source = ./configs/aerospace/aerospace.toml;
  };
}