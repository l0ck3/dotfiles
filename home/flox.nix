{ config, lib, hostname, ... }: 
let
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  home.file.".flox/.gitattributes".source = link "${config.home.homeDirectory}/dotfiles/home/configs/flox/.gitattributes";
  home.file.".flox/.gitignore".source = link "${config.home.homeDirectory}/dotfiles/home/configs/flox/.gitignore";
  home.file.".flox/env.json".source = link "${config.home.homeDirectory}/dotfiles/home/configs/flox/env.json";
  home.file.".flox/env/manifest.toml".source = link "${config.home.homeDirectory}/dotfiles/home/configs/flox/manifest.toml";
}
