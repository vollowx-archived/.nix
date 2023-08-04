{
  programs.kitty = {
    enable = true;
    shellIntegration = {
      mode = "no-cursor";
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    theme = "Catppuccin-Mocha";
    settings = {
      enable_audio_bell = false;
      inital_window_width = 640;
      inital_window_height = 400;
      remenber_window_size = false;
      scrollback_lines = 10000;
    };
  };
}
