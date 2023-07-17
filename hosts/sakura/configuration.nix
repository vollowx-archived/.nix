# man 5 configuration.nix
# nixos-help

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ../../users/vollow
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

  networking.hostName = "sakura";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "en_US.UTF-8";

  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
    ];
  };

  sound.enable = true;
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    coreutils
    usbutils
    file
    curl
    git
    unzip
    wget
    exa
    duf
    neovim
    openjdk
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.printing.enable = true;
  services.tlp.enable = true;
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;

  nix.package = pkgs.nixUnstable;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # man configuration.nix
  # https://nixos.org/nixos/options.html
  system.stateVersion = "23.11";
}
