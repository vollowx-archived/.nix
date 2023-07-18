{ config, pkgs, ... }:

{
  programs.lf = {
    enable = true;
  };

  xdg.configFile."lf" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/vollow/.nix/conf/lf";
    recursive = true;
  };
}
