{ config, ... }:
let inherit (config.colorscheme) colors;
in {
  programs.swaylock = {
    settings = {
      daemonize = true;

      line-uses-ring = false;
      ignore-empty-password = true;
      show-failed-attempts = false;

      color = "00000000";

      bs-hl-color = "#${colors.base08}";
      key-hl-color = "#${colors.base0B}";

      inside-color = "#${colors.base01}";
      inside-clear-color = "#${colors.base01}";
      inside-ver-color = "#${colors.base01}";
      inside-wrong-color = "#${colors.base01}";

      line-color = "#${colors.base00}";
      line-ver-color = "#${colors.base00}";
      line-clear-color = "#${colors.base00}";
      line-wrong-color = "#${colors.base00}";

      ring-color = "#${colors.base04}";
      ring-clear-color = "#${colors.base06}";
      ring-ver-color = "#${colors.base0D}";
      ring-wrong-color = "#${colors.base08}";

      separator-color = "00000000";

      text-color = "#${colors.base04}";
      text-clear-color = "#${colors.base06}";
      text-ver-color = "#${colors.base0D}";
      text-wrong-color = "#${colors.base08}";
    };
  };
}
