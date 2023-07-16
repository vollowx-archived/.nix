{ config, pkgs, ... }:

{
  imports =
    [
      ./_fonts.nix
    ];

  environment.systemPackages = with pkgs; [
    kitty
    xdg-utils
    brightnessctl
  ];

  services.dbus.enable = true;
}