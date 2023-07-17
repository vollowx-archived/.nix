{ config, pkgs, ... }:

{
  imports = [];

  programs.zsh.enable = true;

  services.v2raya.enable = true;
}
