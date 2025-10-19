{ ... }: {
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      custom.flox = {
        command = "if [ -n \"$FLOX_ENV\" ]; then echo \"in flox env: $FLOX_ENV_DESCRIPTION\"; fi";
        when = "[ -n \"$FLOX_ENV\" ] && [ \"$FLOX_ENV_DESCRIPTION\" != \"default\" ]";
        format = "[[$output]($style)]($style) ";
        style = "bold green";
        description = "Show active Flox environment";
      };

      character = {
        success_symbol = "[›](bold green)";
        error_symbol = "[›](bold red)";
      };
    };
  };
}