{ inputs, outputs, ... }: {
  imports = [
    ./console.nix
    ./fish.nix
    ./locale.nix
    ./nix.nix
    ./openssh.nix
    ./security.nix
  ];

  networking.networkmanager = {
    enable = true;
    wifi.macAddress = "random";
  };

  boot.loader.systemd-boot.enable = true;

  programs.git.enable = true;

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications

      # You can also add overlays exported from other flakes:
      inputs.neovim-nightly-overlay.overlays.default
      inputs.nixpkgs-wayland.overlays.default

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
      allowUnfreePredicate = (_: true);
    };
  };
}
