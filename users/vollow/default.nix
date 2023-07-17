{ config, pkgs, ... }:

{
  users.users.vollow = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" ];
    shell = pkgs.zsh;
  };

  environment = {
    shells = [ pkgs.zsh ];

    systemPackages = with pkgs; [
      git
      wget
      home-manager
      pipewire
      wireplumber
      pulseaudio
      zsh
      unzip
      gnupg
    ];
  };

  home-manager.users.vollow = {
    home = rec {
      inherit (config.system) stateVersion;
      username = "vollow";
      homeDirectory = "/home/${username}";
    };

    imports =
      [
        # Basic
        ./env.nix

        ../../modules/system/apps/home.nix
        ../../modules/cli/apps/home.nix
        ../../modules/graphical/apps/home.nix

        # Choose a WM
        ../../modules/graphical/sway/home.nix
      ];
  };

  imports =
    [
      # Basic
      ../../modules/system
      ../../modules/cli
      ../../modules/graphical

      # Choose a WM
      ../../modules/graphical/sway
    ];
}
