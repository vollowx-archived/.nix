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

        ../../modules/tools
        ../../modules/gui

        # Choose a WM
        ../../modules/desktop/sway/home.nix
      ];
  };

  imports =
    [
      # Choose a WM
      ../../modules/desktop/sway
    ];
}
