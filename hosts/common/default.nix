{ config, pkgs, lib, ... }:

with config;
with lib;
with pkgs; {
  users = {
    defaultUserShell = bash;
    mutableUsers = true;

    users = {
      root = {
        home = "/root";
        uid = ids.uids.root;
        group = "root";
        initialHashedPassword = mkDefault "!";
      };
    };
  };

  programs.zsh.enable = true;
  services.v2raya.enable = true;
}
