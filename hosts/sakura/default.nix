{ config, pkgs, colors, ... }:

{
  imports = [ ../common/linux ./hardware.nix ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [ intel-media-driver intel-compute-runtime ];
  };
  hardware.bluetooth.enable = true;
  services.printing.enable = true;
  services.tlp.enable = true;

  networking.hostName = "sakura";
  system.stateVersion = "23.11";
}
