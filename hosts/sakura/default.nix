# man 5 configuration.nix
# nixos-help

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware.nix

      ../common
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
    neofetch
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  security.doas.enable = true;
  security.sudo.enable = false;
  services.printing.enable = true;
  services.tlp.enable = true;
  services.openssh.enable = true;
  services.gnome.gnome-keyring.enable = true;

  nix = {
    package = pkgs.nixUnstable;

    gc.automatic = true;
    gc.dates = "12:45";

    optimise.automatic = true;
    optimise.dates = ["12:55"];

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  # man configuration.nix
  # https://nixos.org/nixos/options.html
  system.stateVersion = "23.11";
}