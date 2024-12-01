{...}: {
  system = {
    stateVersion = 5;    

    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      /usr/sbin/softwareupdate --install-rosetta --agree-to-license
      defaultbrowser browser

      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      menuExtraClock.Show24Hour = true;

      finder = {
        ShowPathbar = true;
        _FXShowPosixPathInTitle = true;
      };
    };
  };

  security.pam.enableSudoTouchIdAuth = true;
}
