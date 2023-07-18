{ pkgs, ... }:

{
  imports = [
    ./sound.nix
    ./console.nix
    ./networking.nix
    ./users.nix
    ./locale.nix
    ./environment.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
  };

  security.doas.enable = true;
  security.sudo.enable = false;
  security.polkit.enable = true;

  services.openssh.enable = true;
  services.dbus.enable = true;
  services.gnome.gnome-keyring.enable = true;

  programs.dconf.enable = true;
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}
