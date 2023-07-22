{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/vollow

    ../common/optional/greetd.nix
    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optional/wireless.nix
  ];

  # TODO: theme "greeter" user GTK instead of using misterio to login
  services.greetd.settings.default_session.user = "vollow";

  networking = {
    hostName = "sakura";
    useDHCP = true;
    interfaces.enp8s0 = {
      useDHCP = true;
      wakeOnLan.enable = true;
    };
  };

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    binfmt.emulatedSystems = [ "aarch64-linux" "i686-linux" ];
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ intel-media-driver intel-compute-runtime ];
      driSupport = true;
      driSupport32Bit = true;
    };
  };

  system.stateVersion = "23.05";
}
