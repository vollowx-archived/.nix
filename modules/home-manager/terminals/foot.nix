{ pkgs, config, ... }:
let inherit (config.colorscheme) colors;
in {
  home.packages = with pkgs; [ libsixel ];
  programs.foot = {
    enable = true;
    settings = {
      main = { dpi-aware = "yes"; };
      colors = {
        foreground = colors.base05; # Text
        background = colors.base00; # Base
        regular0 = colors.base03; # Surface 1
        regular1 = colors.base08; # red
        regular2 = colors.base0B; # green
        regular3 = colors.base0A; # yellow
        regular4 = colors.base0D; # blue
        regular5 = colors.base0E; # mauve
        regular6 = colors.base0C; # teal
        regular7 = colors.base05; # Subtext 1
        bright0 = colors.base04; # Surface 2
        bright1 = colors.base08; # red
        bright2 = colors.base0B; # green
        bright3 = colors.base0A; # yellow
        bright4 = colors.base0D; # blue
        bright5 = colors.base0E; # mauve
        bright6 = colors.base0C; # teal
        bright7 = colors.base02; # Subtext 0
      };
    };
  };
}
