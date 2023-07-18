{
  programs.kitty = {
    enable  = true;
    shellIntegration.enableZshIntegration = true;
    theme = "Catppuccin-Mocha";
    settings = {
      shell_integration = "no-cursor";
      enable_audio_bell = false;

      initial_window_width = 640;
      initial_window_height = 400;
      remember_window_size = false;

      scrollback_lines = 10000;
      
      cursor_shape = "underline";
    };
  };
}
