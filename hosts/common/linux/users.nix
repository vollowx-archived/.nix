{ pkgs, ... }:

{
  programs.zsh.enable = true;
  users.users.vollow = {
    isNormalUser = true;
    home = "/home/vollow";
    extraGroups = [ "wheel" "networkmanager" "audio" "video" "input" ];
    shell = pkgs.zsh;
  };
}
