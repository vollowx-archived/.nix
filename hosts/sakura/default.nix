{ inputs, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware.nix

    ../shared/base
    ../shared/users/vollow

    ../shared/optional/fonts.nix
    ../shared/optional/pipewire.nix
    ../shared/optional/printing.nix
    ../shared/optional/v2raya.nix
    ../shared/optional/virtualisation.nix
    ../shared/optional/xdg-desktop-portal.nix
  ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-compute-runtime
      intel-ocl
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  networking.hostName = "sakura";

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
