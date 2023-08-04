{ inputs, ... }: {
  programs.obs-studio = { enable = true; };

  xdg.configFile."obs-studio/themes/".source =
    "${inputs.catppuccin-obs}/themes";
}
