{
  imports = [ ./_home-gtk.nix ];
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "image/jpg" = "imv.desktop";
        "image/jpeg" = "imv.desktop";
        "image/png" = "imv.desktop";
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
  programs.kitty = {
    enable  = true;
    shellIntegration.enableZshIntegration = true;
    theme = "Catppuccin-Mocha";
    settings = {
      enable_audio_bell = false;

      inital_window_width = 640;
      inital_window_height = 400;
      remenber_window_size = false;

      scrollback_lines = 10000;
      
      cursor_shape = "underline";
    };
  };
}
