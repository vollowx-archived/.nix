{ config, pkgs, ... }:

{
  imports =
    [
      ./_fonts.nix
    ];

  environment.systemPackages = with pkgs; [
    xdg-utils
    brightnessctl
  ];

  services.dbus.enable = true;
}
