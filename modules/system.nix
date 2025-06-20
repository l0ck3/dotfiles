{ username, pkgs, ... }: {
  system = {
    stateVersion = 5;
    primaryUser = "${username}";

    defaults = {
      menuExtraClock.Show24Hour = true;

      finder = {
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
      };
    };
  };

  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons
      font-awesome
      # nerdfonts
      nerd-fonts.fira-code
    ];
  };
}
