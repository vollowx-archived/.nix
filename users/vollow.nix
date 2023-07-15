{ config, pkgs, ... }:

{
  users.users.vollow = {
    isNormalUser = true;
    home = "/home/vollow";
    extraGroups = [ "wheel" "networkmanager" "video" ];
    createHome = true;
    shell = pkgs.zsh;
  };

  home-manager.users.vollow = {
    imports = [];

    programs.git = {
      enable = true;
      userName = "vollowx";
      userEmail = "muffinslog@proton.me";
    };
  };
}
