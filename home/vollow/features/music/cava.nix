{ pkgs, ... }: {
  home.packages = with pkgs; [ cava ];
  xdg.configFile."cava/config".text =
    builtins.readFile ../../../../conf/cava/config;
}
