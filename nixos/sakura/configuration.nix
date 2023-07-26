{ inputs, outputs, lib, config, pkgs, ... }: {
  # You can import other NixOS modules here
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    outputs.nixosModules.display.base
    outputs.nixosModules.display.wayland

    # Or modules from other flakes (such as nixos-hardware):
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    # You can also split up your configuration and import pieces of it here:
    ../shared
    ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications

      # You can also add overlays exported from other flakes:
      inputs.neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  nix = {
    # This will add each flake input as a registry
    # To make nix3 commands consistent with your flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # This will additionally add your inputs to the system's legacy channels
    # Making legacy nix commands consistent as well, awesome!
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}")
      config.nix.registry;

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Deduplicate and optimize nix store
      auto-optimise-store = true;
    };
  };

  hardware.opengl =
    # let
    #   fn = oa: {
    #     nativeBuildInputs = oa.nativeBuildInputs ++ [ pkgs.glslang ];
    #     mesonFlags = oa.mesonFlags ++ [ "-Dvulkan-layers=device-select,overlay" ];
    #     postInstall = oa.postInstall + ''
    #       mv $out/lib/libVkLayer* $drivers/lib
    #
    #       # Device Select layer
    #       layer=VkLayer_MESA_device_select
    #       substituteInPlace $drivers/share/vulkan/implicit_layer.d/''${layer}.json \
    #         --replace "lib''${layer}" "$drivers/lib/lib''${layer}"
    #
    #       # Overlay layer
    #       layer=VkLayer_MESA_overlay
    #       substituteInPlace $drivers/share/vulkan/explicit_layer.d/''${layer}.json \
    #         --replace "lib''${layer}" "$drivers/lib/lib''${layer}"
    #     '';
    #   };
    # in
    with pkgs; {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      # package = (mesa.overrideAttrs fn).drivers;
      # package32 = (pkgsi686Linux.mesa.overrideAttrs fn).drivers;
      extraPackages = with pkgs; [
        intel-media-driver
        intel-compute-runtime
        intel-ocl
      ];
    };

  networking.hostName = "sakura";

  boot.loader.systemd-boot.enable = true;

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
