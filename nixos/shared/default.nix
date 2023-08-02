{ inputs, outputs, lib, config, ... }:
let colors = inputs.nix-colors.colorSchemes.catppuccin-mocha.colors;
in {
  console.colors = [
    colors.base00
    colors.base08
    colors.base0B
    colors.base0A
    colors.base0D
    colors.base0E
    colors.base0C
    colors.base05

    colors.base04
    colors.base08
    colors.base0B
    colors.base0A
    colors.base0D
    colors.base0E
    colors.base0C
    colors.base02
  ];

  security.doas.enable = true;
  security.sudo.enable = false;

  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };
  services.v2raya.enable = true;

  programs.git.enable = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = { LC_TIME = "en_US.UTF-8"; };
    supportedLocales =
      [ "en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8" "ja_JP.UTF-8/UTF-8" ];
  };
  time.timeZone = "Asia/Shanghai";

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

  security.pam.services.swaylock = { text = "auth include login"; };
}
